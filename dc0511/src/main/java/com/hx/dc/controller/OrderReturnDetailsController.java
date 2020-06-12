package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Order_Return_Details;
import com.hx.dc.service.DetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by SuperMr.gong on 2020/5/28.
 */
@Controller
@RequestMapping("details")
public class OrderReturnDetailsController extends BaseAction {
    @Resource
    private DetailsService detailsService;
@RequestMapping("selectPage")
@ResponseBody
public Object selectPage(Order_Return_Details details, Integer page, Integer rows){
    PageInfo<Order_Return_Details> pageInfo =  detailsService.selectPage(details,page,rows);
    Map<String,Object> pageMap = new HashMap<>();
    pageMap.put("total",pageInfo.getTotal());//获取总记录数
    pageMap.put("rows",pageInfo.getList());//获取用户列表

    return pageMap;
}

}
