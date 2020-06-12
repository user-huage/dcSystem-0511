package com.hx.dc.entity;

import java.io.Serializable;

public class GoodsOrder implements Serializable {

    private String orderId;

    private String diningtableId;

    private String diningtableName;

    private String depName;

    private String goodsNumber;

    private String goodsName;

    private String goodsImage;

    private String placeNumber;

    private String returnNumber;

    private String cookNumber;

    private Integer state;//(1,待制作 2，正在制作，3，制作完成，4，以上菜 5，订单退订 ,6，删除)

    private String startTime;

    private String shoppingExplai;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
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

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
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

    public String getGoodsImage() {
        return goodsImage;
    }

    public void setGoodsImage(String goodsImage) {
        this.goodsImage = goodsImage;
    }

    public String getPlaceNumber() {
        return placeNumber;
    }

    public void setPlaceNumber(String placeNumber) {
        this.placeNumber = placeNumber;
    }

    public String getReturnNumber() {
        return returnNumber;
    }

    public void setReturnNumber(String returnNumber) {
        this.returnNumber = returnNumber;
    }

    public String getCookNumber() {
        return cookNumber;
    }

    public void setCookNumber(String cookNumber) {
        this.cookNumber = cookNumber;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getShoppingExplai() {
        return shoppingExplai;
    }

    public void setShoppingExplai(String shoppingExplai) {
        this.shoppingExplai = shoppingExplai;
    }
}