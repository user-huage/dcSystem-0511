package com.hx.dc.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Tree implements Serializable {
    private int id;
    private String text;
    private boolean checked;
    private int parentId;
    private List children=new ArrayList();

    public Tree() {
    }

    public Tree(int id, String text, boolean checked, int parentId, List children) {
        this.id = id;
        this.text = text;
        this.checked = checked;
        this.parentId = parentId;
        this.children = children;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean getChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public List getChildren() {
        return children;
    }

    public void setChildren(List children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Tree{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", checked=" + checked +
                ", parentId=" + parentId +
                ", children=" + children +
                '}';
    }
}
