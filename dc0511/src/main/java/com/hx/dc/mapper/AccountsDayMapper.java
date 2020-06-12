package com.hx.dc.mapper;

import com.hx.dc.entity.AccountsDay;

import java.util.List;

public interface AccountsDayMapper extends BaseMapper<AccountsDay> {
    void insertAccList(List<AccountsDay> list);
    List<AccountsDay> queryPage(String date);
}