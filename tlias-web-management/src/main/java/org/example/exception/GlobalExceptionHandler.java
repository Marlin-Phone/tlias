package org.example.exception;

import lombok.extern.slf4j.Slf4j;
import org.example.pojo.Result;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    // 处理数据库唯一约束异常，例如手机号重复
    @ExceptionHandler(DuplicateKeyException.class)
    public Result handleDuplicateKeyException(DuplicateKeyException e) {
        log.error("数据库唯一约束异常: {}", e.getMessage(), e);
        // 这里返回给前端一个明确的业务提示信息
        String message = e.getMessage();
        int i = message.indexOf("Duplicate entry");
        String errMsg = message.substring(i);
        String arr[] = errMsg.split(" ");
        return Result.error(arr[2] + "已存在，请更换后重试！");
    }

    // 兜底的全局异常处理
    @ExceptionHandler(Exception.class)
    public Result handleException(Exception e) {
        log.error("发生未知异常: ", e);
        return Result.error("出错了，请联系管理员！");
    }

}
