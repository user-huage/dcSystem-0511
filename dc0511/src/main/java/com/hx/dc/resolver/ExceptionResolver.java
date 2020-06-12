package com.hx.dc.resolver;


import com.hx.dc.Exception.CustomException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by my on 2020/5/5.
 */
public class ExceptionResolver implements HandlerExceptionResolver {
    public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1,
                                         Object arg2, Exception arg3){
        CustomException customException = null;

        if(arg3 instanceof CustomException){
            customException = (CustomException) arg3;
        }else{
            customException = new CustomException("未知错误，请联系管理员");
        }
        return new
                ModelAndView("forward:/error.jsp","errMsg",customException.getMessage());

    }
}
