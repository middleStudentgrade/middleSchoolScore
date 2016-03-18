package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.mapper.MsScoreMapper;
import com.middleschool.score.common.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/3/1.
 */
@Service
public class ScoreServiceImpl implements ScoreService{

    @Autowired
    private MsScoreMapper msScoreMapper;

    @Override
    public MsScore getScoreById(Long id) {
        return null;
    }

    @Override
    public List<MsScore> selectAllScoreByStudentId(Long id) {
        return msScoreMapper.selectAllScoreByStudentId(id);
    }

    @Override
    public List<MsScore> selectNowScoreByStudentId(Long id) {
        return msScoreMapper.selectNowScoreByStudentId(id);
    }

    @Override
    public int selectRanking(Long id) {
        return msScoreMapper.selectRanking(id);
    }
}
