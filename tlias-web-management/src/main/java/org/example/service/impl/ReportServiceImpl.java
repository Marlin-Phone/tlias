package org.example.service.impl;

import org.example.mapper.EmpMapper;
import org.example.mapper.StudentMapper;
import org.example.pojo.JobOption;
import org.example.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private EmpMapper empMapper;
    @Autowired
    private StudentMapper studentMapper;

    @Override
    public JobOption getEmpJobData() {
        // 1. 调用Mapper层方法获取数据
        List<Map<String,Object>> list = empMapper.countEmpJobData();

        // 2. 组装结果并返回
       List<Object> jobList =  list.stream().map(dataMap -> dataMap.get("pos")).toList();
       List<Object> dataList =  list.stream().map(dataMap -> dataMap.get("num")).toList();

       return new JobOption(jobList,dataList);
    }

    @Override
    public List<Map<String, Object>> getEmpGenderData() {
        return empMapper.countEmpGenderData();
    }

    @Override
    public List<Map<String, Object>> getStudentDegreeData() {
        return studentMapper.countStudentDegreeData();
    }
}
