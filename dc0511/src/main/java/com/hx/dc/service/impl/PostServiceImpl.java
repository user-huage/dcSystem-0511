package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Post;
import com.hx.dc.mapper.PostMapper;
import com.hx.dc.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service("postService")
public class PostServiceImpl implements PostService {
    @Autowired
    @Qualifier("postMapper")
    private PostMapper postMapper;

    @Override
    public PageInfo queryAllPost(Post post, int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Post> posts = postMapper.queryAllPost(post);
        for(Post post1:posts){
            if("1".equals(post1.getDeptType())){
                post1.setDeptType("总部");
            }else {
                post1.setDeptType("分部");
            }
            if("1".equals(post1.getStatus())){
                post1.setStatus("可用");
            }else {
                post1.setStatus("禁用");
            }

        }
        PageInfo pageInfo=new PageInfo(posts);
        return pageInfo;
    }

    @Override
    public List<Dept> ajaxQueryTotalDept() {
        return postMapper.ajaxQueryTotalDept();
    }

    @Override
    public List<Dept> ajaxQuerySubDept(String depName) {
        return postMapper.ajaxQuerySubDept(depName);
    }

    @Override
    public Dept ajaxQueryTotalDeptByName(Post post) {
        return postMapper.ajaxQueryTotalDeptByName(post);
    }

    @Override
    public String insertPost(Post post) {
        if(post.getSubName()==""){
            post.setSubName(null);
        }
        String msg="添加失败！！！";
        Post post1 = postMapper.queryPostByPostName(post);
        if(post1!=null && post1.getPostId()!=post.getPostId()){
            msg="该职务已经在店铺中存在，无法重复添加！！！";
            return msg;
        }
        if(post.getSubName()==null || post.getSubName()==""){
            post.setDeptType("1");
        }else {
            post.setDeptType("0");
        }
        int num= postMapper.insertPost(post);
        if(num==1){
            msg="添加成功！！！";
        }
        return msg;
    }

    @Override
    public String updatePost(Post post) {
        String msg="修改失败！！！";
        Post posts = postMapper.queryPostByPostName(post);
        if(posts!=null && posts.getPostId()!=post.getPostId()){
            msg="该职务已经在店铺中存在，无法修改！！！";
            return msg;
        }
        if(post.getSubName()==null || post.getSubName()==""){
            post.setDeptType("1");
        }else {
            post.setDeptType("0");
        }
        int num= postMapper.updatePost(post);
        if(num==1){
            msg="修改成功！！！";
        }
        return msg;
    }

    @Override
    public String deletePost(int[] postIds) {
        String msg="删除成功！！！";
        List<Emp> emps = postMapper.queryPostToEmp(postIds);
        if(emps.size()>0){
            return "无法删除，只能删除所有员工都不是的职务";
        }
        int num = postMapper.deletePost(postIds);
        if(num==0){
            msg="删除失败！！！";
        }
        return msg;
    }
}
