package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsTeacher;
import com.middleschool.score.common.dto.MsTeacherExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MsTeacherMapper {
    int countByExample(MsTeacherExample example);

    int deleteByExample(MsTeacherExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsTeacher record);

    int insertSelective(MsTeacher record);

    List<MsTeacher> selectByExample(MsTeacherExample example);

    MsTeacher selectByPrimaryKey(Long id);

   // List<MsTeacher> selectAll(@Param("limit")int limit,@Param("offset")int offset);

    int updateByExampleSelective(@Param("record") MsTeacher record, @Param("example") MsTeacherExample example);

    int updateByExample(@Param("record") MsTeacher record, @Param("example") MsTeacherExample example);

    int updateByPrimaryKeySelective(MsTeacher record);

    int updateByPrimaryKey(MsTeacher record);
}