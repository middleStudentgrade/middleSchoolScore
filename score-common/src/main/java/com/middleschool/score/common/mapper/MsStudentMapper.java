package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.MsStudentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MsStudentMapper {
    int countByExample(MsStudentExample example);

    int deleteByExample(MsStudentExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsStudent record);

    int insertSelective(MsStudent record);

    List<MsStudent> selectByExample(MsStudentExample example);

    MsStudent selectByPrimaryKey(Long id);



    int updateByExampleSelective(@Param("record") MsStudent record, @Param("example") MsStudentExample example);

    int updateByExample(@Param("record") MsStudent record, @Param("example") MsStudentExample example);

    int updateByPrimaryKeySelective(MsStudent record);

    int updateByPrimaryKey(MsStudent record);
}