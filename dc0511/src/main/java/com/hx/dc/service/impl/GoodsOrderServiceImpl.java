package com.hx.dc.service.impl;

import com.hx.dc.entity.GoodsOrder;
import com.hx.dc.mapper.GoodsOrderMapper;
import com.hx.dc.service.GoodsOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * Created by my on 2020/5/29.
 */
@Service
//后厨订单管理
public class GoodsOrderServiceImpl extends BaseServiceimpl<GoodsOrder> implements GoodsOrderService {
    @Autowired
    GoodsOrderMapper goodsOrderMapper;
    @Override
    public int insertId(List<GoodsOrder> list) {
        int i = goodsOrderMapper.insert2(list);
        return i;
    }
}
