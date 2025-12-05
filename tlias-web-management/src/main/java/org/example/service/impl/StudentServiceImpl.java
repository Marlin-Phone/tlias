package org.example.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.example.mapper.StudentMapper;
import org.example.pojo.PageResult;
import org.example.pojo.Student;
import org.example.pojo.StudentQueryParam;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public PageResult<Student> findAll(StudentQueryParam studentQueryParam) {
        Integer page = studentQueryParam.getPage();
        Integer pageSize = studentQueryParam.getPageSize();
        // 1. 设置分页参数
        PageHelper.startPage(page,pageSize);
        // 2. 执行查询
        List<Student> studentList = studentMapper.list(studentQueryParam);
        // 3. 解析查询结果并封装
        Page<Student> p = (Page<Student>) studentList;
        return new PageResult<Student>(p.getTotal(), p.getResult());
    }

    @Override
    public void delete(List<Integer> ids) {
        studentMapper.delete(ids);
    }

}
