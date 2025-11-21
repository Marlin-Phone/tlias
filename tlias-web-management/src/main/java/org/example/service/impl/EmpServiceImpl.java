package org.example.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.example.mapper.EmpExprMapper;
import org.example.mapper.EmpMapper;
import org.example.pojo.Emp;
import org.example.pojo.EmpExpr;
import org.example.pojo.EmpQueryParam;
import org.example.pojo.PageResult;
import org.example.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;
    @Autowired
    private EmpExprMapper empExprMapper;
//------------------------- 原始分页查询 ----------------------------
//    @Override
//    public PageResult<Emp> page(Integer page, Integer pageSize) {
//        // 调用Mapper接口查询总记录数
//        Long total = empMapper.count();
//        // 调用Mapper接口查询结果列表
//        Integer start = (page - 1) * pageSize;
//        List<Emp> rows = empMapper.list(start, pageSize);
//        // 封装结果
//        return new PageResult<Emp>(total, rows);
//    }

    /**
     * PageHelper分页查询实现
     * @param empQueryParam     当前页
     * @return
     */

//    @Override
//    public PageResult<Emp> page(Integer page, Integer pageSize, String name, Integer gender, LocalDate begin, LocalDate end) {
//        // 1. 设置分页参数
//        PageHelper.startPage(page, pageSize);
//
//        // 2. 执行查询
//        List<Emp> empList = empMapper.list(name, gender, begin, end);
//
//        // 3. 解析查询结果并封装
//        Page<Emp> p = (Page<Emp>) empList;
//        return new PageResult<Emp>(p.getTotal(), p.getResult());
//    }


    @Override
    public PageResult<Emp> page(EmpQueryParam empQueryParam) {
        Integer page = empQueryParam.getPage();
        Integer pageSize = empQueryParam.getPageSize();
        // 1. 设置分页参数
        PageHelper.startPage(page, pageSize);

        // 2. 执行查询
//        List<Emp> empList = empMapper.list(name, gender, begin, end);
        List<Emp> empList = empMapper.list(empQueryParam);

        // 3. 解析查询结果并封装
        Page<Emp> p = (Page<Emp>) empList;
        return new PageResult<Emp>(p.getTotal(), p.getResult());
    }

    public void save(Emp emp) {
        // 1. 保存员工的基本信息
        emp.setCreateTime(LocalDateTime.now());
        emp.setUpdateTime(LocalDateTime.now());
        // Ensure phone is not null to satisfy DB NOT NULL constraint
        if (emp.getPhone() == null) {
            emp.setPhone("");
        }
        empMapper.insert(emp);
        // 2. 保存员工的工作经历信息
        List<EmpExpr> exprList = emp.getExprList();
        if(!CollectionUtils.isEmpty(exprList)){
            // 遍历工作经历列表，设置员工ID
            for(EmpExpr expr : exprList){
                expr.setEmpId(emp.getId());
            }
            // 批量插入工作经历数据
            empExprMapper.insertBatch(exprList);
        }
    }

    @Autowired
    public void setEmpMapper(EmpMapper empMapper) {
        this.empMapper = empMapper;
    }
}
