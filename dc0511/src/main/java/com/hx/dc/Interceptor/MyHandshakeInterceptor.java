package com.hx.dc.Interceptor;


import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class MyHandshakeInterceptor extends HttpSessionHandshakeInterceptor {
    // 在握手之前执行该方法, 继续握手返回true, 中断握手返回false. 通过attributes参数设置WebSocketSession的属性
    @Override
    public boolean beforeHandshake(ServerHttpRequest request,
                                   ServerHttpResponse response, WebSocketHandler wsHandler,
                                   Map<String, Object> attributes) throws Exception {
        System.out.println("beforeHandshake");

        // 获得 session 和request对象
        ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
        // 获得session
        //   HttpSession session =
        // servletRequest.getServletRequest().getSession(false);
        // 获得httpServletRequest
        HttpServletRequest httpRequest = servletRequest.getServletRequest();
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }

    // 在握手之后执行该方法. 无论是否握手成功都指明了响应状态码和相应头.
    @Override
    public void afterHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,Exception ex) {
        System.out.println("afterHandshake");
        super.afterHandshake(request, response, wsHandler, ex);
    }
}