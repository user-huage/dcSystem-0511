package com.hx.dc.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by my on 2020/5/2.
 */
public class HandlerInterceptor1 implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1,Object arg2, Exception arg3) throws Exception{
        System.out.println("---Interceptor1.afterCompletion---");
    }
    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3)throws Exception{
        System.out.println("---Interceptor1.postHandle---");
    }
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handle)throws Exception{
        System.out.println("---Interceptor1.preHandle---");
        return true;
    }
}
