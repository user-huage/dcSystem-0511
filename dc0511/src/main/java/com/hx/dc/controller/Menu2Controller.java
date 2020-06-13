package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Menu2;
import com.hx.dc.service.Menu2Service;
import com.hx.dc.service.MenuParameterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by LYS on 2020/5/24.
 */
@Controller
@RequestMapping("menu2")
public class Menu2Controller extends BaseController {
    @Resource
    private Menu2Service menu2Service;
    @Resource
    private MenuParameterService menuParameterService;

    @RequestMapping("insert")
    @ResponseBody
    public int insert(Menu2 menu2){
        System.out.println(menu2.getMenuName());
        int menu = menu2Service.insert(menu2);
        if(menu!=0) {
            return 1;
        }
        return 0;
    }

    @RequestMapping("delete")
    @ResponseBody
    public int delete(Menu2 menu2){
        int i = menu2Service.updateByPrimaryKeySelective(menu2);
        if(i!=0){
            return 1;
        }
        return 0;
    }

    @RequestMapping("update")
    @ResponseBody
    public Object update(Menu2 menu2){
        System.out.println(menu2.getMenuName());
        int menu = menu2Service.updateByPrimaryKey(menu2);
        if(menu!=0){
            return 1;
        }
        return 0;
    }

    /*
  分页查询：
  查询参数：page int 表示当前页
           rows int 表示页大小
   返回的数据：json格式 {"total":28,"rows":[}}
           total int 表示匹配的数据条数
           rows  数据 表示查询出来的数据列表
           "rows"
  */
    @RequestMapping("selectPage")
    @ResponseBody
    public Object selectPage(Menu2 menu2, Integer page, Integer rows){
        //调用业务层查询数据
        PageInfo<Menu2> pageInfo = menu2Service.selectPage(menu2,page,rows);
       /* Map<String,Object> pageMap = new HashMap<>();
        pageMap.put("total",pageInfo.getTotal());//获取总记录数
        pageMap.put("rows",pageInfo.getList());//获取用户数据列表
        return pageMap;*/
        //return getPageMap(pageInfo);
        return getPageResult(pageInfo);
    }

    @RequestMapping("selectMenu")
    @ResponseBody
    public Object selectMenu(Menu2 menu2){
        System.out.println(menu2.getMenuName());
       return menu2Service.selectMenu();
}
}
