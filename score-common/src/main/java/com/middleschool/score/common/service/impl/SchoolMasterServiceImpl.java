package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsSchoolmaster;
import com.middleschool.score.common.dto.MsSchoolmasterExample;
import com.middleschool.score.common.mapper.MsSchoolmasterMapper;
import com.middleschool.score.common.service.SchoolMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/3/22.
 */
@Service
class SchoolMasterServiceImpl implements SchoolMasterService {

    @Autowired
    private MsSchoolmasterMapper msSchoolmasterMapper;
    @Override
    public List<MsSchoolmaster> selectByTeacherId(Long teacherId) {
        return msSchoolmasterMapper.selectByTeacherId(teacherId);
    }
}
