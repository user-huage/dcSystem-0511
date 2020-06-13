package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.MenuParameter;
import com.hx.dc.service.MenuParameterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by LYS on 2020/5/24.
 */
@Controller
@RequestMapping("menuParameter")
public class MenuParameterController extends BaseController {
    @Resource
    private MenuParameterService menuParameterService;

    @RequestMapping("insert")
    @ResponseBody
    public int insert(MenuParameter menuParameter){
        System.out.println(menuParameter.getMenuParameter()+menuParameter.getMenuStyleselect());
        int i = menuParameterService.insert(menuParameter);
        if(i!=0) {
            return 1;
        }
        return 0;
    }

    @RequestMapping("delete")
    @ResponseBody
    public int delete(MenuParameter menuParameter){
        int i = menuParameterService.updateByPrimaryKeySelective(menuParameter);
        if(i!=0){
            return 1;
        }
        return 0;
    }

    @RequestMapping("update")
    @ResponseBody
    public Object update(MenuParameter menuParameter){
        System.out.println(menuParameter.getMenuName());
        int menu = menuParameterService.updateByPrimaryKey(menuParameter);
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
    public Object selectPage(MenuParameter menuParameter, Integer page, Integer rows){
        //调用业务层查询数据
        System.out.println(menuParameter.getMenuName());
        PageInfo<MenuParameter> pageInfo = menuParameterService.selectPage(menuParameter,page,rows);
       /* Map<String,Object> pageMap = new HashMap<>();
        pageMap.put("total",pageInfo.getTotal());//获取总记录数
        pageMap.put("rows",pageInfo.getList());//获取用户数据列表
        return pageMap;*/
        //return getPageMap(pageInfo);
        return getPageResult(pageInfo);
    }

    @RequestMapping("selectImt")
    @ResponseBody
    public Object selectImt(MenuParameter menuParameter){
        return  menuParameterService.selectImt(menuParameter.getMenuName());
    }
}
