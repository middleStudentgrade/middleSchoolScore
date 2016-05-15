package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.StudentClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/5/6.
 */
public interface StudentClassMapper {
    List<StudentClass> findAllStudents(@Param("limit")int limit,@Param("offset")int offset);
    List<StudentClass> findOne(@Param("id")Long id);
    List<StudentClass>  selectStudent(@Param("studentContant")String studentContant);
    int countStudent();
}
