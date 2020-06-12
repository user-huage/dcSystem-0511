package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Log;
import com.hx.dc.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 85361 on 2020/5/29.
 */
@Controller
@RequestMapping("/log")
public class LogController extends BaseController {
    @Autowired
    LogService logService;

    @RequestMapping("/selectLog")
    @ResponseBody
    public Object selectLog(Log log,String dates, Integer page, Integer rows){
        //调用业务层查询数据
        if(dates!=null){
            PageInfo<Log> pageInfo = logService.queryPage(dates,page,rows);
            return getPageMap(pageInfo);
        }else {
            PageInfo<Log> pageInfo = logService.selectPage(log,page,rows);
            return getPageMap(pageInfo);
        }
    }
    @RequestMapping("/updateLog")
    @ResponseBody
    public Object updateLog(Log log, String date, String s, HttpSession session){
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(currentTime);
        String msg=null;
        if(date!=null && s!=null){
            String [] str=date.split("-");
            if(str[1].length()==1){
                str[1]="0"+str[1];
            }
            if(str[2].length()==1){
                str[2]="0"+str[2];
            }
            log.setTaskId(s+str[0]+str[1]+str[2]);
            msg=logService.selectLogBydate(date,s);
        }else {
            msg=logService.selectLog(log);
        }
        if(msg==null){
            msg="";
        }
        Emp user=(Emp) session.getAttribute("user");
        String userName = user.getUserName();
        log.setLogMsg(msg+dateString+userName+" 更新成功；");
        log.setUpdateTime(currentTime);
        log.setUser(userName);
        int i=logService.updateLog(log);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","更新成功");
        }else {
            map.put("msg","更新失败！原因：找不到该行数据");
        }
        return map;
    }
}
