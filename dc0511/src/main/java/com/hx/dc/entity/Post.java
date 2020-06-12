package com.hx.dc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Post {
    private int postId;
    private String deptType;
    private String totalName;
    private String subName;
    private String postName;
    private String remarks;
    private String status;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public Post() {
    }

    public Post(int postId, String deptType, String totalName, String subName, String postName, String remarks, String status, Date createTime) {
        this.postId = postId;
        this.deptType = deptType;
        this.totalName = totalName;
        this.subName = subName;
        this.postName = postName;
        this.remarks = remarks;
        this.status = status;
        this.createTime = createTime;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postId=" + postId +
                ", deptType='" + deptType + '\'' +
                ", totalName='" + totalName + '\'' +
                ", subName='" + subName + '\'' +
                ", postName='" + postName + '\'' +
                ", remarks='" + remarks + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
