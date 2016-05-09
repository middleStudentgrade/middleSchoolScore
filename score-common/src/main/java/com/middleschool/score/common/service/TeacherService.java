package com.middleschool.score.common.service;


import com.middleschool.score.common.dto.MsTeacher;

import java.util.List;

public interface TeacherService {
    MsTeacher selectById(Long  id);
    int countTeacher();
    void saveTeacher(MsTeacher msTeacher);
    int delete(Long id);
    void updateTeacher(MsTeacher msTeacher);
    List<MsTeacher> findAll(int limit,int offset);
}
