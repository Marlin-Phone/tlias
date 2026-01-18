package org.example.mapper;

import org.apache.ibatis.annotations.*;
import org.example.pojo.Student;
import org.example.pojo.StudentQueryParam;

import java.util.List;
import java.util.Map;

@Mapper
public interface StudentMapper {

    List<Student> list(StudentQueryParam studentQueryParam);

    void delete(List<Integer> ids);

    @Insert("insert into student " +
            "(name, no, gender, phone, id_card, is_college, address, degree, graduation_date, clazz_id, create_time, update_time) values " +
            "(#{name}, #{no}, #{gender}, #{phone}, #{idCard}, #{isCollege}, #{address}, #{degree}, #{graduationDate}, #{clazzId}, #{createTime}, #{updateTime})")
    void add(Student student);

    @Select("select s.*, c.name as clazz_name " +
            "from student s " +
            "         left join clazz c on s.clazz_id = c.id " +
            "where s.id = #{id}")
    Student selectById(int id);

    @Update("update student set " +
            "name = #{name}, " +
            "no = #{no}, " +
            "gender = #{gender}, " +
            "phone = #{phone}, " +
            "degree = #{degree}, " +
            "id_card = #{idCard}, " +
            "is_college = #{isCollege}, " +
            "address = #{address}, " +
            "graduation_date = #{graduationDate}, " +
            "clazz_id = #{clazzId}, " +
            "update_time = #{updateTime} " +
            "where id = #{id}")
    void update(Student student);

    @Update("update student set " +
            "violation_score = #{violationScore}, " +
            "violation_count = #{violationCount}, " +
            "update_time = #{updateTime} " +
            "where id = #{id}")
    void updateScore(Student student);

    @MapKey("name")
    List<Map<String, Object>> countStudentDegreeData();

    @MapKey("clazzList")
    List<Map<String, Object>> countStudentData();
}
