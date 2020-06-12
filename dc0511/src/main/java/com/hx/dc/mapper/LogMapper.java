package com.hx.dc.mapper;

import com.hx.dc.entity.Log;

import java.util.List;

public interface LogMapper extends BaseMapper<Log> {
    void insertLog(Log log);
    List<Log> queryPage(String date);
    String selectLog(Log log);
    int updateLog(Log log);
    String selectLogBydate(String d, String s);
}