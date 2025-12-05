package org.example.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.pojo.*;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/students")
@Slf4j
@RestController
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping
    public Result findAll(StudentQueryParam studentQueryParam){
        log.info("查询全部学生数据{}", studentQueryParam);
        PageResult<Student> studentPageResult = studentService.findAll(studentQueryParam);
        return Result.success(studentPageResult);
    }

}
