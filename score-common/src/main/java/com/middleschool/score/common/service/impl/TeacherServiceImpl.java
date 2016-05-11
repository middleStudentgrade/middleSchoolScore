package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsTeacher;
import com.middleschool.score.common.dto.MsTeacherExample;
import com.middleschool.score.common.mapper.MsTeacherMapper;
import com.middleschool.score.common.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public int countTeacher() {
        MsTeacherExample msTeacherExample=new MsTeacherExample();
        MsTeacherExample.Criteria criteria=msTeacherExample.createCriteria();
        return msTeacherMapper.countByExample(msTeacherExample);
    }

    @Override
    public void saveTeacher(MsTeacher msTeacher) {
        msTeacherMapper.updateByPrimaryKeySelective(msTeacher);
    }

    @Override
    public int delete(Long id) {
        return msTeacherMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateTeacher(MsTeacher msTeacher) {
        msTeacherMapper.updateByPrimaryKeySelective(msTeacher);
    }

    @Override
    public List<MsTeacher> findAll(int limit, int offset) {
        return msTeacherMapper.selectAll(limit,offset);
    }

    @Override
    public List<MsTeacher> findTeacher(String name) {
        return msTeacherMapper.getTeacher(name);
    }
}
