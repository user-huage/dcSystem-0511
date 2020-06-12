package com.hx.dc.service;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Post;

import java.util.List;

public interface PostService {
    public PageInfo queryAllPost(Post post, int pageNumber, int pageSize);
    public List<Dept> ajaxQueryTotalDept();
    public List<Dept> ajaxQuerySubDept(String depName);
    public Dept ajaxQueryTotalDeptByName(Post post);
    public String insertPost(Post post);
    public String updatePost(Post post);
    public String deletePost(int[] postIds);
}
