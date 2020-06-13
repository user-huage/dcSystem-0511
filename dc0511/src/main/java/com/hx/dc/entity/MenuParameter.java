package com.hx.dc.entity;

import java.io.Serializable;

public class MenuParameter implements Serializable{
    private Integer parameterId;

    private String menuName;

    private String menuParameter;

    private String menuStyleselect;

    private String menuparDelete;

    public Integer getParameterId() {
        return parameterId;
    }

    public void setParameterId(Integer parameterId) {
        this.parameterId = parameterId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
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

    public String getMenuparDelete() {
        return menuparDelete;
    }

    public void setMenuparDelete(String menuparDelete) {
        this.menuparDelete = menuparDelete;
    }

    @Override
    public String toString() {
        return "MenuParameter{" +
                "parameterId=" + parameterId +
                ", menuName='" + menuName + '\'' +
                ", menuParameter='" + menuParameter + '\'' +
                ", menuStyleselect='" + menuStyleselect + '\'' +
                ", menuparDelete='" + menuparDelete + '\'' +
                '}';
    }
}