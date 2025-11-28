package org.example.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.example.pojo.Clazz;
import org.example.pojo.ClazzQueryParam;

import java.util.List;

@Mapper
public interface ClazzMapper {

    @Results({
            @Result(column = "create_time", property = "createTime"),
            @Result(column = "update_time", property = "updateTime")
    })

//    @Select("select\n" +
//            "    c.id,\n" +
//            "    c.name 'name',\n" +
//            "    c.room,\n" +
//            "    c.begin_date,\n" +
//            "    c.end_date,\n" +
//            "    e.id 'master_id',\n" +
//            "    e.name 'master_name',\n" +
//            "    c.create_time,\n" +
//            "    c.update_time,\n" +
//            "    case\n" +
//            "       when CURDATE() < c.begin_date then '未开班'\n" +
//            "       when CURDATE() between c.begin_date and c.end_date then '已开班'\n" +
//            "       when CURDATE() > c.end_date then '已结课'\n" +
//            "    end status\n" +
//            "from clazz c\n" +
//            "left join emp e on c.master_id = e.id;")
    List<Clazz> list(ClazzQueryParam clazzQueryParam);

    @Delete("delete from clazz where id = #{id}")
    void delete(int id);
}
