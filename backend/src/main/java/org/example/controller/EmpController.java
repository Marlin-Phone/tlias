package org.example.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.anno.LogOperation;
import org.example.pojo.*;
import org.example.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j // 记录日志
@RequestMapping("/emps")
public class EmpController {

    @Autowired
    private EmpService empService;

    @GetMapping
    public Result page(EmpQueryParam empQueryParam) {
        log.info("查询所有员工信息{}", empQueryParam);
        PageResult<Emp> pageResult = empService.page(empQueryParam);
        return Result.success(pageResult);
    }

    @LogOperation
    @PostMapping
    public Result save(@RequestBody Emp emp){
        log.info("新增员工信息: {}", emp);
        empService.save(emp);
        return Result.success();
    }

//    删除多个员工信息
    @LogOperation
    @DeleteMapping
    public Result delete(@RequestParam List<Integer> ids){
        log.info("删除员工信息: {}", ids);
        empService.delete(ids);
        return Result.success();
    }

//    查询回显
    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id){
        log.info("根据ID查询员工信息: {}", id);
        Emp emp = empService.getInfo(id);
        return Result.success(emp);
    }

//    修改员工信息
    @LogOperation
    @PutMapping
    public Result update(@RequestBody Emp emp){
        log.info("修改员工信息: {}", emp);
        empService.update(emp);
        return Result.success();
    }

    //   查询所有员工信息
    @GetMapping("/list")
    public Result listAll(){
        log.info("查询所有员工信息");
        List<Emp> empList = empService.listAll();
        return Result.success(empList);
    }

    // 修改员工密码
    @PutMapping("/password")
    public Result updatePassword(@RequestBody EmpPassword empPassword){
        log.info("修改员工密码: {}", empPassword);
        empService.updatePassword(empPassword);
        return Result.success();
    }
}
