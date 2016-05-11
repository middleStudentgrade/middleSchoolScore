package com.middleschool.score.common.pojo;

import com.middleschool.score.common.dto.MsScore;

/**
 * Created by Administrator on 2016/5/9.
 */
public class ScoreAdmin extends MsScore{
    private String className;
    private String name;
    private double allGrade;
    private String term;

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getAllGrade() {
        return allGrade;
    }

    public void setAllGrade(double allGrade) {
        this.allGrade = allGrade;
    }
}
