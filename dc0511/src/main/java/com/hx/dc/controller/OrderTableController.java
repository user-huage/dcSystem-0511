package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.OrderTable;
import com.hx.dc.entity.Table;
import com.hx.dc.service.OrderTableService;
import com.hx.dc.service.TableService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by my on 2020/5/28.
 */

//餐桌预定管理控制器

@Controller
@RequestMapping("/orderTable")
public class OrderTableController extends BaseController {

    @Resource
    OrderTableService orderTableService;
    @Resource
    TableService tableService;

    @RequestMapping("OrderSelectList")
    @ResponseBody
    public Object selectList(OrderTable ordertable, Integer page, Integer rows){

        if(ordertable.getDepName() == ""){
            ordertable.setDepName(null);
        }
        if(ordertable.getDiningtableId() == ""){
            ordertable.setDiningtableId(null);
        }
        if(ordertable.getDiningtableName()== ""){
            ordertable.setDiningtableName(null);
        }
        if(ordertable.getRepastForm() == ""){
            ordertable.setRepastForm(null);
        }

        PageInfo<OrderTable> pageInfo = orderTableService.selectPage(ordertable,page,rows);
        return getPageMap(pageInfo);
    }

    @ResponseBody
    @RequestMapping("addOrder")
    public int addOrderTable(OrderTable ordertable){//
        Table tableAll =new Table();
        Date  date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date1 = sdf.format(date);
        ordertable.setOrderTime(date1);
       ordertable.setState(1);
       int i = orderTableService.insertSelective(ordertable);
       if(1 == i){
           tableAll.setState(2);
           tableAll.setDepName(ordertable.getDepName());
           tableAll.setDiningtableId(ordertable.getDiningtableId());
          tableService.updateByPrimaryKeySelective(tableAll);//state（1，可用 2，有预约订单 3，正在使用  4，结束使用 5，禁用 6，删除)
       }
        System.out.print("数据库修改数据条数:"+i);
        return i;
    }

    @RequestMapping("updateOrder")
    @ResponseBody
    public int updateOrderTable(OrderTable ordertable){
        Table tableAll =new Table();
        if(ordertable.getState() == 2){
            tableAll.setState(3);
        }
        if(ordertable.getState() == 3){
            tableAll.setState(4);
        }
        int i = orderTableService.updateByPrimaryKeySelective(ordertable);
        if(i == 1){
            tableService.updateByPrimaryKeySelective(tableAll);
        }
        return i;
    }

    @RequestMapping("deleteOrder")
    public void deleteOrderTable(){
        OrderTable ortable = new OrderTable();
        ortable.setState(4);
        int i = orderTableService.updateByPrimaryKeySelective(ortable);
    }
}
