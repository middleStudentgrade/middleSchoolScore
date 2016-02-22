package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsCourse;
import com.middleschool.score.common.dto.MsCourseExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MsCourseMapper {
    int countByExample(MsCourseExample example);

    int deleteByExample(MsCourseExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsCourse record);

    int insertSelective(MsCourse record);

    List<MsCourse> selectByExample(MsCourseExample example);

    MsCourse selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") MsCourse record, @Param("example") MsCourseExample example);

    int updateByExample(@Param("record") MsCourse record, @Param("example") MsCourseExample example);

    int updateByPrimaryKeySelective(MsCourse record);

    int updateByPrimaryKey(MsCourse record);
}