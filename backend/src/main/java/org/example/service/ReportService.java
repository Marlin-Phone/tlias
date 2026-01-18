package org.example.service;

import org.example.pojo.ClazzOption;
import org.example.pojo.JobOption;

import java.util.List;
import java.util.Map;

public interface ReportService {
    JobOption getEmpJobData();

    List<Map<String, Object>> getEmpGenderData();

    List<Map<String, Object>> getStudentDegreeData();

    ClazzOption getClazzData();
}
