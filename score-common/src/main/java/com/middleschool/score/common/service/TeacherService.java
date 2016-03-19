package com.middleschool.score.common.service;


import com.middleschool.score.common.dto.MsTeacher;

public interface TeacherService {
    MsTeacher selectById(Long  id);
}
