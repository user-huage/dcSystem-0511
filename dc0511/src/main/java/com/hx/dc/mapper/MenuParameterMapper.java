package com.hx.dc.mapper;

import com.hx.dc.entity.MenuParameter;

import java.util.List;

public interface MenuParameterMapper extends BaseMapper<MenuParameter> {
    List<MenuParameter> selectImt(String menuParameter);
    public int deleteByMunuName(String menuName) ;
}