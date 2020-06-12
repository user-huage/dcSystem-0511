package com.hx.dc.service;

import com.hx.dc.entity.Dept;

import java.util.List;


public interface DeptService {
    public List<Dept> queryAllDept();
    public String insertDept(Dept dept);
    public Dept queryDeptByName(Dept dept);
    public String updateDept(Dept dept);
    public String deleteDept(String[] depNames);
}
