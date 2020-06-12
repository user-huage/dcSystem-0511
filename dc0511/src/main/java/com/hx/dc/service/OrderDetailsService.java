package com.hx.dc.service;

import com.hx.dc.entity.Order_Details;

import java.util.List;

/**
 * Created by SuperMr.gong on 2020/6/3.
 */
public interface OrderDetailsService extends BaseService<Order_Details> {
    public int insert(List<Order_Details> odlist);
}
