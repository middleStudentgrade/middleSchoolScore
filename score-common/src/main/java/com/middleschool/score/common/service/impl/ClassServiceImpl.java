package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsClass;
import com.middleschool.score.common.dto.MsClassExample;
import com.middleschool.score.common.mapper.MsClassMapper;
import com.middleschool.score.common.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/5/8.
 */
@Service
public class ClassServiceImpl implements ClassService{

    @Autowired
    private MsClassMapper msClassMapper;
    @Override
    public List<MsClass> getByRankDeptAndGradeAndName(String name, int grade) {
        return msClassMapper.selectByNameAndDeptAndGrade(grade,name);
    }

    @Override
    public MsClass getById(Long id) {
        return  msClassMapper.selectByPrimaryKey(id);
    }

    @Override
    public  List<MsClass> selectById(Long id) {
        return msClassMapper.selectById(id);
    }

    @Override
    public MsClass getTeacherId(Long teacherId) {
        MsClassExample msClassExample=new MsClassExample();
        MsClassExample.Criteria criteria=msClassExample.createCriteria();
        criteria.andTeacherIdEqualTo(teacherId);
        return msClassMapper.selectByExample(msClassExample).get(0);
    }

}
