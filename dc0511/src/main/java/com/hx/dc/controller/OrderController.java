package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Goods;
import com.hx.dc.entity.GoodsOrder;
import com.hx.dc.entity.Order;
import com.hx.dc.entity.Order_Details;
import com.hx.dc.service.GoodsOrderService;
import com.hx.dc.service.GoodsService;
import com.hx.dc.service.OrderDetailsService;
import com.hx.dc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by SuperMr.gong on 2020/5/25.
 */
@Controller
@RequestMapping("order")

public class OrderController extends BaseAction {
    @Autowired
    HttpSession session;
    @Resource
    private GoodsOrderService goodsOrderService;
    @Resource
    private OrderService orderService;
    @Resource
    private OrderDetailsService orderDetailsService;
    @Resource
    private GoodsService goodsService;
    @RequestMapping(value="/select")
    public String string(Order order){


        return "forward:/WEB-INF/index.jsp";
    }
    @RequestMapping("selectPage")
    @ResponseBody
    public Object selectPage(Order order,Integer page,Integer rows){
        PageInfo<Order> pageInfo =  orderService.selectPage(order,page,rows);
        Map<String,Object> pageMap = new HashMap<>();
        pageMap.put("total",pageInfo.getTotal());//获取总记录数
        pageMap.put("rows",pageInfo.getList());//获取用户列表
        return pageMap;
    }
    @RequestMapping("details")
    @ResponseBody
    public Object details(Order order){
        session.setAttribute("a",order);
        return null;
    }
    @RequestMapping("makeorder")
    @ResponseBody
    public Object makeorder(int[] ids,int [] num){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date dt = new Date();
        String data = df.format(dt);
        Random r = new Random();
       int s = r.nextInt(99);
        SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");
        String d = df2.format(dt)+s;
        Order order = new Order();
        List<Goods> list = new ArrayList<>();
        for (int i=0;i<ids.length;i++){
            Goods g = new Goods();
            g.setGoodsId(ids[i]);
            list.add(g);
        }
        List<Goods> returnlist = goodsService.selectId(list);
        List<Order_Details> odlist=new ArrayList<>();
        int o=0;
        int sum = 0;
        for (Goods g:returnlist) {
            Order_Details od=new Order_Details();
            od.setGoodsName(g.getGoodsName());
            od.setGoodNumber(num[o]);
            od.setGoodsPrice(g.getGoodsPrice());
            od.setOrderDetailsAmount(g.getGoodsPrice()*num[o]);
            od.setOrderId(d);
            od.setOrderDetailsPayment("2");
            od.setOrderDetailsPaytime(data);
            od.setGoodsId(g.getGoodsId());
            sum+=g.getGoodsPrice()*num[o];
            o++;
            odlist.add(od);
        }
        order.setOrderMoney(sum);
        order.setOrderAmount(sum);
        order.setDiningtableId(s);
        order.setDepId(1001);
        order.setOrderStatus("1");
        order.setOrderPayment("2");
        order.setOrderProgress("2");
        order.setOrderId(d);
        order.setOrderPaytime(dt);
        order.setOrderTime(dt);
        order.setOrderEattype("1");
        int j = orderService.insert(order);
        if (j > 0) {
            System.out.println("订单插入成功");
        }else {
            System.out.println("插入失败");
        }
       int g = orderDetailsService.insert(odlist);

        if (g > 0) {
            System.out.println("订单明细插入成功");
        }else {
            System.out.println("明细插入失败");
        }
//生成后厨订单表
        int q = 0;
        List<GoodsOrder> goodsOrders = new ArrayList<>();
        for (Goods a:returnlist
                ) {
            GoodsOrder goodsOrder = new GoodsOrder();
            goodsOrder.setGoodsName(a.getGoodsName());
            goodsOrder.setOrderId(d);
            goodsOrder.setDiningtableId(s);
            goodsOrder.setGoodsNumber(a.getGoodsId());
            goodsOrder.setGoodsImage(a.getGoodsImage());
            goodsOrder.setPlaceNumber(num[q]);
            goodsOrder.setCookNumber(num[q]);
            goodsOrder.setStartTime(dt);
            goodsOrder.setState(1);
            goodsOrders.add(goodsOrder);

            q++;
        }
        int go =  goodsOrderService.insertId(goodsOrders);
        if(go>0){
            System.out.println("插入后厨成功");
        }else{
            System.out.println("插入失败");
        }
        Map m=new HashMap();
        m.put("a","操作成功");
        return m;
    }
}
