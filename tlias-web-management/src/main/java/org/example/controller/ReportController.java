package org.example.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.pojo.JobOption;
import org.example.pojo.Result;
import org.example.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/empJobData")
    public Result getEmpJobData() {
        log.info("获取员工职位数据报表");
        JobOption jobOption =  reportService.getEmpJobData();
        return Result.success(jobOption);
    }

    // 统计员工性别人数
    @GetMapping("/empGenderData")
    public Result getEmpGenderData() {
        log.info("获取员工性别数据报表");
        List<Map<String, Object>> genderList =  reportService.getEmpGenderData();
        return Result.success(genderList);
    }
}
