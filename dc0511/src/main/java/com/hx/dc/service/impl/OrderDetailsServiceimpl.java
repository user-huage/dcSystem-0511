package com.hx.dc.service.impl;

import com.hx.dc.entity.Order_Details;
import com.hx.dc.mapper.Order_DetailsMapper;
import com.hx.dc.service.OrderDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by SuperMr.gong on 2020/6/3.
 */
@Service("OrderDetailsService")


public class OrderDetailsServiceimpl extends BaseServiceimpl<Order_Details> implements OrderDetailsService {
    @Autowired
    Order_DetailsMapper orderDetailsMapper;
    @Override
    public int insert(List<Order_Details> odlist) {
        int i = orderDetailsMapper.insertList(odlist);
        return i;
    }

}
