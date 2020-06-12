package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.AccountsDay;
import com.hx.dc.mapper.AccountsDayMapper;
import com.hx.dc.service.AccService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 85361 on 2020/5/28.
 */
@Service("AccService")
public class AccServiceImpl extends BaseServiceimpl<AccountsDay> implements AccService {
    @Autowired
    AccountsDayMapper accountsDayMapper;
    @Override
    public PageInfo<AccountsDay> queryPage(String date, Integer pageIndex, Integer pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        //查询数据
        List<AccountsDay> list = accountsDayMapper.queryPage(date);
        //封装查询信息，便于使用
        PageInfo<AccountsDay> pageInfo = new PageInfo<AccountsDay>(list);

        return pageInfo;
    }
}
