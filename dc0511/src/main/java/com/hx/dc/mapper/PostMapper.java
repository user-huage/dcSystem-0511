package com.hx.dc.mapper;

import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Post;

import java.util.List;

public interface PostMapper {
    public List<Post> queryAllPost(Post post);
    public Post queryPostByPostName(Post post);
    public List<Dept> ajaxQueryTotalDept();
    public List<Dept> ajaxQuerySubDept(String depName);
    public Dept ajaxQueryTotalDeptByName(Post post);
    public int insertPost(Post post);
    public int updatePost(Post post);
    public List<Emp> queryPostToEmp(int[] postIds);
    public int deletePost(int[] postIds);
}
