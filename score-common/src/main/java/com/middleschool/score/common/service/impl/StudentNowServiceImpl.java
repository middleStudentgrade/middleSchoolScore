package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsStudentNow;
import com.middleschool.score.common.dto.MsStudentNowExample;
import com.middleschool.score.common.mapper.MsStudentNowMapper;
import com.middleschool.score.common.service.StudentNowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/5/8.
 */
@Service
public class StudentNowServiceImpl implements StudentNowService {

    @Autowired
    private MsStudentNowMapper msStudentNowMapper;
    @Override
    public MsStudentNow getByStudentId(Long studentId) {
        MsStudentNowExample msStudentNowExample=new MsStudentNowExample();
        MsStudentNowExample.Criteria criteria=msStudentNowExample.createCriteria();
        criteria.andStudentIdEqualTo(studentId);
        List<MsStudentNow> msStudentNows = msStudentNowMapper.selectByExample(msStudentNowExample);
        if(msStudentNows.size()!=0)
            return msStudentNows.get(0);
        return null;
    }

    @Override
    public int save(MsStudentNow msStudentNow) {
        return msStudentNowMapper.updateByPrimaryKeySelective(msStudentNow);
    }
}
