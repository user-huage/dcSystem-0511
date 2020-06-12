package com.hx.dc.entity;



import java.io.Serializable;


public class Table implements Serializable {
    private static final long serialVersionUID= 1L;

    private Integer id;

    private String depName;

    private String diningtableId;

    private String diningtableName;

    private Integer seating;

    private String qrCode;

    private Integer state; //（1，可用 2，有预约订单 3，正在使用  4，结束使用 5，禁用 6，删除)

    private String updateTime;

    private String creatTime;

    private String userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Table{" +
                "id=" + id +
                ", depName=" + depName +
                ", diningtableId='" + diningtableId + '\'' +
                ", diningtableName='" + diningtableName + '\'' +
                ", seating=" + seating +
                ", qrCode='" + qrCode + '\'' +
                ", state=" + state +
                ", updateTime='" + updateTime + '\'' +
                ", creatTime='" + creatTime + '\'' +
                ", userId='" + userId + '\'' +
                '}';
    }
}