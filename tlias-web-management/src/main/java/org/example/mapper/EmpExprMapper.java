package org.example.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.example.pojo.EmpExpr;

import java.util.List;

/**
 * 员工工作经历Mapper接口
 */
@Mapper
public interface EmpExprMapper {
    /**
     * 批量插入员工工作经历
     * @param exprList  工作经历列表
     */
    // 使用XML方式实现批量插入，在src/main/resources/org/example/mapper/EmpExprMapper.xml下实现
    void insertBatch(List<EmpExpr> exprList);
}
