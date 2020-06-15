package com.hx.dc.entity;


import java.io.Serializable;

public class Dept implements Serializable {
    private int depId;
    private String depName;
    private String depAddress;
    private String status;
    private int parentId;
    private String remarks;

    public Dept() {
    }

    public Dept(int depId, String depName, String depAddress, String status, int parentId, String remarks) {
        this.depId = depId;
        this.depName = depName;
        this.depAddress = depAddress;
        this.status = status;
        this.parentId = parentId;
        this.remarks = remarks;
    }

    public int getDepId() {
        return depId;
    }

    public void setDepId(int depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getDepAddress() {
        return depAddress;
    }

    public void setDepAddress(String depAddress) {
        this.depAddress = depAddress;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "Dept{" +
                "depId=" + depId +
                ", depName='" + depName + '\'' +
                ", depAddress='" + depAddress + '\'' +
                ", status='" + status + '\'' +
                ", parentId=" + parentId +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}
