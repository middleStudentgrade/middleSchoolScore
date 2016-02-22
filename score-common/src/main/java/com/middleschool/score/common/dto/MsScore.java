package com.middleschool.score.common.dto;

public class MsScore {
    private Long id;

    private Long courseId;

    private Long studentId;

    private String grade;

    private String jibu;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade == null ? null : grade.trim();
    }

    public String getJibu() {
        return jibu;
    }

    public void setJibu(String jibu) {
        this.jibu = jibu == null ? null : jibu.trim();
    }
}