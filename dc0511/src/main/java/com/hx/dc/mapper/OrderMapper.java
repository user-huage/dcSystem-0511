package com.hx.dc.mapper;

import com.hx.dc.entity.Order;

import java.util.List;

public interface OrderMapper extends BaseMapper<Order> {
    int insert(Order record);
    List<Order> selectOrderByTime(String date);
}