package org.example.service.impl;

import org.example.exception.DeptHasEmployeesException;
import org.example.mapper.DeptMapper;
import org.example.pojo.Dept;
import org.example.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    public List<Dept> findAll(){
        return deptMapper.findAll();
    }

    public void deleteById(Integer id){
        long empCount = deptMapper.countByDeptId(id);
        if (empCount > 0) {
            throw new DeptHasEmployeesException("对不起，当前部门下有员工，不能直接删除！");
        }
        deptMapper.deleteById(id);
    }

    public void add(Dept dept){
//        补全基础属性
        dept.setCreateTime(LocalDateTime.now());
        dept.setUpdateTime(LocalDateTime.now());
//        调用Mapper接口方法插入数据
        deptMapper.add(dept);
    }

    public Dept getById(Integer id){
        return deptMapper.getById(id);
    }

    public void update(Dept dept){
        dept.setUpdateTime(LocalDateTime.now());
        deptMapper.update(dept);
    }
}