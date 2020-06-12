package com.hx.dc.service;

import com.github.pagehelper.PageInfo;

/**
 * Created by zcf on 2020/5/7.
 */
public interface BaseService<T> {

    <K> int  deleteByPrimaryKey(K id);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

    public PageInfo<T> selectPage(T entity, Integer pageIndex, Integer pageSize);
}