package com.hx.dc.entity;

import java.io.Serializable;
import java.util.Date;

public class Goods implements Serializable{
    private Integer goodsId;

    private String menuName;

    private String totalName;

    private String subName;

    private String goodsImage;

    private String goodsNumber;

    private String goodsName;

    private Integer goodsPrice;

    private String goodsDescribe;

    private String goodsType;

    private String goodsSell;

    private String goodsAfter;

    private String goodsStatus;

    private Date goodsDate;

    private String goodsDelete;

    private String menuParameter;

    private String menuStyleselect;

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
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

    public String getGoodsImage() {
        return goodsImage;
    }

    public void setGoodsImage(String goodsImage) {
        this.goodsImage = goodsImage;
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

    public Integer getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Integer goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsDescribe() {
        return goodsDescribe;
    }

    public void setGoodsDescribe(String goodsDescribe) {
        this.goodsDescribe = goodsDescribe;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public String getGoodsSell() {
        return goodsSell;
    }

    public void setGoodsSell(String goodsSell) {
        this.goodsSell = goodsSell;
    }

    public String getGoodsAfter() {
        return goodsAfter;
    }

    public void setGoodsAfter(String goodsAfter) {
        this.goodsAfter = goodsAfter;
    }

    public String getGoodsStatus() {
        return goodsStatus;
    }

    public void setGoodsStatus(String goodsStatus) {
        this.goodsStatus = goodsStatus;
    }

    public Date getGoodsDate() {
        return goodsDate;
    }

    public void setGoodsDate(Date goodsDate) {
        this.goodsDate = goodsDate;
    }

    public String getGoodsDelete() {
        return goodsDelete;
    }

    public void setGoodsDelete(String goodsDelete) {
        this.goodsDelete = goodsDelete;
    }

    public String getMenuParameter() {
        return menuParameter;
    }

    public void setMenuParameter(String menuParameter) {
        this.menuParameter = menuParameter;
    }

    public String getMenuStyleselect() {
        return menuStyleselect;
    }

    public void setMenuStyleselect(String menuStyleselect) {
        this.menuStyleselect = menuStyleselect;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsId=" + goodsId +
                ", menuName='" + menuName + '\'' +
                ", totalName='" + totalName + '\'' +
                ", subName='" + subName + '\'' +
                ", goodsImage='" + goodsImage + '\'' +
                ", goodsNumber='" + goodsNumber + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsPrice=" + goodsPrice +
                ", goodsDescribe='" + goodsDescribe + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", goodsSell='" + goodsSell + '\'' +
                ", goodsAfter='" + goodsAfter + '\'' +
                ", goodsStatus='" + goodsStatus + '\'' +
                ", goodsDate=" + goodsDate +
                ", goodsDelete='" + goodsDelete + '\'' +
                ", menuParameter='" + menuParameter + '\'' +
                ", menuStyleselect='" + menuStyleselect + '\'' +
                '}';
    }
}