package com.hx.dc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Order_Returns {
    private String returnId;

    private String returnStatus;

    private String returnMoney;
  @JsonFormat(pattern = "yyyy-MM-dd ",timezone = "GMT+8")
    private String returnTime;

    private String returnReason;

    private String orderPayment;

    private String returnAuditStatus;

    private String returnAuditExplain;

    private String orderId;

    public String getReturnId() {
        return returnId;
    }

    public void setReturnId(String returnId) {
        this.returnId = returnId;
    }

    public String getReturnStatus() {
        return returnStatus;
    }

    public void setReturnStatus(String returnStatus) {
        this.returnStatus = returnStatus;
    }

    public String getReturnMoney() {
        return returnMoney;
    }

    public void setReturnMoney(String returnMoney) {
        this.returnMoney = returnMoney;
    }

    public String getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime;
    }

    public String getReturnReason() {
        return returnReason;
    }

    public void setReturnReason(String returnReason) {
        this.returnReason = returnReason;
    }

    public String getOrderPayment() {
        return orderPayment;
    }

    public void setOrderPayment(String orderPayment) {
        this.orderPayment = orderPayment;
    }

    public String getReturnAuditStatus() {
        return returnAuditStatus;
    }

    public void setReturnAuditStatus(String returnAuditStatus) {
        this.returnAuditStatus = returnAuditStatus;
    }

    public String getReturnAuditExplain() {
        return returnAuditExplain;
    }

    public void setReturnAuditExplain(String returnAuditExplain) {
        this.returnAuditExplain = returnAuditExplain;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
}