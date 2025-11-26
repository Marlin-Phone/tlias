package org.example.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.example.mapper.EmpExprMapper;
import org.example.mapper.EmpMapper;
import org.example.pojo.*;
import org.example.service.EmpLogService;
import org.example.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;
    @Autowired
    private EmpExprMapper empExprMapper;
    @Autowired
    private EmpLogService empLogService;

    /**
     * PageHelper分页查询实现
     * @param empQueryParam     当前页
     * @return 员工分页结果
     */
    @Override
    public PageResult<Emp> page(EmpQueryParam empQueryParam) {
        Integer page = empQueryParam.getPage();
        Integer pageSize = empQueryParam.getPageSize();
        // 1. 设置分页参数
        PageHelper.startPage(page, pageSize);
        // 2. 执行查询
        List<Emp> empList = empMapper.list(empQueryParam);
        // 3. 解析查询结果并封装
        Page<Emp> p = (Page<Emp>) empList;
        return new PageResult<Emp>(p.getTotal(), p.getResult());
    }

//    @Transactional // 事务管理注解 - 默认出现运行时异常(RunTimeException)时才回滚
    @Transactional(rollbackFor = Exception.class) // 出现任意异常时都回滚
    public void save(Emp emp) {
        try {
            // 1. 保存员工的基本信息
            emp.setCreateTime(LocalDateTime.now());
            emp.setUpdateTime(LocalDateTime.now());
            if (emp.getPhone() == null) {
                emp.setPhone("");
            }
            empMapper.insert(emp);

//            int i = 1 / 0; // 制造异常，测试事务回滚

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
        } finally {
            // 记录操作日志
            EmpLog empLog = new EmpLog(null, LocalDateTime.now(), "新增员工" + emp);
            empLogService.insertLog(empLog);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Integer> ids){
    try{
        // 1. 删除员工的工作经历信息
        empExprMapper.deleteByEmpIds(ids);
        // 2. 删除员工的基本信息
        empMapper.deleteByIds(ids);
    } finally {
        // 3. 记录操作日志
        EmpLog empLog = new EmpLog(null, LocalDateTime.now(), "删除员工ID列表" + ids);
        empLogService.insertLog(empLog);
        }
    }
}
