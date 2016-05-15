package com.middleschool.score.common.pojo;

/**
 * Created by Administrator on 2016/5/13.
 */
public class SeniorScoreArt {
    private Long studentId;
    private String name;
    private Double chinese;

    private Double english;

    private Double math;

    private Double political;

    private Double history;

    private Double geography;

    private Double basicCompetencies;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Double getChinese() {
        return chinese;
    }

    public void setChinese(Double chinese) {
        this.chinese = chinese;
    }

    public Double getEnglish() {
        return english;
    }

    public void setEnglish(Double english) {
        this.english = english;
    }

    public Double getMath() {
        return math;
    }

    public void setMath(Double math) {
        this.math = math;
    }

    public Double getPolitical() {
        return political;
    }

    public void setPolitical(Double political) {
        this.political = political;
    }

    public Double getHistory() {
        return history;
    }

    public void setHistory(Double history) {
        this.history = history;
    }

    public Double getGeography() {
        return geography;
    }

    public void setGeography(Double geography) {
        this.geography = geography;
    }

    public Double getBasicCompetencies() {
        return basicCompetencies;
    }

    public void setBasicCompetencies(Double basicCompetencies) {
        this.basicCompetencies = basicCompetencies;
    }
}
