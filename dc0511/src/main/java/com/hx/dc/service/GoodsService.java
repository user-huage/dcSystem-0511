package com.hx.dc.service;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Goods;

import java.util.List;

/**
 * Created by SuperMr.gong on 2020/6/4.
 */
public interface GoodsService extends  BaseService<Goods>{
    public PageInfo select1Page2(List<Goods> list, Integer pageIndex, Integer pageSize);
    public List selectId(List<Goods> list);
}
