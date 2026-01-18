package org.example.pojo;

import lombok.Data;

@Data
public class StudentQueryParam {
    String name;
    Integer degree;
    Integer clazzId;

    Integer page = 1;
    Integer pageSize = 10;
}
