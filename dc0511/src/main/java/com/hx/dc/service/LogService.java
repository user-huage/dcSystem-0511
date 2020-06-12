package com.hx.dc.service;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Log;

/**
 * Created by 85361 on 2020/5/29.
 */
public interface LogService extends BaseService<Log> {
    PageInfo<Log> queryPage(String date, Integer pageIndex, Integer pageSize);
    String selectLog(Log log);
    int updateLog(Log log);
    String selectLogBydate(String date, String s);
}
