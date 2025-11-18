package org.example.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.example.mapper.EmpMapper;
import org.example.pojo.Emp;
import org.example.pojo.PageResult;
import org.example.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    private EmpMapper empMapper;
//------------------------- 原始分页查询 ----------------------------
//    @Override
//    public PageResult<Emp> page(Integer page, Integer pageSize) {
//        // 调用Mapper接口查询总记录数
//        Long total = empMapper.count();
//        // 调用Mapper接口查询结果列表
//        Integer start = (page - 1) * pageSize;
//        List<Emp> rows = empMapper.list(start, pageSize);
//        // 封装结果
//        return new PageResult<Emp>(total, rows);
//    }

    /**
     * PageHelper分页查询实现
     * @param page     当前页
     * @param pageSize 每页显示条数
     * @return
     */

    @Override
    public PageResult<Emp> page(Integer page, Integer pageSize) {
        // 1. 设置分页参数
        PageHelper.startPage(page, pageSize);

        // 2. 执行查询
        List<Emp> empList = empMapper.list();

        // 3. 解析查询结果并封装
        Page<Emp> p = (Page<Emp>) empList;
        return new PageResult<Emp>(p.getTotal(), p.getResult());
    }

    @Autowired
    public void setEmpMapper(EmpMapper empMapper) {
        this.empMapper = empMapper;
    }
}
