package com.hx.dc.entity;

import java.util.ArrayList;
import java.util.List;

public class MenuTree {
    private int menuId;
    private String menuName;
    private String url;
    private String menuType;
    private String powerName;
    private int parentId;
    private String status;
    private int sort;
    private List children=new ArrayList();

    public MenuTree() {
    }

    public MenuTree(int menuId, String menuName, String url, String menuType, String powerName, int parentId, String status, int sort, List children) {
        this.menuId = menuId;
        this.menuName = menuName;
        this.url = url;
        this.menuType = menuType;
        this.powerName = powerName;
        this.parentId = parentId;
        this.status = status;
        this.sort = sort;
        this.children = children;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMenuType() {
        return menuType;
    }

    public void setMenuType(String menuType) {
        this.menuType = menuType;
    }

    public String getPowerName() {
        return powerName;
    }

    public void setPowerName(String powerName) {
        this.powerName = powerName;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public List getChildren() {
        return children;
    }

    public void setChildren(List children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "MenuTree{" +
                "menuId=" + menuId +
                ", menuName='" + menuName + '\'' +
                ", url='" + url + '\'' +
                ", menuType='" + menuType + '\'' +
                ", powerName='" + powerName + '\'' +
                ", parentId=" + parentId +
                ", status='" + status + '\'' +
                ", sort=" + sort +
                ", children=" + children +
                '}';
    }
}
