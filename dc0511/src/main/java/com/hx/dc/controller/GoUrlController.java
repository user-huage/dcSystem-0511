package com.hx.dc.controller;

import com.hx.dc.entity.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoUrlController {
    @RequestMapping("goUrl")
    public String goUrl(Model model,Role role , String src, Dept dept, String[] a, Post post, Menu menu,Emp emp){
        model.addAttribute("dept",dept);
        model.addAttribute("a",a);
        model.addAttribute("post",post);
        model.addAttribute("menu",menu);
        model.addAttribute("role",role);
        model.addAttribute("emp",emp);
        return src;
    }
}
