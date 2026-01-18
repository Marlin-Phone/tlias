package org.example.config;

import org.example.interceptor.TokenInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Web配置类，用于注册拦截器等Web相关配置
 * 职责与过滤器 TokenFilter 相同，选用过滤器，因此该拦截器注释
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

//    @Autowired
//    private TokenInterceptor tokenInterceptor;
//
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(tokenInterceptor).addPathPatterns("/**"); // 拦截所有请求
//    }

}
