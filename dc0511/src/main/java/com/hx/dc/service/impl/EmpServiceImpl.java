package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.*;
import com.hx.dc.mapper.EmpMapper;
import com.hx.dc.mapper.PostMapper;
import com.hx.dc.service.EmpService;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("empService")
public class EmpServiceImpl implements EmpService {
    @Autowired
    @Qualifier("empMapper")
    private EmpMapper empMapper;

    @Autowired
    @Qualifier("postMapper")
    private PostMapper postMapper;

    @Override
    public Emp login(Emp emp) {
        return empMapper.login(emp);
    }

    @Override
    public List<Menu> queryEmpMenu(Emp emp) {
        List<Menu> menus=new ArrayList<Menu>();
        Map<String,Menu> menuMap=new HashMap<String,Menu>();
        List<Role> roles = empMapper.queryEmpRole(emp);
        for(Role role:roles){
            List<Menu> menus1 = empMapper.queryEmpMenu(role);
            if(menus1.size()!=0){
                for(Menu menu:menus1){
                    if(menuMap.get(menu.getMenuName())==null) {
                        menuMap.put(menu.getMenuName(),menu);
                        menus.add(menu);
                    }
                }
            }
        }
        return menus;
    }

    @Override
    public PageInfo queryAllEmp(Emp emp, int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Emp> emps = empMapper.queryAllEmp(emp);
        for(Emp emp1:emps){
            if("1".equals(emp1.getSex())){
                emp1.setSex("男");
            }else {
                emp1.setSex("女");
            }
            if("1".equals(emp1.getDeptType())){
                emp1.setDeptType("总部");
            }else {
                emp1.setDeptType("分部");
            }
            if("1".equals(emp1.getWorkStatus())){
                emp1.setWorkStatus("在职");
            }else {
                emp1.setWorkStatus("离职");
            }
            if("1".equals(emp1.getLocks())){
                emp1.setLocks("是");
            }else {
                emp1.setLocks("否");
            }
            if("1".equals(emp1.getEmpStatus())){
                emp1.setEmpStatus("可用");
            }else {
                emp1.setEmpStatus("禁用");
            }
        }
        PageInfo pageInfo=new PageInfo(emps);
        return pageInfo;
    }

    @Override
    public List<Post> ajaxQueryPost(Emp emp) {
        return empMapper.ajaxQueryPost(emp);
    }

    @Override
    public String insertEmp(Emp emp) {
        String  msg="添加失败！！！";
        Emp emp1 = empMapper.queryEmpByName(emp);
        if(emp1!=null){
            msg="该用户已经存在，无法重复添加！！！";
            return msg;
        }
        emp.setWorkStatus("1");
        emp.setDepId(empMapper.queryDeptByName(emp).getDepId());
        Post post=new Post();
        post.setPostName(emp.getPostName());
        post.setTotalName(emp.getTotalName());
        if(emp.getSubName()!=null || emp.getSubName()!=""){
            post.setSubName(emp.getSubName());
        }
        Post returnPost = postMapper.queryPostByPostName(post);
        emp.setPostId(returnPost.getPostId());
        int num = empMapper.insertEmp(emp);
        if(num==1){
            msg="添加成功！！！";
        }
        return msg;
    }

    @Override
    public String updateEmp(Emp emp) {
        String  msg="修改失败！！！";
        Emp emp1 = empMapper.queryEmpByName(emp);
        if(emp1!=null&&emp1.getEmpId()!=emp.getEmpId()){
            msg="该用户已经存在，无法重复修改！！！";
            return msg;
        }
        emp.setWorkStatus("1");
        emp.setDepId(empMapper.queryDeptByName(emp).getDepId());
        Post post=new Post();
        post.setPostName(emp.getPostName());
        post.setTotalName(emp.getTotalName());
        post.setSubName(emp.getSubName());
        Post post1 = postMapper.queryPostByPostName(post);
        emp.setPostId(post1.getPostId());
        int num = empMapper.updateEmp(emp);
        if(num==1){
            msg="修改成功！！！";
        }
        return msg;
    }

    @Override
    public String deleteEmp(int[] empIds) {
        String msg="删除成功！！！";
        int num = empMapper.deleteEmp(empIds);
        if(num==0){
            msg="删除失败！！！";
        }
        return msg;
    }
}
