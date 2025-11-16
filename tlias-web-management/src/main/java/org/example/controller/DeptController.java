package org.example.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.example.pojo.Dept;
import org.example.pojo.Result;
import org.example.service.DeptService;
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
}
