package org.example.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentPageResult {
    Integer id;     // id
    String name;    // 姓名
    Integer no;     // 学号
    Integer gender; // 性别 , 1: 男 , 2 : 女
    String phone;   // 手机号
    Integer degree; // 最高学历, 1: 初中, 2: 高中 , 3: 大专 , 4: 本科 , 5: 硕士 , 6: 博士
    String idCard;  // 身份证号
    Integer isCollege;// 是否来自于院校, 1: 是, 0: 否
    String address; // 联系地址
    String graduationDate; // 毕业时间
    Integer violationCount; // 违纪次数
    Integer violationScore; // 违纪扣分
    String clazzName;// 班级名称
    String createTime;  // 创建时间
    String updateTime;  // 修改时间
}
