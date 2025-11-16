package org.example.service;

import org.apache.ibatis.annotations.Select;
import org.example.pojo.Dept;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DeptService {
    List<Dept> findAll();

    void deleteById(Integer id);
}
