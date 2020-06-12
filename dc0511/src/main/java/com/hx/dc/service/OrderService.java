package com.hx.dc.service;

import com.hx.dc.entity.Order;

/**
 * Created by SuperMr.gong on 2020/5/25.
 */
public interface OrderService extends BaseService<Order>  {
   // public Order select(String orderId);
   public int insert (Order order);
}
