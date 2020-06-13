package com.hx.dc.service;

import com.hx.dc.entity.SysParam;

import java.util.Map;

/**
 * Created by my on 2020/6/12.
 */
public interface SysparamService extends BaseService<SysParam> {
    //加载系统参数方法
    public Map<String, Object> loadSysParam();

}
