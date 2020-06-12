package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.GoodsOrder;
import com.hx.dc.handler.SystemWebSocketHandler;
import com.hx.dc.service.GoodsOrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by my on 2020/5/29.
 */

//后厨订单管理控制器
//(1,待制作 2，正在制作，3，制作完成，4，以上菜 5，订单退订 ,6，删除)
@Controller
@RequestMapping("/goodsOrder")
public class GoodsOrderController extends BaseController {

    @Resource
    GoodsOrderService goodsOrderService;



    @RequestMapping("OrderSelectList")
    @ResponseBody
    public Object selectList(GoodsOrder goodsOrder, Integer page, Integer rows){
        PageInfo<GoodsOrder> pageInfo = goodsOrderService.selectPage(goodsOrder,page,rows);
        return getPageMap(pageInfo);
    }

    @RequestMapping("addGoodsOrder")
    public void addGoodsOrder(GoodsOrder goodsorder){
        int i = goodsOrderService.insertSelective(goodsorder);
    }

    @RequestMapping("updateGoodsOrder")
    @ResponseBody
    public int updateGoodsOrder(GoodsOrder goodsorder){
        System.out.println(goodsorder);
        int i = goodsOrderService.updateByPrimaryKeySelective(goodsorder);
//            goodsorder = goodsOrderService.selectByPrimaryKey(goodsorder);
            System.out.println(goodsorder.getState());
            SystemWebSocketHandler.sendMessageToUserese("正在制作");
        return i;
    }

    @RequestMapping("deleteGoodsOrder")
    public void deleteGoodsOrder(GoodsOrder goodsorder){
        int i = goodsOrderService.updateByPrimaryKeySelective(goodsorder);
    }
}
