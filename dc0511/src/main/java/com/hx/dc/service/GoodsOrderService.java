package com.hx.dc.service;

import com.hx.dc.entity.GoodsOrder;

import java.util.List;

/**
 * Created by my on 2020/6/7.
 */
//后厨订单管理
public interface GoodsOrderService extends BaseService<GoodsOrder> {
    //批量增加
    public int insertId(List<GoodsOrder> list);
}
