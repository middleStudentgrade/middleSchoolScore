package com.middleschool.score.common.service;


import com.middleschool.score.common.dto.MsUser;

public interface UserService {
    MsUser selectUser(String username);
}
