package org.example.service;

import org.example.pojo.*;

import java.util.List;

public interface EmpService {

    /**
     * 分页查询员工信息
     * @param empQueryParam     当前页
     * @return 员工分页结果
     */
    PageResult<Emp> page(EmpQueryParam empQueryParam);

    void save(Emp emp);

    void delete(List<Integer> ids);

    Emp getInfo(Integer id);

    void update(Emp emp);

    List<Emp> listAll();

    LoginInfo login(Emp emp);

    void updatePassword(EmpPassword empPassword);

    boolean register(Emp emp);
}
