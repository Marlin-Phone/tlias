package org.example.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.example.utils.JwtUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * 令牌校验拦截器
 * 职责与过滤器 TokenFilter 相同，选用过滤器，因此该拦截器注释
 */
@Slf4j
@Component
public class TokenInterceptor implements HandlerInterceptor {

//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//
//        // 1. 获取请求路径 http://localhost:8080/login  -->  /login
//        String requestURI = request.getRequestURI();
//        // 2. 是否是登录请求(路径中包含"/login")
//        // 是：放行
//        if(requestURI.contains("/login")){
//            log.info("登录请求，放行");
//            return true;
//        }
//        // 3. 获取请求头中的Token
//        String token = request.getHeader("token");
//        // 4. 判断Token是否存在，如果不存在，说明用户没有登录，返回错误信息（401响应码）
//        if(token == null || token.isEmpty()){
//            log.info("Token不存在，响应401");
//            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401
//            return false;
//        }
//        // 5. 如果Token存在，校验令牌，如果校验失败，返回错误信息（401响应码）
//        if(!JwtUtils.validateToken(token)){
//            log.info("Token校验失败，响应401");
//            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401
//            return false;
//        }else{ // 6. 如果校验成功，放行
//            log.info("Token校验成功，放行");
//            return true;
//        }
//    }
}
