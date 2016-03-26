package com.middleschool.score.common.service;

import com.middleschool.score.common.dto.MsSchoolmaster;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2016/3/22.
 */
@Service
public interface SchoolMasterService {
    MsSchoolmaster selectByTeacherId(Long teacherId);
}
