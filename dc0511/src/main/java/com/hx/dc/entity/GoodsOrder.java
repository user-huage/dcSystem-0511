package com.hx.dc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class GoodsOrder {
    private Integer id;

    private String orderId;

    private Integer diningtableId;

    private String diningtableName;

    private String depName;

    private Integer goodsNumber;

    private String goodsName;

    private String goodsImage;

    private Integer placeNumber;

    private String returnNumber;

    private Integer cookNumber;

    private Integer state;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date startTime;

    private String shoppingExplai;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public Integer getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(Integer goodsNumber) {
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

    public Integer getPlaceNumber() {
        return placeNumber;
    }

    public void setPlaceNumber(Integer placeNumber) {
        this.placeNumber = placeNumber;
    }

    public String getReturnNumber() {
        return returnNumber;
    }

    public void setReturnNumber(String returnNumber) {
        this.returnNumber = returnNumber;
    }

    public Integer getCookNumber() {
        return cookNumber;
    }

    public void setCookNumber(Integer cookNumber) {
        this.cookNumber = cookNumber;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getShoppingExplai() {
        return shoppingExplai;
    }

    public void setShoppingExplai(String shoppingExplai) {
        this.shoppingExplai = shoppingExplai;
    }
}