package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsSchoolmaster;
import com.middleschool.score.common.dto.MsSchoolmasterExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MsSchoolmasterMapper {
    int countByExample(MsSchoolmasterExample example);

    int deleteByExample(MsSchoolmasterExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsSchoolmaster record);

    int insertSelective(MsSchoolmaster record);

    List<MsSchoolmaster> selectByExample(MsSchoolmasterExample example);

    MsSchoolmaster selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") MsSchoolmaster record, @Param("example") MsSchoolmasterExample example);

    int updateByExample(@Param("record") MsSchoolmaster record, @Param("example") MsSchoolmasterExample example);

    int updateByPrimaryKeySelective(MsSchoolmaster record);

    int updateByPrimaryKey(MsSchoolmaster record);

    List<MsSchoolmaster> selectByTeacherId(@Param("teacherId")long teacherId);
}