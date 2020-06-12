package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.*;
import com.hx.dc.mapper.RoleMapper;
import com.hx.dc.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
    @Autowired
    @Qualifier("roleMapper")
    private RoleMapper roleMapper;

    @Override
    public PageInfo queryAllRole(int page, int rows) {
        PageHelper.startPage(page,rows);
        List<Role> roles = roleMapper.queryAllRole();
        for(Role role:roles){
            if("1".equals(role.getStatus())){
                role.setStatus("可用");
            }else {
                role.setStatus("禁用");
            }

        }
        PageInfo pageInfo=new PageInfo(roles);
        return  pageInfo;
    }

    @Override
    public String deleteRole(int[] roleIds) {
        String msg="删除成功！！！";
        List<Role> roles = roleMapper.queryRoleToRoleEmp(roleIds);
        if(roles.size()!=0){
            return "只能删除没有员工使用的角色";
        }
        roleMapper.deleteRoleToRoleEmp(roleIds);
        roleMapper.deleteRoleToRoleMenu(roleIds);
        int num = roleMapper.deleteRole(roleIds);
        if(num==0){
            msg="删除失败！！！";
        }
        return msg;
    }

    @Override
    public String insertRole(Role role) {
        String msg="添加失败！！！";
        Role role1 = roleMapper.queryRoleByName(role);
        if(role1!=null){
            msg="该角色已经存在，无法重复添加！！！";
            return msg;
        }
        int num=roleMapper.insertRole(role);

        if(num==1){
            msg="添加成功！！！";
        }
        return msg;
    }

    @Override
    public String updateRole(Role role) {
        String msg="修改失败！！！";
        Role role1 = roleMapper.queryRoleByName(role);
        if(role1!=null && role1.getRoleId()!=role.getRoleId()){
            msg="该角色已经存在，无法修改！！！";
            return msg;
        }
        int num= roleMapper.updateRole(role);
        if(num==1){
            msg="修改成功！！！";
        }
        return msg;
    }

    @Override
    public List<Tree> queryEmpToRoleEmp(Role role) {
        List<Emp> emps1 = roleMapper.queryAllEmp();
        List<Emp> emps2 = roleMapper.queryEmpToRoleEmp(role);
        List<Tree> trees=new ArrayList<Tree>();
        Tree tree=null;
        for(Emp emp1:emps1){
            tree=new Tree();
            tree.setId(emp1.getEmpId());
            tree.setText(emp1.getUserName());
            if(emps2!=null){
                for(Emp emp2:emps2){
                    if(emp2.getUserName().equals(emp1.getUserName())){
                        tree.setChecked(true);
                    }
                }
            }
            trees.add(tree);
        }
        return trees;
    }

    @Override
    public String insertRoleEmp(int[] empIds,Role role) {
        String msg="设置人员失败！！！";
        roleMapper.deleteRoleEmp(role);
        int num2=1;
        for(int empId:empIds){
            num2=roleMapper.insertRoleEmp(empId,role.getRoleId());
            if(num2==0){
                num2=0;
            }
        }
        if(num2==1){
            msg="设置人员成功！！！";
        }
        return msg;
    }

    @Override
    public List<Tree> queryMenuToRoleMenu(Role role) {
        List<Menu> menus1 = roleMapper.queryAllMenu();
        List<Menu> menus2 = roleMapper.queryMenuToRoleMenu(role);
        List<Tree> trees=new ArrayList<Tree>();
        //一级目录
        Map<Integer,Menu> menuMap=new HashMap<Integer, Menu>();
        //二级目录
        Map<Integer,Menu> menuMap2=new HashMap<Integer, Menu>();
        Tree tree=null;
        for(Menu menu:menus1){
            if(menu.getParentId()==0){
                menuMap.put(menu.getMenuId(),menu);
                tree=new Tree();
                tree.setId(menu.getMenuId());
                tree.setText(menu.getMenuName());
                for(Menu menu1:menus2){
                    if(menu.getMenuId()==menu1.getMenuId()){
                        tree.setChecked(true);
                    }
                }
                trees.add(tree);
            }
        }
        for(Menu menu:menus1){
            if(menu.getParentId()!=0 && menuMap.get(menu.getParentId())!=null){
                menuMap2.put(menu.getMenuId(),menu);
                tree=new Tree();
                tree.setId(menu.getMenuId());
                tree.setText(menu.getMenuName());
                for(Tree Tree1:trees){
                    if(Tree1.getId()==menu.getParentId()){
                        for(Menu menu1:menus2){
                            if(menu.getMenuId()==menu1.getMenuId()){
                                tree.setChecked(true);
                            }
                        }
                        Tree1.getChildren().add(tree);
                    }
                }
            }
        }
        for(Menu menu:menus1){
            if(menu.getParentId()!=0 && menuMap2.get(menu.getParentId())!=null){
                tree=new Tree();
                tree.setId(menu.getMenuId());
                tree.setText(menu.getMenuName());
                for(Tree Tree1:trees){
                    List<Tree> trees2=Tree1.getChildren();
                    for(Tree tree2:trees2){
                        if(tree2.getId()==menu.getParentId()){
                            for(Menu menu1:menus2){
                                if(menu.getMenuId()==menu1.getMenuId()){
                                    tree.setChecked(true);
                                }
                            }
                            tree2.getChildren().add(tree);
                        }
                    }
                }
            }
        }
        return trees;
    }

    @Override
    public String insertRoleMenu(int[] menuIds, Role role) {
        String msg="设置目录失败！！！";
        roleMapper.deleteRoleMenu(role);
        int num2=1;
        for(int menuId:menuIds){
            num2=roleMapper.insertRoleMenu(role.getRoleId(),menuId);
            if(num2==0){
                num2=0;
            }
        }
        if(num2==1){
            msg="设置目录成功！！！";
        }
        return msg;
    }
}
