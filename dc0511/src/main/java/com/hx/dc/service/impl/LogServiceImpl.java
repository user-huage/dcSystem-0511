package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Log;
import com.hx.dc.mapper.LogMapper;
import com.hx.dc.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 85361 on 2020/5/29.
 */
@Service("LogService")
public class LogServiceImpl extends BaseServiceimpl<Log> implements LogService {
    @Autowired
    LogMapper logMapper;
    @Override
    public PageInfo<Log> queryPage(String date, Integer pageIndex, Integer pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        //查询数据
        List<Log> list = logMapper.queryPage(date);
        //封装查询信息，便于使用
        PageInfo<Log> pageInfo = new PageInfo<Log>(list);

        return pageInfo;
    }

    @Override
    public String selectLog(Log log) {
        return logMapper.selectLog(log);
    }

    @Override
    public int updateLog(Log log) {
        return logMapper.updateLog(log);
    }

    @Override
    public String selectLogBydate(String date, String s) {
        String str=s+"%";
        return logMapper.selectLogBydate(date,str);
    }
}
