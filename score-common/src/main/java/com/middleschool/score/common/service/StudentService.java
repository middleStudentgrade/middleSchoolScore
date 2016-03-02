package com.middleschool.score.common.service;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.MsStudent;


public interface StudentService {
    MsStudent getById(Long id);
    void saveStudent(MsStudent msStudent);
}
