package com.hx.dc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Order {
    private String orderId;

    private Integer diningtableId;

    private String orderEattype;

    private Integer depId;

    private Integer orderAmount;

    private Integer orderMoney;

    private String orderStatus;

    private String orderPayment;

    private String orderProgress;
    @JsonFormat(pattern = "yyyy-MM-dd ",timezone = "GMT+8")
    private Date orderTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date orderPaytime;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getDiningtableId() {
        return diningtableId;
    }

    public void setDiningtableId(Integer diningtableId) {
        this.diningtableId = diningtableId;
    }

    public String getOrderEattype() {
        return orderEattype;
    }

    public void setOrderEattype(String orderEattype) {
        this.orderEattype = orderEattype;
    }

    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public Integer getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(Integer orderAmount) {
        this.orderAmount = orderAmount;
    }

    public Integer getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(Integer orderMoney) {
        this.orderMoney = orderMoney;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderPayment() {
        return orderPayment;
    }

    public void setOrderPayment(String orderPayment) {
        this.orderPayment = orderPayment;
    }

    public String getOrderProgress() {
        return orderProgress;
    }

    public void setOrderProgress(String orderProgress) {
        this.orderProgress = orderProgress;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Date getOrderPaytime() {
        return orderPaytime;
    }

    public void setOrderPaytime(Date orderPaytime) {
        this.orderPaytime = orderPaytime;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", diningtableId='" + diningtableId + '\'' +
                ", orderEattype='" + orderEattype + '\'' +
                ", depId=" + depId +
                ", orderAmount='" + orderAmount + '\'' +
                ", orderMoney='" + orderMoney + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderPayment='" + orderPayment + '\'' +
                ", orderProgress='" + orderProgress + '\'' +
                ", orderTime='" + orderTime + '\'' +
                ", orderPaytime='" + orderPaytime + '\'' +
                '}';
    }
}