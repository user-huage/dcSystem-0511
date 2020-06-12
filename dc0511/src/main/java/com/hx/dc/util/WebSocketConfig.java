package com.hx.dc.util;
import com.hx.dc.handler.SystemWebSocketHandler;
import com.hx.dc.Interceptor.MyHandshakeInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebMvc
@EnableWebSocket
public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer{
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        System.out.println("......注册......");
        //这个类的标红的代码 解释 问题2
        String url="http://localhost:8080";
        // String url=ConfigUtil.getProperty(Constants.WEBSOCKET_IP);
        // System.out.println("配置的地址:"+url);
        String[] hrf={url};
        //配置webSocket路径
        registry.addHandler(systemWebSocketHandler(), "/websocket.mvc").addInterceptors(new MyHandshakeInterceptor()).setAllowedOrigins(hrf);

        //配置webSocket路径 支持前端使用socketJs
        registry.addHandler(systemWebSocketHandler(), "/sockjs/websocket.mvc").setAllowedOrigins("http://localhost:8080").addInterceptors(new MyHandshakeInterceptor()).withSockJS();
    }
    @Bean
    public WebSocketHandler systemWebSocketHandler(){
        System.out.println("......创建WebSocketHandler......");
        return new SystemWebSocketHandler();
    }
}