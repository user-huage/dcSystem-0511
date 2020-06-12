package com.hx.dc.mapper;

import com.hx.dc.entity.Param;

import java.util.List;

public interface ParamMapper extends BaseMapper<Param> {
    void updateParam(Param param);
    void setParam(Param param);
    List<Param> selectAll();
}