package com.middleschool.score.common.dto;

public class MsClass {
    private Long id;

    private String name;

    private Long teacherId;

    private String rankDept;

    private Integer grade;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
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

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
}