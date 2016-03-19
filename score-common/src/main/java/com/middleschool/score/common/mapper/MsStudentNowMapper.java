package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsStudentNow;
import com.middleschool.score.common.dto.MsStudentNowExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MsStudentNowMapper {
    int countByExample(MsStudentNowExample example);

    int deleteByExample(MsStudentNowExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsStudentNow record);

    int insertSelective(MsStudentNow record);

    List<MsStudentNow> selectByExample(MsStudentNowExample example);

    MsStudentNow selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") MsStudentNow record, @Param("example") MsStudentNowExample example);

    int updateByExample(@Param("record") MsStudentNow record, @Param("example") MsStudentNowExample example);

    int updateByPrimaryKeySelective(MsStudentNow record);

    int updateByPrimaryKey(MsStudentNow record);
}