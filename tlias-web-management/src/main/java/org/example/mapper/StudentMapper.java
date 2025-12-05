package org.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.pojo.Student;
import org.example.pojo.StudentQueryParam;

import java.util.List;

@Mapper
public interface StudentMapper {

    @Select("select s.*, c.name as clazz_name " +
            "from student s " +
            "         left join clazz c on s.clazz_id = c.id " +
            "order by update_time desc")
    List<Student> list(StudentQueryParam studentQueryParam);
}
