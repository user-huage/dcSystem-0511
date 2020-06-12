package com.hx.dc.mapper;

import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Post;

import java.util.List;


public interface DeptMapper {
    //查找所有dept
    public List<Dept> queryAllDept();
    //添加总部门
    public int insertDept(Dept dept);
    //通过名称查找指定部门
    public Dept queryDeptByName(Dept dept);
    //修改部门
    public int updateDept(Dept dept);
    //删除部门
    public int deleteDept(String[] depNames);
    //从职务表查找总部门
    public List<Post> quertTotalDeptToPost(String[] depNames);
    //从职务表查找子部门
    public List<Post> quertSubDeptToPost(String[] depNames);
}
