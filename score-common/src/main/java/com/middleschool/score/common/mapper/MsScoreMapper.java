package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.MsScoreExample;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.ibatis.annotations.Param;

public interface MsScoreMapper {
    int countByExample(MsScoreExample example);

    int deleteByExample(MsScoreExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsScore record);

    int insertSelective(MsScore record);

    List<MsScore> selectByExample(MsScoreExample example);

    MsScore selectByPrimaryKey(Long id);

    List<MsScore> selectNowScoreByStudentId(Long id);

    List<MsScore> selectAll(@Param("limit")int limit,@Param("offset")int offset,@Param("grade")int grade,@Param("className")String className);

    List<MsScore> selectAllScoreByStudentId(Long id);

    int updateByExampleSelective(@Param("record") MsScore record, @Param("example") MsScoreExample example);

    int updateByExample(@Param("record") MsScore record, @Param("example") MsScoreExample example);

    int updateByPrimaryKeySelective(MsScore record);

    int updateByPrimaryKey(MsScore record);

    int selectRanking(@Param("studentId")Long sstudentId,@Param("classId")int cslassId);

    List<MsScore> selectPassRateByClassId(@Param("classId")Long classId);

    List<MsScore> selectTopHundrth(Map<String,Object> map);

    int countScore(@Param("grade")int grade,@Param("className")String className);

    int saves(@Param("list")List<MsScore> list);

    List<MsScore> seletTopScore(@Param("courseName")String courseName,@Param("type")int type);
    List<MsScore> findBySutClassTime(@Param("studentId")Long studentId,@Param("classId")Long classId,@Param("time")Date time);
}