package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.util.Erweima;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/base")
public class BaseController {

    @Resource
    ServletContext application;


    Erweima erweima = new Erweima();

    @RequestMapping("/goURL/{folder}/{file}")
    //定义一个通用的页面跳转的方法
    public String goURL(@PathVariable("folder")String folder, @PathVariable("file")String file){
        System.out.println("url："+folder+"/"+file);
        return "forward:/WEB-INF/"+folder+"/"+file+".jsp";
    }

    public  <T> Map<String,Object> getPageMap(PageInfo<T> pageInfo){
        Map<String,Object> pageMap = new HashMap<>();
        pageMap.put("total",pageInfo.getTotal());//获取总记录数
        pageMap.put("rows",pageInfo.getList());//获取用户数据列表
        return pageMap;
    }


    public String creatErweima(String basePath,Integer w,Integer h,String DiningtableName, String DepName){
        String path3;
        String path0 = application.getRealPath("/");
        String path2 = path0+basePath;
        String name = DiningtableName+"_"+DepName;
        String Type = "gif";
        String photoName = name+"Erweima.";
        // path3 = path2+"\\"+name+Type;
        path3 = basePath+"\\"+photoName+Type;
        System.out.print("sdf"+path2);
        String url="http://localhost:8080/goURL/Table_Order/addOrder.mvc";

        try {
            erweima.create(url,path2,w,h,Type,name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("最终路径:"+path3);
        return path3;
    }

    public String GetTimeNow(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        String date1 = sdf.format(date);
        System.out.print("date1是"+date1);
        return date1;
    }


}
