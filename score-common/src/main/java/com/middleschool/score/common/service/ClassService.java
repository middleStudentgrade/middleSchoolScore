package com.middleschool.score.common.service;

import com.middleschool.score.common.dto.MsClass;


import java.util.List;

/**
 * Created by Administrator on 2016/5/8.
 */

public interface ClassService {
     List<MsClass> getByRankDeptAndGradeAndName(String name,int grade);
     MsClass getById(Long id);
     List<MsClass> selectById(Long id);
}

