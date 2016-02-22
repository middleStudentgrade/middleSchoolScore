package com.middleschool.score.common.service;

import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.MsUser;

public interface TestService {
    void saveTest(MsUser mgStudent);
    MsStudent selectstudent(long id);
}
