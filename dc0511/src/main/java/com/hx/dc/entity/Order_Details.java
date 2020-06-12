package com.hx.dc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Order_Details {
    private String id;

    private String goodsName;

    private Integer goodNumber;

    private Integer goodsPrice;

    private String orderId;

    private Integer orderDetailsAmount;

    private String orderDetailsPayment;
@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private String orderDetailsPaytime;

    private Integer goodsId;

    private String goodsImage;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public Integer getGoodNumber() {
        return goodNumber;
    }

    public void setGoodNumber(Integer goodNumber) {
        this.goodNumber = goodNumber;
    }

    public Integer getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Integer goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderDetailsAmount() {
        return orderDetailsAmount;
    }

    public void setOrderDetailsAmount(Integer orderDetailsAmount) {
        this.orderDetailsAmount = orderDetailsAmount;
    }

    public String getOrderDetailsPayment() {
        return orderDetailsPayment;
    }

    public void setOrderDetailsPayment(String orderDetailsPayment) {
        this.orderDetailsPayment = orderDetailsPayment;
    }

    public String  getOrderDetailsPaytime() {
        return orderDetailsPaytime;
    }

    public void setOrderDetailsPaytime(String  orderDetailsPaytime) {
        this.orderDetailsPaytime = orderDetailsPaytime;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsImage() {
        return goodsImage;
    }

    public void setGoodsImage(String goodsImage) {
        this.goodsImage = goodsImage;
    }
}