package org.example.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.example.mapper.ClazzMapper;
import org.example.pojo.Clazz;
import org.example.pojo.ClazzQueryParam;
import org.example.pojo.PageResult;
import org.example.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ClazzServiceImpl implements ClazzService {

    @Autowired
    private ClazzMapper clazzMapper;

    @Override
    public PageResult<Clazz> findAll(ClazzQueryParam clazzQueryParam) {
        Integer page = clazzQueryParam.getPage();
        Integer pageSize = clazzQueryParam.getPageSize();
        // 1. 设置分页参数
        PageHelper.startPage(page,pageSize);
        // 2. 执行查询
        List<Clazz> clazzList = clazzMapper.list(clazzQueryParam);
        // 3. 解析查询结果并封装
        Page<Clazz> p = (Page<Clazz>) clazzList;
        return new PageResult<Clazz>(p.getTotal(), p.getResult());
    }

    @Override
    public void delete(int id) {
        clazzMapper.delete(id);
    }

    @Override
    public void add(Clazz clazz) {
        clazz.setUpdateTime(LocalDateTime.now());
        clazzMapper.add(clazz);
    }

    @Override
    public Clazz selectById(int id) {
        return clazzMapper.selectById(id);
    }

    @Override
    public void update(Clazz clazz) {
        clazz.setUpdateTime(LocalDateTime.now());
        clazzMapper.update(clazz);
    }

    @Override
    public List<Clazz> selectAll() {
        return clazzMapper.selectAll();
    }
}
