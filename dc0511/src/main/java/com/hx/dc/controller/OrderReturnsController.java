package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Order;
import com.hx.dc.entity.Order_Returns;
import com.hx.dc.service.DetailsService;
import com.hx.dc.service.OrderReturnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by SuperMr.gong on 2020/5/25.
 */
@Controller
@RequestMapping("orderReturns")

public class OrderReturnsController extends BaseAction {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    HttpSession session;
    @Resource
    private OrderReturnsService orderReturnsService;
    private DetailsService detailsService;
    @RequestMapping(value="/select")
    public String string(Order order){
        System.out.println("---action.dept:"+order);
      /*  Order o=orderService.select(order.getOrderId());*/
       // System.out.println(o);
        return "forward:/WEB-INF/main.jsp";
    }
    @RequestMapping("selectPage")
    @ResponseBody
    public Object selectPage(Order_Returns order_returns, Integer page, Integer rows){
        PageInfo<Order_Returns> pageInfo =  orderReturnsService.selectPage(order_returns, page, rows);
        Map<String,Object> pageMap = new HashMap<>();
        pageMap.put("total",pageInfo.getTotal());//获取总记录数
        pageMap.put("rows",pageInfo.getList());//获取用户列表

        return pageMap;
    }
    @RequestMapping("turn")
    @ResponseBody
    public Object turn(Order_Returns order_returnst){
        if (order_returnst.getReturnStatus().equals("1")){
            order_returnst.setReturnStatus("已退款");
        }else {
            order_returnst.setReturnStatus("未退款");
        }
        if(order_returnst.getReturnReason().equals("1")){
            order_returnst.setReturnReason("整单取消");
        }else{
            order_returnst.setReturnReason("其它原因");
        }
        if (order_returnst.getOrderPayment().equals("1")){
            order_returnst.setOrderPayment("微信支付");
        }else{
            order_returnst.setOrderPayment("支付宝支付");
        }
        if (order_returnst.getReturnAuditStatus().equals("1")){
            order_returnst.setReturnAuditStatus("已审核");
        }else{
            order_returnst.setReturnAuditStatus("未审核");
        }
        if (order_returnst.getReturnAuditExplain().equals("1")){
            order_returnst.setReturnAuditExplain("整单取消（允许)");
        }
        if (order_returnst.getReturnAuditExplain().equals("2")){
            order_returnst.setReturnAuditExplain("其它原因（允许)");
        }else {
            order_returnst.setReturnAuditExplain("未通过审核");
        }
        session.setAttribute("s",order_returnst);
        /*return "forward:shopping.jsp";*/
        Map m=new HashMap();
        m.put("a","成功");
        return m;
    }
}
