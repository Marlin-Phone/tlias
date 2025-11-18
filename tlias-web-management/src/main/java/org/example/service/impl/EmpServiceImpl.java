package org.example.service.impl;

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

    @Override
    public PageResult<Emp> page(Integer page, Integer pageSize) {
        // 调用Mapper接口查询总记录数
        Long total = empMapper.count();
        // 调用Mapper接口查询结果列表
        Integer start = (page - 1) * pageSize;
        List<Emp> rows = empMapper.list(start, pageSize);
        // 封装结果
        return new PageResult<Emp>(total, rows);
    }

    @Autowired
    public void setEmpMapper(EmpMapper empMapper) {
        this.empMapper = empMapper;
    }
}
