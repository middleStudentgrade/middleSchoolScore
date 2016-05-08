package com.middleschool.score.common.mapper;

import com.middleschool.score.common.dto.MsClass;
import com.middleschool.score.common.dto.MsClassExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MsClassMapper {
    int countByExample(MsClassExample example);

    int deleteByExample(MsClassExample example);

    int deleteByPrimaryKey(Long id);

    int insert(MsClass record);

    int insertSelective(MsClass record);

    List<MsClass> selectByExample(MsClassExample example);

    List<MsClass> selectByNameAndDeptAndGrade(@Param("grade")String grade,@Param("name")String name,@Param("rankDept")String rankDept);

    MsClass selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") MsClass record, @Param("example") MsClassExample example);

    int updateByExample(@Param("record") MsClass record, @Param("example") MsClassExample example);

    int updateByPrimaryKeySelective(MsClass record);

    int updateByPrimaryKey(MsClass record);
}