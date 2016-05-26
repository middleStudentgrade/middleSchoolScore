package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsUser;
import com.middleschool.score.common.dto.MsUserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MsUserMapper {
    int countByExample(MsUserExample example);

    int deleteByExample(MsUserExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsUser record);

    int insertSelective(MsUser record);

    List<MsUser> selectByExample(MsUserExample example);

    MsUser selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") MsUser record, @Param("example") MsUserExample example);

    int updateByExample(@Param("record") MsUser record, @Param("example") MsUserExample example);

    int updateByPrimaryKeySelective(MsUser record);

    int updateByPrimaryKey(MsUser record);
}