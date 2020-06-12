package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.AccountsDay;
import com.hx.dc.service.AccService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 85361 on 2020/5/28.
 */
//kmk
@Controller
@RequestMapping("/acc")
public class AccController extends BaseController {
    @Autowired
    AccService accService;

    @RequestMapping("/selectAcc")
    @ResponseBody
    public Object selectAcc(AccountsDay accountsDay,String dates,Integer page, Integer rows){
        //调用业务层查询数据
        if(dates!=null){
            PageInfo<AccountsDay> pageInfo = accService.queryPage(dates,page,rows);
            return getPageMap(pageInfo);
        }else {
            PageInfo<AccountsDay> pageInfo = accService.selectPage(accountsDay,page,rows);
            return getPageMap(pageInfo);
        }
    }
}
