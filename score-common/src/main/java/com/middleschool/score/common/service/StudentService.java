package com.middleschool.score.common.service;

import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.StudentClass;

import java.util.List;


public interface StudentService {
    MsStudent getById(Long  id);
    void updateStudent(MsStudent msStudent);
    List<StudentClass> findAll(int limit,int offset);
    List<StudentClass> findOne(Long id);
    int countStudent();
    int delete(Long id);
    int saveStudent(MsStudent msStudent);
    List<StudentClass> findStudent(String selectContant);
    MsStudent selectByPrimaryKey(Long id);
}
