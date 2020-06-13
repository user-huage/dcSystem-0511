package com.hx.dc.mapper;

import com.hx.dc.entity.SysParam;

import java.util.List;

public interface SysParamMapper extends BaseMapper<SysParam> {
 /*   int deleteByPrimaryKey(Long sysParam);

    int insert(SysParam record);

    int insertSelective(SysParam record);

    SysParam selectByPrimaryKey(Long sysParam);

    int updateByPrimaryKeySelective(SysParam record);

    int updateByPrimaryKey(SysParam record);*/

   List<SysParam> selectOtherTable(String sql);

  List<SysParam> loadsysParam();


}