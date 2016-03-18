package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.mapper.MsScoreMapper;
import com.middleschool.score.common.mapper.MsStudentMapper;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private MsStudentMapper msStudentMapper;

    @Autowired
    private MsScoreMapper msScoreMapper;

    @Override
    public MsStudent getById(Long  id) {
         return  msStudentMapper.selectByPrimaryKey(id);
    }

    @Override
    public void saveStudent(MsStudent msStudent) {
        msStudentMapper.updateByPrimaryKeySelective(msStudent);
    }
}
