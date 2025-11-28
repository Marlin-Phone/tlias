package org.example.service;

import org.example.pojo.Clazz;
import org.example.pojo.ClazzQueryParam;
import org.example.pojo.PageResult;

public interface ClazzService {
    PageResult<Clazz> findAll(ClazzQueryParam clazzQueryParam);

    void delete(int id);

    void add(Clazz clazz);

    Clazz selectById(int id);

    void update(Clazz clazz);
}
