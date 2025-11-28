package org.example.pojo;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ClazzQueryParam {
    private String name;
    private LocalDate begin;
    private LocalDate end;

    private Integer page = 1;
    private Integer pageSize = 10;
}
