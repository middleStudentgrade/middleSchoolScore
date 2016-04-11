package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsSchoolmaster;
import com.middleschool.score.common.dto.MsSchoolmasterExample;
import com.middleschool.score.common.mapper.MsSchoolmasterMapper;
import com.middleschool.score.common.service.SchoolMasterService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2016/3/22.
 */
class SchoolMasterServiceImpl implements SchoolMasterService {

    @Autowired
    private MsSchoolmasterMapper msSchoolmasterMapper;
    @Override
    public MsSchoolmaster selectByTeacherId(Long teacherId) {
        MsSchoolmasterExample msSchoolmasterExample=new MsSchoolmasterExample();
        MsSchoolmasterExample.Criteria criteria=msSchoolmasterExample.createCriteria();
        criteria.andTeacherIdEqualTo(teacherId);
        return msSchoolmasterMapper.selectByExample(msSchoolmasterExample).get(0);
    }
}
