package com.hx.dc.mapper;

import com.hx.dc.entity.Order_Returns;

import java.util.List;

public interface Order_ReturnsMapper extends BaseMapper<Order_Returns>{
    List<Order_Returns> selectOrderByTime(String date);
}