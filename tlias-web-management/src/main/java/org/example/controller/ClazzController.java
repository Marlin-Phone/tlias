package org.example.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.pojo.*;
import org.example.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/clazzs")
public class ClazzController {

    @Autowired
    private ClazzService clazzService;

    @GetMapping
    public Result findAll(ClazzQueryParam clazzQueryParam){
        log.info("查询全部班级数据{}", clazzQueryParam);
        PageResult<Clazz> clazzPageResult = clazzService.findAll(clazzQueryParam);
        return Result.success(clazzPageResult);
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable int id){
        log.info("删除班级信息: {}", id);
        clazzService.delete(id);
        return Result.success();
    }

    @PostMapping
    public Result add(@RequestBody Clazz clazz){
        log.info("新增班级信息");
        clazzService.add(clazz);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result selectById(@PathVariable int id){
        log.info("根据id查询班级信息: {}", id);
        Clazz clazz = clazzService.selectById(id);
        return Result.success(clazz);
    }

    @PutMapping
    public Result update(@RequestBody Clazz clazz){
        log.info("修改班级信息: {}", clazz);
        clazzService.update(clazz);
        return Result.success();
    }
}
