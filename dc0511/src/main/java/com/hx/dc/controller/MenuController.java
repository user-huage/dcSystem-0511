package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Menu;
import com.hx.dc.entity.MenuTree;
import com.hx.dc.entity.Tree;
import com.hx.dc.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MenuController {
    @Autowired
    @Qualifier("menuService")
    private MenuService menuService;

    @RequestMapping("queryAllMenu")
    @ResponseBody
    public Object queryAllMenu(int page, int rows){
        Map<String,Object> pageMap=new HashMap<String, Object>();
        PageInfo pageInfo = menuService.queryAllMenu(page, rows);
        List<Menu> menus=pageInfo.getList();
        List<MenuTree> menuTrees=new ArrayList<MenuTree>();
        MenuTree menuTree=null;
        Tree tree=null;
        //一级目录
        Map<Integer,Menu> menuMap=new HashMap<Integer, Menu>();
        //二级目录
        Map<Integer,Menu> menuMap2=new HashMap<Integer, Menu>();
        for(Menu menu:menus){
            if(menu.getParentId()==0){
                menuMap.put(menu.getMenuId(),menu);
                menuTree=new MenuTree();
                menuTree.setMenuId(menu.getMenuId());
                menuTree.setMenuName(menu.getMenuName());
                menuTree.setMenuType(menu.getMenuType());
                menuTree.setUrl(menu.getUrl());
                menuTree.setPowerName(menu.getPowerName());
                menuTree.setParentId(menu.getParentId());
                menuTree.setStatus(menu.getStatus());
                menuTree.setSort(menu.getSort());
                menuTrees.add(menuTree);
            }
        }
        for(Menu menu:menus){
            if(menu.getParentId()!=0 && menuMap.get(menu.getParentId())!=null){
                menuMap2.put(menu.getMenuId(),menu);
                menuTree=new MenuTree();
                menuTree.setMenuId(menu.getMenuId());
                menuTree.setMenuName(menu.getMenuName());
                menuTree.setMenuType(menu.getMenuType());
                menuTree.setUrl(menu.getUrl());
                menuTree.setPowerName(menu.getPowerName());
                menuTree.setParentId(menu.getParentId());
                menuTree.setStatus(menu.getStatus());
                menuTree.setSort(menu.getSort());
                for(MenuTree menuTree1:menuTrees){
                    if(menuTree1.getMenuId()==menu.getParentId()){
                        menuTree1.getChildren().add(menuTree);
                    }
                }
            }
        }
        for(Menu menu:menus){
            if(menu.getParentId()!=0 && menuMap2.get(menu.getParentId())!=null){
                menuTree=new MenuTree();
                menuTree.setMenuId(menu.getMenuId());
                menuTree.setMenuName(menu.getMenuName());
                menuTree.setMenuType(menu.getMenuType());
                menuTree.setUrl(menu.getUrl());
                menuTree.setPowerName(menu.getPowerName());
                menuTree.setParentId(menu.getParentId());
                menuTree.setStatus(menu.getStatus());
                menuTree.setSort(menu.getSort());
                for(MenuTree menuTree1:menuTrees){
                    List<MenuTree> menuTrees2=menuTree1.getChildren();
                    for(MenuTree menuTree2:menuTrees2){
                        if(menuTree2.getMenuId()==menu.getParentId()){
                            menuTree2.getChildren().add(menuTree);
                        }
                    }
                }
            }
        }
        pageMap.put("total",pageInfo.getTotal());
        pageMap.put("rows",menuTrees);
        return pageMap;
    }
    @RequestMapping("addMenu")
    @ResponseBody
    public Object insertMenu(Menu menu){
        String msg = menuService.insertMenu(menu);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
    @RequestMapping("updateMenu")
    @ResponseBody
    public Object updateMenu(Menu menu){
        String msg = menuService.updateMenu(menu);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
    @RequestMapping("deleteMenu")
    @ResponseBody
    public Object deleteMenu(int menuId){
        String msg = menuService.deleteMenu(menuId);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
}
