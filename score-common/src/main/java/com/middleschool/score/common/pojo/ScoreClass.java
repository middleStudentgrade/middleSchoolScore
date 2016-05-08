package com.middleschool.score.common.pojo;

import com.middleschool.score.common.dto.MsScore;

/**
 * Created by Administrator on 2016/5/8.
 */
public class ScoreClass  extends MsScore{
    private String grade;
    private double allScore;

    public double getAllScore() {
        return allScore;
    }

    public void setAllScore(double allScore) {
        this.allScore = allScore;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
}
