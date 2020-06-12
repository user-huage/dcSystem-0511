package com.hx.dc.service;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Menu;

import java.util.List;

public interface MenuService {
    public PageInfo queryAllMenu(int page, int rows);
    public String insertMenu(Menu menu);
    public String updateMenu(Menu menu);
    public String deleteMenu(int menuId);
}
