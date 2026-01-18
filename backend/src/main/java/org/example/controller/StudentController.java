package org.example.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.anno.LogOperation;
import org.example.pojo.*;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @LogOperation
    @DeleteMapping("/{ids}")
    public Result delete(@PathVariable List<Integer> ids){
        log.info("删除学生信息: {}", ids);
         studentService.delete(ids);
        return Result.success();
    }

    @LogOperation
    @PostMapping
    public Result add(@RequestBody Student student){
        log.info("新增学生信息{}", student);
         studentService.add(student);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result selectById(@PathVariable int id){
        log.info("根据id查询学生信息: {}", id);
         Student student = studentService.selectById(id);
        return Result.success(student);
    }

    @LogOperation
    @PutMapping
    public Result update(@RequestBody Student student){
        log.info("修改学生信息: {}", student);
          studentService.update(student);
        return Result.success();
    }

    @LogOperation
    @PutMapping("/violation/{id}/{score}")
    public Result updateScore(@PathVariable int id, @PathVariable int score){
        log.info("学生违纪扣分: id={}, score={}", id, score);
        Student student = studentService.selectById(id);
        studentService.updateScore(student, score);
        return Result.success();
    }
}
