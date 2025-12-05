package org.example.service;

import org.example.pojo.PageResult;
import org.example.pojo.Student;
import org.example.pojo.StudentQueryParam;

public interface StudentService {

    PageResult<Student> findAll(StudentQueryParam studentQueryParam);

}
