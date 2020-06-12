package com.hx.dc.service.impl;

import com.hx.dc.entity.*;
import com.hx.dc.mapper.*;
import com.hx.dc.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 85361 on 2020/5/27.
 */
@Service("TaskService")
public class TaskServiceImpl implements TaskService {
    @Autowired
    Order_DetailsMapper orderDetailsMapper;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    AccountsDayMapper accountsDayMapper;
    @Autowired
    Order_ReturnsMapper orderReturnsMapper;
    @Autowired
    Order_Return_DetailsMapper orderReturnDetailsMapper;
    @Autowired
    LogMapper logMapper;


    Date currentTime = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    String dateString = formatter.format(currentTime);
    String[]s= dateString.split("-");
    String year=s[0];
    String month=s[1];
    String day=s[2];
    List<AccountsDay> accList=new ArrayList<AccountsDay>();
    @Override
    public void task() {
        order();
        orderRetrun();
        insertLog();
        if(accList.size()!=0){
            accountsDayMapper.insertAccList(accList);
        }
    }
    public void order(){
        //抽取订单
        List list=new ArrayList<String>();
        List<Order> orderList=orderMapper.selectOrderByTime(dateString);
        AccountsDay acc=null;
        //判断当天是否有数据,如果有就抽取
        if(orderList.size()!=0){
            for (Order o:orderList) {
                list.add(o.getOrderId());
            }
            List<Order_Details> list1=orderDetailsMapper.selectDetails(list);
            Map map=new HashMap<String,Object>();
            for (Order_Details o:list1) {
                if(accList.size()!=0){
                    if(map.get(o.getGoodsName())!=null){
                        for (AccountsDay a:accList) {
                            if(a.getGoodsName().equals(o.getGoodsName())){
                                a.setSaleNum(a.getSaleNum()+o.getGoodNumber());
                                a.setSalePayment(a.getSalePayment()+(o.getGoodsPrice()*o.getGoodNumber()));
                                a.setFinalPayment(a.getSalePayment());
                                a.setFinalNum(a.getSaleNum());
                            }
                        }
                    }else {
                        acc=new AccountsDay();
                        acc.setGoodsName(o.getGoodsName());
                        acc.setSaleNum(o.getGoodNumber());
                        acc.setSalePayment((o.getGoodsPrice()*o.getGoodNumber())+0.0);
                        acc.setFinalPayment(acc.getSalePayment());
                        acc.setFinalNum(acc.getSaleNum());
                        acc.setOrderTime(currentTime);
                        map.put(acc.getGoodsName(),acc);
                        accList.add(acc);
                    }
                }else {
                    acc=new AccountsDay();
                    acc.setGoodsName(o.getGoodsName());
                    acc.setSaleNum(o.getGoodNumber());
                    acc.setSalePayment((o.getGoodsPrice()*o.getGoodNumber())+0.0);
                    acc.setFinalPayment(acc.getSalePayment());
                    acc.setFinalNum(acc.getSaleNum());
                    acc.setOrderTime(currentTime);
                    map.put(acc.getGoodsName(),acc);
                    accList.add(acc);
                }
            }
        }
    }
    public void orderRetrun(){
        //抽取退单
        List l=new ArrayList<String>();
        List<Order_Returns> returnList=orderReturnsMapper.selectOrderByTime(dateString);
        if(returnList.size()!=0){
            for (Order_Returns o:returnList) {
                l.add(o.getReturnId());
            }
            List<Order_Return_Details> list2=orderReturnDetailsMapper.selectDetails(l);
            for (Order_Return_Details o:list2) {
                for (AccountsDay a:accList) {
                    if(a.getGoodsName().equals(o.getGoodsName())){
                        a.setRefundNum(o.getReturnNum());
                        a.setRefundPayment(o.getReturnMoney());
                        a.setFinalNum(a.getSaleNum()-a.getRefundNum());
                        a.setFinalPayment(a.getSalePayment()-a.getRefundPayment());
                    }
                }
            }
        }
    }
    public void insertLog(){
        //录入抽取订单日志
        Log orderLog=new Log();
        orderLog.setTaskId("D"+year+month+day);
        orderLog.setTaskName("订单");
        orderLog.setTaskText("抽取当天商品的订单信息");
        orderLog.setDateTime(currentTime);
        orderLog.setTaskTime(currentTime);
        orderLog.setOperStatus("1");
        orderLog.setUpdateTime(currentTime);
        //orderLog.setFunction("更新数据");

        Log returnLog=new Log();
        returnLog.setTaskId("T"+year+month+day);
        returnLog.setTaskName("退款");
        returnLog.setTaskText("抽取当天商品的退单信息");
        returnLog.setDateTime(currentTime);
        returnLog.setTaskTime(currentTime);
        returnLog.setOperStatus("1");
        returnLog.setUpdateTime(currentTime);
        //returnLog.setFunction("更新数据");
        //录入数据库
        logMapper.insertLog(orderLog);
        logMapper.insertLog(returnLog);
    }
}
