package com.hx.dc.service;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.AccountsDay;

/**
 * Created by 85361 on 2020/5/28.
 */
public interface AccService extends BaseService<AccountsDay>{
    PageInfo<AccountsDay> queryPage(String date, Integer pageIndex, Integer pageSize);
}
