package org.example.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.anno.LogOperation;
import org.example.pojo.Dept;
import org.example.pojo.Result;
import org.example.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j  // 自动生成日志对象log，这样就可以直接使用log.info()等方法记录日志
@RequestMapping("/depts")   // 定义处理的请求路径和处理方式
@RestController // 标识这是一个控制器类，返回JSON格式的数据
public class DeptController {

    @Autowired // 自动注入DeptService依赖
    private DeptService deptService;

//    查询部门
    @GetMapping
    public Result list(){
        log.info("查询全部部门数据");
        List<Dept> deptList = deptService.findAll();
        return Result.success(deptList);
    }

//    删除部门-方法三
    @LogOperation
    @DeleteMapping
    public Result delete(Integer id){
        log.info("删除部门，id={}", id);
        deptService.deleteById(id);
        return Result.success();
    }

//    添加部门
    @LogOperation
    @PostMapping
    public Result add(@RequestBody Dept dept){ // 使用 @RequestBody 注解从请求体中获取 Dept 对象
        log.info("添加部门，dept={}", dept);
        deptService.add(dept);
        return Result.success();
    }

//    查询回显
    @GetMapping("/{id}")
    public Result getInfo(@PathVariable Integer id){
        log.info("查询部门回显，id={}", id);
        Dept dept = deptService.getById(id);
        return Result.success(dept);
    }

//    修改部门
    @LogOperation
    @PutMapping
    public Result update(@RequestBody Dept dept){
        log.info("修改部门，dept={}", dept);
        deptService.update(dept);
        return Result.success();
    }
}
