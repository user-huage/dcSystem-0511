package com.hx.dc.service;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Role;
import com.hx.dc.entity.Tree;

import java.util.List;


public interface RoleService {
    public PageInfo queryAllRole(int page, int rows);
    public String deleteRole(int[] roleIds);
    public String insertRole(Role role);
    public String updateRole(Role role);
    public List<Tree> queryEmpToRoleEmp(Role role);
    public String insertRoleEmp(int[] empIds,Role role);
    public List<Tree> queryMenuToRoleMenu(Role role);
    public String insertRoleMenu(int[] menuIds,Role role);
}
