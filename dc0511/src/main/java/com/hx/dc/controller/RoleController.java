package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Role;
import com.hx.dc.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RoleController {
    @Autowired
    @Qualifier("roleService")
    private RoleService roleService;

    @RequestMapping("queryAllRole")
    @ResponseBody
    public Object queryAllRole(int page,int rows){
        Map<String,Object> map=new HashMap<String,Object>();
        PageInfo pageInfo = roleService.queryAllRole(page,rows);
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }
    @RequestMapping("deleteRole")
    @ResponseBody
    public Object deleteRole(String roleIds){
        String[] roleIds1=roleIds.split(",");
        int[] roleIds2=new int[roleIds1.length];
        for(int i=0;i<roleIds2.length;i++){
            roleIds2[i]=Integer.parseInt(roleIds1[i]);
        }
        String msg = roleService.deleteRole(roleIds2);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
    @RequestMapping("addRole")
    @ResponseBody
    public Object insertRole(Role role){
        String msg = roleService.insertRole(role);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
    @RequestMapping("updateRole")
    @ResponseBody
    public Object updateRole(Role role){
        String msg = roleService.updateRole(role);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
    @RequestMapping("setEmpRole")
    @ResponseBody
    public Object queryEmpToRoleEmp(Role role){
        return roleService.queryEmpToRoleEmp(role);
    }
    @RequestMapping("saveRoleEmp")
    @ResponseBody
    public Object insertRoleEmp(String empIds,Role role){
        String[] empIds1=empIds.split(",");
        int[] empIds2=new int[empIds1.length];
        for(int i=0;i<empIds2.length;i++){
            empIds2[i]=Integer.parseInt(empIds1[i]);
        }
        String msg = roleService.insertRoleEmp(empIds2,role);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;

    }
    @RequestMapping("setRoleMenu")
    @ResponseBody
    public Object queryMenuToRoleMenu(Role role){
        return roleService.queryMenuToRoleMenu(role);
    }
    @RequestMapping("saveEmpMenu")
    @ResponseBody
    public Object insertEmpMenu(String menuIds,Role role){
        String[] menuIds1=menuIds.split(",");
        int[] menuIds2=new int[menuIds1.length];
        for(int i=0;i<menuIds2.length;i++){
            menuIds2[i]=Integer.parseInt(menuIds1[i]);
        }
        String msg = roleService.insertRoleMenu(menuIds2,role);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
}
