package com.hx.dc.mapper;

import com.hx.dc.entity.*;

import java.util.List;

public interface EmpMapper {
    public Emp login(Emp emp);
    public List<Role> queryEmpRole(Emp emp);
    public List<Menu> queryEmpMenu(Role role);
    public List<Emp> queryAllEmp(Emp emp);
    public List<Post> ajaxQueryPost(Emp emp);
    public int insertEmp(Emp emp);
    public Emp queryEmpByName(Emp emp);
    public Dept queryDeptByName(Emp emp);
    public int updateEmp(Emp emp);
    public int deleteEmp(int[] empIds);
}
