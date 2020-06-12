package com.hx.dc.service;

import com.hx.dc.entity.Param;

import java.util.Map;

/**
 * Created by 85361 on 2020/5/12.
 */
public interface ParamService extends BaseService<Param> {
    void updateParam(Param param);
    void setParam(Param param);
    Map<String,Object> loadSysParam();
}
