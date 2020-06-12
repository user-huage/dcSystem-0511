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
}
