package com.middleschool.score.common.service;

import com.middleschool.score.common.dto.MsStudentNow;
import org.springframework.stereotype.Service;



/**
 * Created by Administrator on 2016/5/8.
 */

public interface StudentNowService {
    MsStudentNow getByStudentId(Long studentId);
    int save(MsStudentNow msStudentNow);
}
