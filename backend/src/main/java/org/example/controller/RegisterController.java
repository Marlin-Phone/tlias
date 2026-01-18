package org.example.controller;


import lombok.extern.slf4j.Slf4j;
import org.example.pojo.Emp;
import org.example.pojo.Result;
import org.example.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 注册控制器
 */
@Slf4j
@RestController
public class RegisterController {

    @Autowired
    private EmpService empService;

    @PostMapping("/register")
    public Result registerEmp(@RequestBody Emp emp){
        log.info("用户注册: {}", emp);
        boolean isSuccess = empService.register(emp);
        if(isSuccess){
            return Result.success("注册成功");
        }else{
            return Result.error("注册失败，用户名可能已存在");
        }
    }
}
