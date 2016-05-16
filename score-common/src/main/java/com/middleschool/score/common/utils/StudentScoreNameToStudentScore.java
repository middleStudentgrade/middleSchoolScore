package com.middleschool.score.common.utils;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.StudentScoreName;
import com.middleschool.score.common.pojo.StudentScore;

/**
 * Created by Administrator on 2016/3/26.
 */
public class StudentScoreNameToStudentScore {
    public static StudentScore changeScoreName(StudentScoreName student,String className){
        StudentScore studentScore=new StudentScore();
        studentScore.setId(student.getStudentId());
        studentScore.setName(student.getName());
        switch (className){
            case "english":studentScore.setScore(student.getEnglish()); break;
            case "chinese":studentScore.setScore(student.getChinese());break;
            case "math":studentScore.setScore(student.getMath());break;
            case "political":studentScore.setScore(student.getPolitical());break;
            case "history":studentScore.setScore(student.getHistory());break;
            case "physico":studentScore.setScore(student.getPhysico());break;
            case "geography":studentScore.setScore(student.getGeography());break;
            case "biology":studentScore.setScore(student.getBiology());break;
            case "chemical":studentScore.setScore(student.getChemical());break;
            case "basic_competencies":studentScore.setScore(student.getBasicCompetencies());break;
        }
        return studentScore;
    }

    private static int judgePercentage(double score){
        if(score>=85)
            return 0;
        else if(score>=75)
            return 1;
        else if(score>=60)
            return 2;
        else
            return 3;
    }
    private static int judgeNOPercentage(double score){
        if(score>=127.5)
            return 0;
        else if(score>=112.5)
            return 1;
        else if(score>=90)
            return 2;
        else
            return 3;
    }
    public static int getScore(MsScore student,String className){
        int rank=0;
        switch (className){
            case "english":rank=judgeNOPercentage(student.getEnglish()); break;
            case "chinese":rank=judgeNOPercentage(student.getChinese());break;
            case "math":rank=judgeNOPercentage(student.getMath());break;
            case "political":rank=judgePercentage(student.getPolitical());break;
            case "history":rank=judgePercentage(student.getHistory());break;
            case "physico":rank=judgePercentage(student.getPhysico());break;
            case "geography":rank=judgePercentage(student.getGeography());break;
            case "biology":rank=judgePercentage(student.getBiology());break;
            case "chemical":rank=judgePercentage(student.getChemical());break;
        }
        return rank;
    }
}
