package com.hx.dc.entity;

import java.io.Serializable;
import java.util.Date;

public class OrderTable implements Serializable {

    private String depName;

    private String diningtableId;

    private String diningtableName;

    private Integer seating;

    private String repastForm;

    private String orderTime;

    private String reservedNumber;

    private String beginTime;

    private String endTime;

    private String wechat;

    private Integer state;//(1,待就餐 2，正在就餐，3，结束就餐，4，订单退订 5，删除)

    private String remark;

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getDiningtableId() {
        return diningtableId;
    }

    public void setDiningtableId(String diningtableId) {
        this.diningtableId = diningtableId;
    }

    public String getDiningtableName() {
        return diningtableName;
    }

    public void setDiningtableName(String diningtableName) {
        this.diningtableName = diningtableName;
    }

    public Integer getSeating() {
        return seating;
    }

    public void setSeating(Integer seating) {
        this.seating = seating;
    }

    public String getRepastForm() {
        return repastForm;
    }

    public void setRepastForm(String repastForm) {
        this.repastForm = repastForm;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getReservedNumber() {
        return reservedNumber;
    }

    public void setReservedNumber(String reservedNumber) {
        this.reservedNumber = reservedNumber;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "OrderTable{" +
                ", depName=" + depName +
                ", diningtableId='" + diningtableId + '\'' +
                ", diningtableName='" + diningtableName + '\'' +
                ", seating=" + seating +
                ", repastForm='" + repastForm + '\'' +
                ", orderTime=" + orderTime +
                ", reservedNumber='" + reservedNumber + '\'' +
                ", beginTime='" + beginTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", wechat='" + wechat + '\'' +
                ", state=" + state +
                ", remark='" + remark + '\'' +
                '}';
    }
}