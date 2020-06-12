package com.hx.dc.mapper;

import java.util.List;

/**
 * Created by 85361 on 2020/5/8.
 */
public interface BaseMapper<T> {

    <K> int  deleteByPrimaryKey(K id);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

    //分页查询
    List<T> selectPage(T record);

    List<T> selectAll();
}
