package com.hx.dc.mapper;

import com.hx.dc.entity.Goods;

import java.util.List;

public interface GoodsMapper extends BaseMapper<Goods> {
/*    int deleteByPrimaryKey(Integer goodsId);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer goodsId);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);*/
List<Goods> selectPage2(List record);
}