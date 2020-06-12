package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Param;
import com.hx.dc.service.ParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/sysParam")
public class ParamController extends BaseController {
    @Autowired
    ParamService paramService;

    @PostConstruct
    public void loadSysParam(){
        System.out.println("---初始化系统参数---");
        Map<String,Object> sysParamMap=paramService.loadSysParam();
        application.setAttribute("sysParamMap",sysParamMap);
        System.out.println("---初始化完成---");
    }

    @RequestMapping("/selectParam")
    @ResponseBody
    public Object selectParam(Param sysParam, Integer page, Integer rows){
        //调用业务层查询数据
        PageInfo<Param> pageInfo = paramService.selectPage(sysParam,page,rows);
        return getPageMap(pageInfo);
    }

    @RequestMapping("/selectPayFlow")
    @ResponseBody
    public Object selectPayFlow(Param sysParam, Integer page, Integer rows){
        //调用业务层查询数据
        sysParam.setField("flow_name");
        PageInfo<Param> pageInfo = paramService.selectPage(sysParam,page,rows);
        return getPageMap(pageInfo);
    }

    @RequestMapping("/selectMode")
    @ResponseBody
    public Object selectMode(Param sysParam, Integer page, Integer rows){
        //调用业务层查询数据
        sysParam.setField("mode");
        PageInfo<Param> pageInfo = paramService.selectPage(sysParam,page,rows);
        return getPageMap(pageInfo);
    }

    @RequestMapping("/updateParamForFlow")
    @ResponseBody
    public Map updateParamForFlow(Param sysParam){
        //调用业务层查询数据
        sysParam.setField("flow_name");
        paramService.updateParam(sysParam);
        paramService.setParam(sysParam);
        Map map=new HashMap();
        map.put("msg","启动成功");
        return map;
    }

    @RequestMapping("/updateParamForMode")
    @ResponseBody
    public Map updateParamForMode(Param sysParam){
        //调用业务层查询数据
        sysParam.setField("mode");
        paramService.updateParam(sysParam);
        paramService.setParam(sysParam);
        Map map=new HashMap();
        map.put("msg","启动成功");
        return map;
    }
}
