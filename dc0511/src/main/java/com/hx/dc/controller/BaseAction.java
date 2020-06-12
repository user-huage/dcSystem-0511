package com.hx.dc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

/**
 * Created by SuperMr.gong on 2020/5/9.
 */
@Controller
@RequestMapping("/base1")
public class BaseAction {

    @Resource
    ServletContext application;
    @RequestMapping("goURL/{folder}/{file}")
    //定义一个通用的页面跳转的方法
    public String goURL(@PathVariable("folder")String folder, @PathVariable("file")String file){
        System.out.println("url："+folder+"/"+file);
        return "forward:/WEB-INF/"+folder+"/"+file+".jsp";
    }
}