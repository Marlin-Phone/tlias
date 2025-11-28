package org.example.mapper;

import org.apache.ibatis.annotations.*;
import org.example.pojo.Emp;
import org.example.pojo.EmpQueryParam;

import java.util.List;
import java.util.Map;

/**
 * 员工Mapper接口
 */
@Mapper
public interface EmpMapper {

//    ----------------------- 原始分页查询实现 ------------------------------

//    @Select("SELECT count(*) from emp e left join dept d on e.dept_id = d.id;")
//    public Long count();
//
//    @Select("select e.*, d.name deptName from emp as e left join dept as d on e.dept_id = d.id limit #{start}, #{pageSize}")
//    public List<Emp> list(Integer start , Integer pageSize);

//    @Select("select e.*, d.name deptName from emp as e left join dept as d on e.dept_id = d.id order by e.update_time desc")
//    public List<Emp> list(String name, Integer gender, LocalDate begin, LocalDate end);

    // 使用XML方式实现复杂查询，在src/main/resources/org/example/mapper/EmpMapper.xml下实现
    List<Emp> list(EmpQueryParam empQueryParam);

    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into emp(username, name, gender, phone, job, salary, image, entry_date, dept_id, create_time, update_time) values" +
            "(#{username}, #{name}, #{gender}, #{phone}, #{job}, #{salary}, #{image}, #{entryDate}, #{deptId}, #{createTime}, #{updateTime})")
    void insert(Emp emp);

    // 使用注解方式实现批量删除
    void deleteByIds(List<Integer> ids);

    // 根据ID查询员工工作经历，XML实现
    Emp getById(Integer id);

//    @Update("update emp set username=#{username}, name=#{name}, gender=#{gender}, phone=#{phone}, job=#{job}, salary=#{salary}, image=#{image}, " +
//            "entry_date=#{entryDate}, dept_id=#{deptId}, update_time=#{updateTime} where id=#{id}")
//    以上SQL可扩展性差，不能动态更新字段，改为XML实现
    void update(Emp emp);

    /**
     * 统计员工职位人数
     */
    @MapKey("pos")
    List<Map<String, Object>> countEmpJobData();

    @MapKey("name")
    List<Map<String, Object>> countEmpGenderData();

    @Select("select * from emp")
    List<Emp> listAll();
}
