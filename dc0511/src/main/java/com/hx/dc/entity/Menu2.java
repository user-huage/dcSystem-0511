package com.hx.dc.entity;

import java.io.Serializable;

public class Menu2 implements Serializable{
    private int menuId;

    private String menuName;

    private String totalName;

    private String subName;

    private String menuDelete;

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

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuDelete() {
        return menuDelete;
    }

    public void setMenuDelete(String menuDelete) {
        this.menuDelete = menuDelete;
    }

    @Override
    public String toString() {
        return "Menu2{" +
                "menuId=" + menuId +
                ", menuName='" + menuName + '\'' +
                ", totalName='" + totalName + '\'' +
                ", subName='" + subName + '\'' +
                ", menuDelete='" + menuDelete + '\'' +
                '}';
    }
}