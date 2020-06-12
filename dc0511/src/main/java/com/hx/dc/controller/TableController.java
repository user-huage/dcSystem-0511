package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Table;
import com.hx.dc.service.TableService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by my on 2020/5/25.
 */
//餐桌管理控制器
//state（1，可用 2，有预约订单 3，正在使用  4，结束使用 5，禁用 6，删除)
@Controller
@RequestMapping(value = "/table")
public class TableController extends BaseController {
   private String path4 = "erweima\\table";

    @Resource
    TableService tableService;

    //定义一个通用的页面跳转的方法
    public String goURL(Table table, Model model ,@PathVariable("folder")String folder, @PathVariable("file")String file){
        System.out.println("url："+folder+"/"+file);
        System.out.println(table);
        model.addAttribute("table",table);
        return "forward:/WEB-INF/"+folder+"/"+file+".jsp";
    }


    @RequestMapping(value = "/selectList")
    @ResponseBody
    public Object selectList(Table table,Integer page, Integer rows){
        System.out.println("diaoyong");
        if(table.getDepName() == ""){
            table.setDepName(null);
        }
        if(table.getDiningtableId() == ""){
            table.setDiningtableId(null);
        }
        if(table.getDiningtableName()== ""){
            table.setDiningtableName(null);
        }
         if(table.getSeating() == null){
            table.setSeating(null);
        }
       if(table.getState() == null){
            table.setState(null);
        }
 /*      if(table.getQrCode()==""){
           table.setQrCode(null);
       }*/
        System.out.println(table);
        System.out.println("fanwen");
        PageInfo<Table> pageInfo = tableService.selectPage(table,page,rows);//page,rows);
        System.out.print(pageInfo.getList());
           return getPageMap(pageInfo);
    }

    @RequestMapping(value = "/addTable")
   @ResponseBody
    public int addtable(Table table){

        table.setCreatTime(GetTimeNow());
        table.setUserId("hhgdz");
        System.out.println(table);
        String name = table.getDepName()+"_"+table.getDiningtableId();
        System.out.println("name"+name);

        String Qrcode = creatErweima(path4,37,37,table.getDiningtableName(),table.getDepName());
       table.setQrCode(Qrcode);
        System.out.println("图片路径:"+table.getQrCode());
        System.out.println(table);
        int i = tableService.insertSelective(table);
        System.out.print(i);
        return i;
    }

    @RequestMapping("updateTable")
    @ResponseBody
    public int updatetable(Table table){
        Date  date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        String date1 = sdf.format(date);
        System.out.print(date1);
        table.setUpdateTime(date1);
        if(table.getQrCode().equals("1")){
            String erweima = creatErweima(path4,37,37,table.getDiningtableName(),table.getDepName());
            table.setQrCode(erweima);
        }
        int count = tableService.updateByPrimaryKeySelective(table);
        System.out.print("数据库修改数据条数:"+count);
        return count;
    }

    @RequestMapping("deleteTable")
    @ResponseBody
    public String deletetable(@RequestParam("diningtableId") String diningtableId, @RequestParam("depName") String depName){
        String msg = null;
        Table table = new Table();
        table.setDiningtableId(diningtableId);
        table.setDepName(depName);
        System.out.println("餐桌编号:"+table.getDiningtableId());
        table.setState(4);
        int i = tableService.updateByPrimaryKeySelective(table);
        //int i = tableService.deleteByPrimaryKey(table.getId());
        System.out.print("数据库修改数据条数:" + i);
        if (1 == i) {
        msg = "删除成功";
        }else{
            msg = "删除失败";
        }
        return msg;
    }

}
