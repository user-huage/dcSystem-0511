package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Post;
import com.hx.dc.service.PostService;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PostController {
    @Autowired
    @Qualifier("postService")
    private PostService postService;

    @RequestMapping("queryPost")
    @ResponseBody
    public Map<String,Object> queryAllPost(Post post, int page, int rows){
        Map<String,Object> pageMap=new HashMap<String, Object>();
        PageInfo pageInfo = postService.queryAllPost(post,page,rows);
        pageMap.put("total",pageInfo.getTotal());
        pageMap.put("rows",pageInfo.getList());
        return pageMap;
    }

    @RequestMapping("ajaxQueryTotalDept")
    @ResponseBody
    public List<Dept> ajaxQueryTotalDept(){
        return postService.ajaxQueryTotalDept();
    }
    @RequestMapping("ajaxQuerySubDept")
    @ResponseBody
    public Object ajaxQuerySubDept(String depName){
       return postService.ajaxQuerySubDept(depName);
    }
    @RequestMapping("ajaxQueryTotalDeptByTotalName")
    @ResponseBody
    public Object ajaxQueryTotalDeptByName(Post post){
        return postService.ajaxQueryTotalDeptByName(post);
    }

    @RequestMapping("addPost")
    @ResponseBody
    public Object insertPost(Post post){
        String msg = postService.insertPost(post);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
    @RequestMapping("updatePost")
    @ResponseBody
    public Object updatePost(Post post){
        String msg = postService.updatePost(post);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
    @RequestMapping("deletePost")
    @ResponseBody
    public Object deletePost(String postIds){
        String[] postIds1=postIds.split(",");
        int[] postIds2=new int[postIds1.length];
        for(int i=0;i<postIds2.length;i++){
            postIds2[i]=Integer.parseInt(postIds1[i]);
        }
        String msg = postService.deletePost(postIds2);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }

}
