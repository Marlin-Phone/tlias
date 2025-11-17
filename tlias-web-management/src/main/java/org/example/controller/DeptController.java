package org.example.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.example.pojo.Dept;
import org.example.pojo.Result;
import org.example.service.DeptService;
import org.springframework.aop.scope.ScopedProxyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class DeptController {

    @Autowired
    private DeptService deptService;

//    查询部门
    @GetMapping("/depts")
    public Result list(){
        System.out.println("查询全部部门数据");
        List<Dept> deptList = deptService.findAll();
        return Result.success(deptList);
    }

//    删除部门-方法三
    @DeleteMapping("/depts")
    public Result delete(Integer id){
        System.out.println("删除部门，id="+id);
        deptService.deleteById(id);
        return Result.success();
    }

//    添加部门
    @PostMapping("/depts")
    public Result add(@RequestBody Dept dept){ // 使用 @RequestBody 注解从请求体中获取 Dept 对象
        System.out.println("添加部门，dept="+dept);
        deptService.add(dept);
        return Result.success();
    }

//    查询回显
    @GetMapping("/depts/{id}")
    public Result getInfo(@PathVariable Integer id){
        System.out.println("查询部门回显，id="+id);
        Dept dept = deptService.getById(id);
        return Result.success(dept);
    }

//    修改部门
    @PutMapping("/depts")
    public Result update(@RequestBody Dept dept){
        System.out.println("修改部门，dept="+dept);
        deptService.update(dept);
        return Result.success();
    }
}
