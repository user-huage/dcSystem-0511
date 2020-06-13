package com.hx.dc.service;

import com.hx.dc.entity.MenuParameter;

import java.util.List;

/**
 * Created by LYS on 2020/5/24.
 */
public interface MenuParameterService extends BaseService<MenuParameter> {
    List<MenuParameter> selectImt(String menuParameter);

    int deleteByMunuName(String menuName);
}
