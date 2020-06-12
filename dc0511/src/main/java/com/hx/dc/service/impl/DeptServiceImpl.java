package com.hx.dc.service.impl;

import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Post;
import com.hx.dc.mapper.DeptMapper;
import com.hx.dc.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("deptService")
public class DeptServiceImpl implements DeptService {

    @Autowired
    @Qualifier("deptMapper")
    private DeptMapper deptMapper;

    @Override
    public List<Dept> queryAllDept() {
        return deptMapper.queryAllDept();
    }

    @Override
    public String insertDept(Dept dept) {
        String msg="添加失败！！！";
        Dept reuturnDept = deptMapper.queryDeptByName(dept);
        if(reuturnDept!=null){
            msg="部门已存在，无法重复添加！！！";
            return msg;
        }
        int num = deptMapper.insertDept(dept);

        if(num==1){
            msg="添加成功！！！";
        }
        return msg;
    }

    @Override
    public Dept queryDeptByName(Dept dept) {
        return deptMapper.queryDeptByName(dept);
    }

    @Override
    public String updateDept(Dept dept) {
        String msg="修改失败！！！";
        Dept reuturnDept = deptMapper.queryDeptByName(dept);
        if(reuturnDept!=null && reuturnDept.getDepId()!=dept.getDepId()){
            msg="部门已存在，无法重复修改！！！";
            return msg;
        }
        int num = deptMapper.updateDept(dept);

        if(num==1){
            msg="修改成功！！！";
        }
        return msg;
    }

    @Override
    public String deleteDept(String[] depNames) {
        String msg="删除成功！！！";
        List<Post> posts = deptMapper.quertTotalDeptToPost(depNames);
        if(posts.size()!=0){
            return "无法删除，只能删除职务表没有使用的部门";
        }
        List<Post> posts2 = deptMapper.quertSubDeptToPost(depNames);
        if(posts2.size()!=0){
            return "无法删除，只能删除职务表没有使用的部门";
        }
        int num = deptMapper.deleteDept(depNames);
        if(num==0){
            msg="删除失败！！！";
        }
        return msg;
    }

}
