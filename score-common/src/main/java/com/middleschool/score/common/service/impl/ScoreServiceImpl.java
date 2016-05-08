package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.MsSchoolmaster;
import com.middleschool.score.common.dto.MsSchoolmasterExample;
import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.StudentScoreName;
import com.middleschool.score.common.mapper.MsSchoolmasterMapper;
import com.middleschool.score.common.mapper.MsScoreMapper;
import com.middleschool.score.common.mapper.StudentScoreNameMapper;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.pojo.ScoreClass;
import com.middleschool.score.common.pojo.StudentScore;
import com.middleschool.score.common.service.ScoreService;

import com.middleschool.score.common.utils.JsonUtils;
import com.middleschool.score.common.utils.StudentScoreNameToStudentScore;
import com.middleschool.score.common.utils.WebConf;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/3/1.
 */
@Service
public class ScoreServiceImpl implements ScoreService{

    @Autowired
    private MsScoreMapper msScoreMapper;

    @Autowired
    private StudentScoreNameMapper studentScoreNameMapper;

    @Autowired
    private MsSchoolmasterMapper msSchoolmasterMapper;
    @Override
    public MsScore getScoreById(Long id) {
        return null;
    }

    private String getClass(int i){
        String className="";
        switch (i){
            case 0: className= "高一上学期";break;
            case 1:className= "高一下学期";break;
            case 2:className= "高二上学期";break;
            case 3:className= "高二下学期";break;
            case 4:className= "高三上学期";break;
            case 5:className= "高三下学期";break;
        }
        return className;
    }

    private double getAllScore(MsScore msScore){
        return msScore.getBiology()+msScore.getChemical()+msScore.getChinese()+msScore.getEnglish()+
                msScore.getGeography()+msScore.getHistory()+msScore.getMath()+msScore.getPhysico()+msScore.getPolitical();
    }
    @Override
    public List<ScoreClass> selectAllScoreByStudentId(Long id) {
        List<MsScore> msScores= msScoreMapper.selectAllScoreByStudentId(id);
        List<ScoreClass> scoreClasses=new ArrayList<>();
        for(int i=0;i<msScores.size();i++){
            ScoreClass scoreClass=new ScoreClass();
            BeanUtils.copyProperties(msScores.get(i),scoreClass);
            scoreClass.setGrade(getClass(i));
            scoreClass.setAllScore(getAllScore(msScores.get(i)));
            scoreClasses.add(scoreClass);
        }
        return scoreClasses;

    }

    @Override
    public List<MsScore> selectNowScoreByStudentId(Long id) {
        return msScoreMapper.selectNowScoreByStudentId(id);
    }

    @Override
    public int selectRanking( Long id,Long classId) {
        return msScoreMapper.selectRanking(classId,id);
    }

    @Override
    public Page selectNowScoreByClassId(Long teacherId,int limit,int offset) {
        MsSchoolmasterExample msSchoolmasterExample=new MsSchoolmasterExample();
        MsSchoolmasterExample.Criteria criteria=msSchoolmasterExample.createCriteria();
        criteria.andTeacherIdEqualTo(teacherId);
        MsSchoolmaster msSchoolmaster= msSchoolmasterMapper.selectByExample(msSchoolmasterExample).get(0);
        List<StudentScoreName>msScores=studentScoreNameMapper.selectScoreByClassId(msSchoolmaster.getClassId(), msSchoolmaster.getCourseName(),limit,offset);
        List<StudentScore> studentScores=new ArrayList<>();
        int i=1;
        for(StudentScoreName s:msScores) {
            StudentScore studentScore = StudentScoreNameToStudentScore.changeScoreName(s, msSchoolmaster.getCourseName());
            studentScore.setRanking(limit*offset+i++);
            studentScores.add(studentScore);
        }
        int count=studentScoreNameMapper.selectCountByClassId(msSchoolmaster.getClassId(), msSchoolmaster.getCourseName());
        Page page=new Page();
        page.setNum(count);
        page.setDatas(studentScores);
       return page;
    }

    @Override
    public  int[] selectPassRateByClassId(Long id) {
        int[] passRate=new int[4];
        MsSchoolmasterExample msSchoolmasterExample=new MsSchoolmasterExample();
        MsSchoolmasterExample.Criteria criteria=msSchoolmasterExample.createCriteria();
        criteria.andTeacherIdEqualTo(id);
        MsSchoolmaster msSchoolmaster= msSchoolmasterMapper.selectByExample(msSchoolmasterExample).get(0);
        List<MsScore>msScores= msScoreMapper.selectPassRateByClassId(msSchoolmaster.getClassId());
        for(MsScore s:msScores) {
            passRate[StudentScoreNameToStudentScore.getScore(s,msSchoolmaster.getCourseName())]++;
        }
        return passRate;
    }

    @Override
    public int countStudents(Long id) {
        MsSchoolmasterExample msSchoolmasterExample=new MsSchoolmasterExample();
        MsSchoolmasterExample.Criteria criteria=msSchoolmasterExample.createCriteria();
        criteria.andTeacherIdEqualTo(id);
        MsSchoolmaster msSchoolmaster= msSchoolmasterMapper.selectByExample(msSchoolmasterExample).get(0);
        int count=studentScoreNameMapper.selectCountByClassId(msSchoolmaster.getClassId(), msSchoolmaster.getCourseName());
        return count;
    }

}
