package com.hx.dc.entity;

import java.io.Serializable;

public class Emp  implements Serializable {
    private int empId;
    private String userName;
    private String userCode;
    private String sex;
    private int postId;
    private String idNumber;
    private String phone;
    private String deptType;
    private String totalName;
    private String subName;
    private String postName;
    private String empStatus;
    private String locks;
    private int depId;
    private String workStatus;

    public Emp() {
    }

    public Emp(int empId, String userName, String userCode, String sex, int postId, String idNumber, String phone, String deptType, String totalName, String subName, String postName, String empStatus, String locks, int depId, String workStatus) {
        this.empId = empId;
        this.userName = userName;
        this.userCode = userCode;
        this.sex = sex;
        this.postId = postId;
        this.idNumber = idNumber;
        this.phone = phone;
        this.deptType = deptType;
        this.totalName = totalName;
        this.subName = subName;
        this.postName = postName;
        this.empStatus = empStatus;
        this.locks = locks;
        this.depId = depId;
        this.workStatus = workStatus;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDeptType() {
        return deptType;
    }

    public void setDeptType(String deptType) {
        this.deptType = deptType;
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

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public String getEmpStatus() {
        return empStatus;
    }

    public void setEmpStatus(String empStatus) {
        this.empStatus = empStatus;
    }

    public String getLocks() {
        return locks;
    }

    public void setLocks(String locks) {
        this.locks = locks;
    }

    public int getDepId() {
        return depId;
    }

    public void setDepId(int depId) {
        this.depId = depId;
    }

    public String getWorkStatus() {
        return workStatus;
    }

    public void setWorkStatus(String workStatus) {
        this.workStatus = workStatus;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", userName='" + userName + '\'' +
                ", userCode='" + userCode + '\'' +
                ", sex='" + sex + '\'' +
                ", postId=" + postId +
                ", idNumber='" + idNumber + '\'' +
                ", phone='" + phone + '\'' +
                ", deptType='" + deptType + '\'' +
                ", totalName='" + totalName + '\'' +
                ", subName='" + subName + '\'' +
                ", postName='" + postName + '\'' +
                ", empStatus='" + empStatus + '\'' +
                ", locks='" + locks + '\'' +
                ", depId='" + depId + '\'' +
                ", workStatus='" + workStatus + '\'' +
                '}';
    }
}
