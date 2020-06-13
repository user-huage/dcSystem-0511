package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Goods;
import com.hx.dc.mapper.GoodsMapper;
import com.hx.dc.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by SuperMr.gong on 2020/6/4.
 */
@Service("goodsService")
public class GoodsServiceimpl extends BaseServiceimpl<Goods> implements GoodsService {
    @Autowired
    GoodsMapper goodsMapper;
    @Override
    public PageInfo select1Page2(List<Goods> list, Integer pageIndex, Integer pageSize) {
        //startPage：设置的分页查询条件，它只起作用于接下来的第一条执行的sql
        PageHelper.startPage(pageIndex, pageSize);
        //查询数据
        List<Goods> list1 = goodsMapper.selectPage2(list);
        for (Goods d:list1
             ) {
            System.out.println("1."+d.getGoodsId()+"-2."+d.getGoodsName()+"-3."+d.getGoodsPrice());
        }
        //封装查询信息，便于使用
        PageInfo pageInfo = new PageInfo(list1);

        return pageInfo;
    }

    @Override
    public List selectId(List<Goods> list) {
        List<Goods> list1 = goodsMapper.selectPage2(list);
        return list1;
    }

    @Override
    public int updateByPrimaryKeySelective(Goods record) {
        return baseMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int insertSelective(Goods goods) {
        goods.setGoodsDelete("2");
        return baseMapper.insertSelective(goods);
    }

    @Override
    public int updateByPrimaryKey(Goods goods) {
        goods.setGoodsDelete("2");
        return baseMapper.updateByPrimaryKey(goods);
    }
}
