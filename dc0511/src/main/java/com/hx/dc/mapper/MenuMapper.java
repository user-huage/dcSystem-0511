package com.hx.dc.mapper;

import com.hx.dc.entity.Menu;

import java.util.List;

public interface MenuMapper {
    public List<Menu> queryAllMenu();
    public Menu queryMenuByName(Menu menu);
    public int insertMenu(Menu menu);
    public int updateMenu(Menu menu);
    public int deleteMenu(int menuId);
}
