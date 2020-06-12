package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Menu;
import com.hx.dc.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmpController {

    @Autowired
    @Qualifier("empService")
    private EmpService empService;

    @RequestMapping("login")
    public String login(Emp emp, HttpSession session){
        Emp returnEmp = empService.login(emp);
        if(returnEmp!=null){
            session.setAttribute("user",returnEmp);
            List<Menu> menus = empService.queryEmpMenu(returnEmp);
            for(Menu a:menus){
                System.out.println(a);
            }
            session.setAttribute("menus",menus);
            return "redirect:/index.jsp";
        }
        return "redirect:/login.jsp";
    }

    @RequestMapping("quit")
    public String quit(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/login.jsp";
    }

    @RequestMapping("queryAllEmp")
    @ResponseBody
    public Map<String,Object> queryAllEmp(Emp emp,int page, int rows){
        Map<String,Object> pageMap=new HashMap<String, Object>();
        PageInfo pageInfo = empService.queryAllEmp(emp,page,rows);
        pageMap.put("total",pageInfo.getTotal());
        pageMap.put("rows",pageInfo.getList());
        return pageMap;
    }
    @RequestMapping("ajaxQueryPost")
    @ResponseBody
    public Object ajaxQueryPost(Emp emp){
        return empService.ajaxQueryPost(emp);
    }
    @RequestMapping("addEmp")
    @ResponseBody
    public Object insertEmp(Emp emp){
        String msg = empService.insertEmp(emp);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }

    @RequestMapping("updateEmp")
    @ResponseBody
    public Object updateEmp(Emp emp){
        String msg = empService.updateEmp(emp);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
    @RequestMapping("deleteEmp")
    @ResponseBody
    public Object deleteEmp(String empIds){
        String[] empIds1=empIds.split(",");
        int[] empIds2=new int[empIds1.length];
        for(int i=0;i<empIds2.length;i++){
            empIds2[i]=Integer.parseInt(empIds1[i]);
        }
        String msg = empService.deleteEmp(empIds2);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
}
