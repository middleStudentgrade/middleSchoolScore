package com.middleschool.score.common.service;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.StudentClass;

import java.util.List;


public interface StudentService {
    MsStudent getById(Long  id);
    void saveStudent(MsStudent msStudent);
    List<StudentClass> findAll(int limit,int offset);
    List<StudentClass> findOne(Long id);
    int countStudent();
}
