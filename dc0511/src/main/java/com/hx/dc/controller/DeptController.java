package com.hx.dc.controller;

import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Tree;
import com.hx.dc.service.DeptService;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

@Controller
public class DeptController {

    @Resource
    private DeptService deptService;

    private List<Dept> list = new ArrayList<Dept>();

    @ResponseBody
    @RequestMapping("queryAllDept")
    public Object queryAllDept() {
        List<Dept> depts = deptService.queryAllDept();
        List<Tree> treeList = new ArrayList<Tree>();
        Tree tree = null;
        for (Dept dept : depts) {
            if (dept.getParentId() == 0) {
                tree = new Tree();
                tree.setId(dept.getDepId());
                tree.setText(dept.getDepName());
                treeList.add(tree);
            }
        }
        for (Dept dept : depts) {
            if (0 != dept.getParentId()) {
                for (Tree t : treeList) {
                    if (t.getId() == dept.getParentId()) {
                        tree = new Tree();
                        tree.setId(dept.getDepId());
                        tree.setText(dept.getDepName());
                        tree.setParentId(dept.getParentId());
                        t.getChildren().add(tree);
                    }
                }
            }
        }
        return treeList;
    }

    @ResponseBody
    @RequestMapping("addDept")
    public Object insertDept(Dept dept) {
        String msg = deptService.insertDept(dept);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }

    @ResponseBody
    @RequestMapping("updateDept")
    public Object updateDept(Dept dept) {
        String msg=deptService.updateDept(dept);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
    @ResponseBody
    @RequestMapping("queryDept")
    public Object queryDeptByName(Dept dept) {
        return deptService.queryDeptByName(dept);
    }

    @ResponseBody
    @RequestMapping("removeDept")
    public Object deleteDept(String[] depNames) {
        String msg = deptService.deleteDept(depNames);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }

    @RequestMapping("deptselcetPage")
    @ResponseBody
    public Object depselectList(String depName) {
        Dept deptson = null;
        List<Dept> listps = null;
        if(depName == ""){
            depName=null;
        }
        if(depName != null){
            list = deptService.queryAllDept();
            for(Dept dept1:list){
                if(dept1.getDepName().equals(depName)){
                    deptson.setParentId(dept1.getDepId());
                }
            }
            if(deptson == null) {
                new Exception("未查询到部门");
            }
            for(Dept dept2:list){
                if(dept2.getParentId() == deptson.getParentId()){
                    listps.add(dept2);
                }
                if(listps == null) {
                    new Exception("未查询到部门");
                }
            }
            return listps;
        }else {
            list = deptService.queryAllDept();
            for(Dept dept3:list){
                if(dept3.getParentId() == 0){
                    listps.add(dept3);
                }
            }
            if(listps == null) {
                new Exception("未查询到部门");
            }
            System.out.print(list);
            return listps;
        }
    }
}
