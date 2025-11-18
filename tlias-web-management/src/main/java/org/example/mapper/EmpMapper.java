package org.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.pojo.Emp;

import java.util.List;

/**
 * 员工Mapper接口
 */
@Mapper
public interface EmpMapper {

    @Select("SELECT count(*) from emp e left join dept d on e.dept_id = d.id;")
    public Long count();

    @Select("select e.*, d.name deptName from emp as e left join dept as d on e.dept_id = d.id limit #{start}, #{pageSize}")
    public List<Emp> list(Integer start , Integer pageSize);

}
