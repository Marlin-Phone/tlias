package org.example.pojo;

import lombok.Data;

/**
 * 统一结果返回类
 * @Data 注解会自动生成getter/setter/toString等方法
 */
@Data
public class Result {
    private Integer code;
    private String msg;
    private Object data;

    public static Result success(){
        Result result = new Result();
        result.code = 1;
        result.msg = "success";
        return result;
    }

    public static Result success(Object object){
        Result result = new Result();
        result.code = 1;
        result.msg = "success";
        result.data = object;
        return result;
    }

    public static Result error(String msg){
        Result result = new Result();
        result.code = 0;
        result.msg = msg;
        return result;
    }
}
