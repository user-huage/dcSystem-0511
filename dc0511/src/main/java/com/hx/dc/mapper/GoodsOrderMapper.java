package com.hx.dc.mapper;

import com.hx.dc.entity.GoodsOrder;

import java.util.List;

//后厨订单管理
public interface GoodsOrderMapper extends BaseMapper<GoodsOrder>  {
    /*int deleteByPrimaryKey(Integer id);

    int insert(GoodsOrder record);

    int insertSelective(GoodsOrder record);

    GoodsOrder selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsOrder record);

    int updateByPrimaryKey(GoodsOrder record);*/
    int insert2(List<GoodsOrder> record);
}