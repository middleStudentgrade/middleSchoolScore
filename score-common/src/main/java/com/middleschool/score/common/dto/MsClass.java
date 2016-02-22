package com.middleschool.score.common.dto;

public class MsClass {
    private Long id;

    private Long teacherId;

    private String rankDept;

    private String grade;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }

    public String getRankDept() {
        return rankDept;
    }

    public void setRankDept(String rankDept) {
        this.rankDept = rankDept == null ? null : rankDept.trim();
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade == null ? null : grade.trim();
    }
}