package com.middleschool.score.common.mapper;


import com.middleschool.score.common.dto.StudentScoreName;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/3/26.
 */
public interface StudentScoreNameMapper {
    List<StudentScoreName> selectScoreByClassId(@Param("classId")Long classId,@Param("courseName")String courseName,@Param("limit")int limit,@Param("offset")int offset);

    int selectCountByClassId(@Param("classId")Long classId,@Param("courseName")String courseName);


    List<StudentScoreName> selectScoreByClassIdNoPage(@Param("classId")Long classId,@Param("courseName")String courseName);

}
