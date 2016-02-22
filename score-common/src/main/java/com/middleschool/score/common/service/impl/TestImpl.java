package com.middleschool.score.common.service.impl;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.mapper.MsStudentMapper;
import com.middleschool.score.common.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestImpl implements TestService {

    @Autowired
    private MsStudentMapper mgStudentMapper;

    @Override
    public void saveTest(MsStudent mgStudent) {
        mgStudentMapper.insertSelective(mgStudent);
    }
}
