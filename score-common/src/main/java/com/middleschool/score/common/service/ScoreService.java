package com.middleschool.score.common.service;

import com.middleschool.score.common.dto.MsScore;

import java.util.List;

/**
 * Created by Administrator on 2016/3/1.
 */
public interface ScoreService {
    MsScore getScoreById(Long id);

    List<MsScore> selectAllScoreByStudentId(Long id);

    List<MsScore> selectNowScoreByStudentId(Long id);

    int selectRanking(Long id);
}
