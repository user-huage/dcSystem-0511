package com.hx.dc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class AccountsDay {
    private Long id;

    private String totalName;

    private String subName;

    private String goodsNumber;

    private String goodsName;

    private Double salePayment;

    private Double refundPayment;

    private Double finalPayment;

    private Integer saleNum;

    private Integer refundNum;

    private Integer finalNum;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date orderTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTotalName() {
        return totalName;
    }

    public void setTotalName(String totalName) {
        this.totalName = totalName;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public String getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(String goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public Double getSalePayment() {
        return salePayment;
    }

    public void setSalePayment(Double salePayment) {
        this.salePayment = salePayment;
    }

    public Double getRefundPayment() {
        return refundPayment;
    }

    public void setRefundPayment(Double refundPayment) {
        this.refundPayment = refundPayment;
    }

    public Double getFinalPayment() {
        return finalPayment;
    }

    public void setFinalPayment(Double finalPayment) {
        this.finalPayment = finalPayment;
    }

    public Integer getSaleNum() {
        return saleNum;
    }

    public void setSaleNum(Integer saleNum) {
        this.saleNum = saleNum;
    }

    public Integer getRefundNum() {
        return refundNum;
    }

    public void setRefundNum(Integer refundNum) {
        this.refundNum = refundNum;
    }

    public Integer getFinalNum() {
        return finalNum;
    }

    public void setFinalNum(Integer finalNum) {
        this.finalNum = finalNum;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }
}