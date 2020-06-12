package com.hx.dc.mapper;


import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Menu;
import com.hx.dc.entity.Role;

import java.util.List;

public interface RoleMapper {
    public List<Role> queryAllRole();
    public List<Role> queryRoleToRoleEmp(int[] roleIds);
    public int deleteRoleToRoleEmp(int[] roleIds);
    public int deleteRoleToRoleMenu(int[] roleIds);
    public int deleteRole(int[] roleIds);
    public Role queryRoleByName(Role role);
    public int insertRole(Role role);
    public int updateRole(Role role);
    public List<Emp> queryAllEmp();
    public List<Emp> queryEmpToRoleEmp(Role role);
    public List<Menu> queryAllMenu();
    public List<Menu> queryMenuToRoleMenu(Role role);
    public int deleteRoleEmp(Role role);
    public int deleteRoleMenu(Role role);
    public int insertRoleEmp(int empIds,int roleId);
    public int insertRoleMenu(int roleId,int menuIds);
}
