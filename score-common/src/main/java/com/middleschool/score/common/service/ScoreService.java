package com.middleschool.score.common.service;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.pojo.ScoreAdmin;
import com.middleschool.score.common.pojo.ScoreClass;
import com.middleschool.score.common.pojo.StudentScore;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/3/1.
 */
public interface ScoreService {
    MsScore getScoreById(Long id);

    List<ScoreClass> selectAllScoreByStudentId(Long id);

    List<MsScore> selectNowScoreByStudentId(Long id);

    int selectRanking(Long id,Long classId);

    Page selectNowScoreByClassId(Long teacherId,int limit,int offset);

    int[] selectPassRateByClassId(Long id);

    int countStudents(Long id);

    int countScore();

    int delete(Long id);

    void updateScore(MsScore msScore);

    List<MsScore> findAll(int limit,int offset);
    int deleteByStudentId(Long id);
    List<MsScore> findScore(String id);
}
