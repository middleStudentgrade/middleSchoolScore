package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsUser;
import com.middleschool.score.common.dto.MsUserExample;
import com.middleschool.score.common.mapper.MsUserMapper;
import com.middleschool.score.common.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private MsUserMapper msUserMapper;

    @Override
    public MsUser selectUser(String username) {
            MsUserExample msUserExample=new MsUserExample();
            MsUserExample.Criteria criteria=msUserExample.createCriteria();
            criteria.andUsernameEqualTo(username);
            List<MsUser> msUser = msUserMapper.selectByExample(msUserExample);
            return msUser.get(0);
    }
}
