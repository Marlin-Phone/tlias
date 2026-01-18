package org.example.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.example.mapper.OperateLogMapper;
import org.example.pojo.LogQueryParam;
import org.example.pojo.OperateLog;
import org.example.pojo.PageResult;
import org.example.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    OperateLogMapper operateLogMapper;

    @Override
    public PageResult<OperateLog> page(LogQueryParam logQueryParam) {
        //1.设置分页查询参数
        PageHelper.startPage(logQueryParam.getPage(),logQueryParam.getPageSize());
        //2.执行查询
        List<OperateLog> logList = operateLogMapper.list(logQueryParam);
        //3.解析查询结果，并封装
        Page<OperateLog> page = (Page<OperateLog>) logList;
        return new PageResult<OperateLog>(page.getTotal(),page.getResult());
    }
}