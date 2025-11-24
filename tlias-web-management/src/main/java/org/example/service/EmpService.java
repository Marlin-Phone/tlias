package org.example.service;

import org.example.pojo.Emp;
import org.example.pojo.EmpQueryParam;
import org.example.pojo.PageResult;

public interface EmpService {

    /**
     * 分页查询员工信息
     * @param empQueryParam     当前页
     * @return 员工分页结果
     */
    PageResult<Emp> page(EmpQueryParam empQueryParam);

    void save(Emp emp);
}
