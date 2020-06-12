package com.hx.dc.service;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Menu;
import com.hx.dc.entity.Post;

import java.util.List;


public interface EmpService {
    public Emp login(Emp emp);
    public List<Menu> queryEmpMenu(Emp emp);
    public PageInfo queryAllEmp(Emp emp,int pageNumber, int pageSize);
    public List<Post> ajaxQueryPost(Emp emp);
    public String insertEmp(Emp emp);
    public String updateEmp(Emp emp);
    public String deleteEmp(int[] empIds);
}
