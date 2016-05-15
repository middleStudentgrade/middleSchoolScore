package com.middleschool.score.common.service.impl;

import com.middleschool.score.common.dto.*;
import com.middleschool.score.common.mapper.MsSchoolmasterMapper;
import com.middleschool.score.common.mapper.MsScoreMapper;
import com.middleschool.score.common.mapper.MsStudentMapper;
import com.middleschool.score.common.mapper.StudentScoreNameMapper;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.pojo.ScoreClass;
import com.middleschool.score.common.pojo.StudentScore;
import com.middleschool.score.common.pojo.TopScore;
import com.middleschool.score.common.service.ScoreService;

import com.middleschool.score.common.utils.JsonUtils;
import com.middleschool.score.common.utils.StudentScoreNameToStudentScore;
import com.middleschool.score.common.utils.WebConf;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Autowired
    private MsStudentMapper msStudentMapper;
    @Override
    public MsScore getScoreById(Long id) {
        return msScoreMapper.selectByPrimaryKey(id);
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

    @Override
    public int countScore(int grade,String name) {
        return msScoreMapper.countScore(grade,name);
    }

    @Override
    public int delete(Long id) {
        return msScoreMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateScore(MsScore msScore) {
      msScoreMapper.updateByPrimaryKeySelective(msScore);
    }
    @Override
    public List<MsScore> findAll(int limit, int offset,int grade,String name) {
        return msScoreMapper.selectAll(limit,offset,grade,name);
    }

    @Override
    public int deleteByStudentId(Long id) {
        MsScoreExample msScoreExample=new MsScoreExample();
        MsScoreExample.Criteria criteria=msScoreExample.createCriteria();
        criteria.andStudentIdEqualTo(id);
        return msScoreMapper.deleteByExample(msScoreExample);
    }

    @Override
    public List<MsScore> findScore(String id) {
        MsScoreExample msScoreExample=new MsScoreExample();
        MsScoreExample.Criteria criteria=msScoreExample.createCriteria();
        criteria.andStudentIdEqualTo(Long.parseLong(id));
        return msScoreMapper.selectByExample(msScoreExample);

    }

    @Override
    public List<MsScore> findTopHundredth(int id,int limit,int offset) {
        int [] classIds=new int[12];
        if(id==1){
            for(int i=0;i<12;i++){
                classIds[i]=i+1;
            }
        }else if(id==2){
            for(int i=0;i<3;i++){
                classIds[i]=i+13;
            }
            for(int i=3;i<6;i++){
                classIds[i]=i+19;
            }
        }else if(id==3){
            for(int i=0;i<3;i++){
                classIds[i]=i+16;
            }
            for(int i=4;i<7;i++){
                classIds[i]=i+22;
            }
        } else if(id==4){
            for(int i=0;i<3;i++){
                classIds[i]=i+25;
            }
            for(int i=4;i<7;i++){
                classIds[i]=i+31;
            }
        }else{
            for(int i=0;i<3;i++){
                classIds[i]=i+28;
            }
            for(int i=4;i<7;i++){
                classIds[i]=i+34;
            }
        }
        Map<String,Object> map=new HashMap<>();
        map.put("ids",classIds);
        map.put("limit",limit);
        map.put("offset",offset);
        return msScoreMapper.selectTopHundrth(map);
    }

    @Override
    public int saves(List<MsScore> msScores) {
        return msScoreMapper.saves(msScores);
    }

    private TopScore getTopScore(String courseName,int type){
        List<MsScore> msScores=msScoreMapper.seletTopScore(courseName,type);
        TopScore topScore=new TopScore();
        if(msScores.size()!=0) {
            for (MsScore m : msScores) {
                topScore.setClasName(topScore.getClasName() + "/" + m.getClassId() % 12);
                topScore.setScore(getFieldValueByName(courseName, m).toString());
                topScore.setScoreName(getCourseName(courseName));
                topScore.setStuNum(topScore.getStuNum() + "/" + m.getStudentId());
                MsStudent msStudent = msStudentMapper.selectByPrimaryKey(m.getStudentId());
                topScore.setName(topScore.getName() + "/" + msStudent.getName());
            }
        }
            return topScore;

    }
    private Object getFieldValueByName(String fieldName, Object o) {
        try {
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            String getter = "get" + firstLetter + fieldName.substring(1);
            Method method = o.getClass().getMethod(getter, new Class[] {});
            Object value = method.invoke(o, new Object[] {});
            return value;
        } catch (Exception e) {
            return null;
        }
    }
    private String getCourseName(String courseEnglish){
        if("chinese".equals(courseEnglish))
            return "语文";
        else if("english".equals(courseEnglish))
            return "英语";
        else if("math".equals(courseEnglish))
            return "数学";
        else if("political".equals(courseEnglish))
            return "政治";
        else if("geography".equals(courseEnglish))
            return "地理";
        else if("history".equals(courseEnglish))
            return "历史";
        else if("physico".equals(courseEnglish))
            return "物理";
        else if("chemical".equals(courseEnglish))
            return "化学";
        else if("biology".equals(courseEnglish))
            return "生物";
        else
            return "基本能力";
    }
    @Override
    public List<TopScore> getSophomoreScore() {
        List<TopScore> topScores=new ArrayList<>();
        topScores.add(getTopScore("chinese",1));
        topScores.add(getTopScore("math",1));
        topScores.add(getTopScore("english",1));
        topScores.add(getTopScore("physico",1));
        topScores.add(getTopScore("chemical",1));
        topScores.add(getTopScore("biology", 1));
        topScores.add(getTopScore("political",1));
        topScores.add(getTopScore("history",1));
        topScores.add(getTopScore("geography",1));
        return topScores;
    }

    @Override
    public List<TopScore> getJuniorScoreArt() {
        List<TopScore> topScores=new ArrayList<>();
        topScores.add(getTopScore(("chinese"),2));
        topScores.add(getTopScore(("math"),2));
        topScores.add(getTopScore(("english"),2));
        topScores.add(getTopScore(("political"),2));
        topScores.add(getTopScore(("history"),2));
        topScores.add(getTopScore(("geography"),2));
        return topScores;
    }

    @Override
    public List<TopScore> juniorScoreScience() {
        List<TopScore> topScores=new ArrayList<>();
        topScores.add(getTopScore(("chinese"),3));
        topScores.add(getTopScore(("math"),3));
        topScores.add(getTopScore(("english"),3));
        topScores.add(getTopScore(("physico"),3));
        topScores.add(getTopScore(("chemical"),3));
        topScores.add(getTopScore(("biology"), 3));
        return topScores;
    }

    @Override
    public List<TopScore> getSeniorScoreArt() {
        List<TopScore> topScores=new ArrayList<>();
        topScores.add(getTopScore(("chinese"),4));
        topScores.add(getTopScore(("math"),4));
        topScores.add(getTopScore(("english"),4));
        topScores.add(getTopScore(("political"),4));
        topScores.add(getTopScore(("history"),4));
        topScores.add(getTopScore(("geography"),4));
        topScores.add(getTopScore("basicCompetencies",4));
        return topScores;
    }

    @Override
    public List<TopScore> getSeniorScoreScience() {
        List<TopScore> topScores=new ArrayList<>();
        topScores.add(getTopScore(("chinese"),5));
        topScores.add(getTopScore(("math"),5));
        topScores.add(getTopScore(("english"),5));
        topScores.add(getTopScore(("physico"),5));
        topScores.add(getTopScore(("chemical"),5));
        topScores.add(getTopScore(("biology"),5));
        topScores.add(getTopScore("basicCompetencies",5));
        return topScores;
    }

}
