package org.example.service;

import org.example.pojo.Emp;
import org.example.pojo.PageResult;

public interface EmpService {

    /**
     * 分页查询员工信息
     *
     * @param page     当前页
     * @param pageSize 每页显示条数
     * @return 员工分页结果
     */
    PageResult<Emp> page(Integer page, Integer pageSize);
}
