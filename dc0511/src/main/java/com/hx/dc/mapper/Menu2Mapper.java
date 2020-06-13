package com.hx.dc.mapper;

import com.hx.dc.entity.Menu2;

import java.util.List;

public interface Menu2Mapper extends BaseMapper<Menu2> {
    List<Menu2> selectMenu();
}