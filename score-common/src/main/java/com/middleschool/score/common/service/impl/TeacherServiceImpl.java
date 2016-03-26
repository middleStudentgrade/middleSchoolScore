package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsTeacher;
import com.middleschool.score.common.mapper.MsTeacherMapper;
import com.middleschool.score.common.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private MsTeacherMapper msTeacherMapper;

    @Override
    public MsTeacher selectById(Long id) {
        try {
            MsTeacher msTeacher=msTeacherMapper.selectByPrimaryKey(id);
            return msTeacher;
        }catch (Exception ex){
            return null;
        }
    }

    @Override
    public void saveTeacher(MsTeacher msTeacher) {
        msTeacherMapper.updateByPrimaryKeySelective(msTeacher);
    }
}
