package com.middleschool.score.common.service.impl;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.MsUser;
import com.middleschool.score.common.mapper.MsStudentMapper;
import com.middleschool.score.common.mapper.MsUserMapper;
import com.middleschool.score.common.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestImpl implements TestService {

    @Autowired
    private MsStudentMapper mgStudentMapper;
    @Autowired
    private MsUserMapper msUserMapper;

    @Override
    public void saveTest(MsUser mgStudent) {
        msUserMapper.insertSelective(mgStudent);
    }

    @Override
    public MsStudent selectstudent(Long  id) {
    MsStudent msStudent=mgStudentMapper.selectByPrimaryKey(id);
        return msStudent;
    }

}
