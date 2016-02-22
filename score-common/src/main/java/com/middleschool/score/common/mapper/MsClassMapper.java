package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsClass;
import com.middleschool.score.common.dto.MsClassExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MsClassMapper {
    int countByExample(MsClassExample example);

    int deleteByExample(MsClassExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsClass record);

    int insertSelective(MsClass record);

    List<MsClass> selectByExample(MsClassExample example);

    MsClass selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") MsClass record, @Param("example") MsClassExample example);

    int updateByExample(@Param("record") MsClass record, @Param("example") MsClassExample example);

    int updateByPrimaryKeySelective(MsClass record);

    int updateByPrimaryKey(MsClass record);
}