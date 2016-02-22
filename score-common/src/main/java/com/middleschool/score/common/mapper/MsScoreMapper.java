package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.MsScoreExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MsScoreMapper {
    int countByExample(MsScoreExample example);

    int deleteByExample(MsScoreExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsScore record);

    int insertSelective(MsScore record);

    List<MsScore> selectByExample(MsScoreExample example);

    MsScore selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") MsScore record, @Param("example") MsScoreExample example);

    int updateByExample(@Param("record") MsScore record, @Param("example") MsScoreExample example);

    int updateByPrimaryKeySelective(MsScore record);

    int updateByPrimaryKey(MsScore record);
}