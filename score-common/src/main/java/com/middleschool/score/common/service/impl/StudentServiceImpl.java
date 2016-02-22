package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.mapper.MsStudentMapper;
import com.middleschool.score.common.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private MsStudentMapper msStudentMapper;
    @Override
    public MsStudent getById(long id) {
        try {
            MsStudent msStudent = msStudentMapper.selectByPrimaryKey(id);
            return msStudent;
        }catch (Exception ex){
            return null;
        }
    }
}
