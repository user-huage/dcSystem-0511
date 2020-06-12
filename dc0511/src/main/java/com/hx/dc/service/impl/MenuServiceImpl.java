package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Menu;
import com.hx.dc.entity.Post;
import com.hx.dc.mapper.MenuMapper;
import com.hx.dc.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Autowired
    @Qualifier("menuMapper")
    private MenuMapper menuMapper;

    @Override
    public PageInfo queryAllMenu(int page, int rows) {
        PageHelper.startPage(page,rows);
        List<Menu> menus = menuMapper.queryAllMenu();
        for(Menu menu1:menus){
            if("1".equals(menu1.getMenuType())){
                menu1.setMenuType("菜单");
            }else {
                menu1.setMenuType("按钮");
            }
            if("1".equals(menu1.getStatus())){
                menu1.setStatus("可用");
            }else {
                menu1.setStatus("禁用");
            }

        }
        PageInfo pageInfo=new PageInfo(menus);
        return pageInfo;
    }

    @Override
    public String insertMenu(Menu menu) {
        String msg="添加失败！！！";
        Menu returnMenu = menuMapper.queryMenuByName(menu);
        if(returnMenu!=null){
            msg="该目录已经存在，无法重复添加！！！";
            return msg;
        }
        int num=menuMapper.insertMenu(menu);
        if(num==1){
            msg="添加成功！！！";
        }
        return msg;
    }

    @Override
    public String updateMenu(Menu menu) {
        String msg="修改失败！！！";
        Menu returnMenu = menuMapper.queryMenuByName(menu);
        if(returnMenu!=null && returnMenu.getMenuId()!=menu.getMenuId()){
            msg="该目录已经存在，无法修改！！！";
            return msg;
        }
        int num= menuMapper.updateMenu(menu);
        if(num==1){
            msg="修改成功！！！";
        }
        return msg;
    }

    @Override
    public String deleteMenu(int menuId) {
        String msg="删除成功！！！";
        int num = menuMapper.deleteMenu(menuId);
        if(num==0){
            msg="删除失败！！！";
        }
        return msg;
    }
}
