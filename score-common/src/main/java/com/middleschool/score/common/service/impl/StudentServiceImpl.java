package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.*;
import com.middleschool.score.common.mapper.MsScoreMapper;
import com.middleschool.score.common.mapper.MsStudentMapper;
import com.middleschool.score.common.mapper.StudentClassMapper;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private MsStudentMapper msStudentMapper;

    @Autowired
    private StudentClassMapper studentClassMapper;

    @Autowired
    private MsScoreMapper msScoreMapper;

    @Override
    public MsStudent getById(Long  id) {
         return  msStudentMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateStudent(MsStudent msStudent) {
        msStudentMapper.updateByPrimaryKeySelective(msStudent);
    }

    @Override
    public List<StudentClass> findAll(int limit,int offset) {
        return studentClassMapper.findAllStudents(limit,offset);
    }

    @Override
    public List<StudentClass> findOne(Long id) {
        return studentClassMapper.findOne(id);
    }

    @Override
    public int countStudent() {
        MsStudentExample msStudentExample=new MsStudentExample();
        MsStudentExample.Criteria criteria=msStudentExample.createCriteria();
        return msStudentMapper.countByExample(msStudentExample);
    }

    @Override
    public int delete(Long id) {
        return msStudentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int saveStudent(MsStudent msStudent) {
       return  msStudentMapper.insertSelective(msStudent);
    }
}
