package com.middleschool.score.common.dto;

import java.util.Date;

public class MsScore {
    private Long id;

    private Long studentId;

    private Long classId;

    private Integer semester;

    private Double chinese;

    private Double english;

    private Double math;

    private Date startDate;

    private Date endDate;

    private Double political;

    private Double history;

    private Double physico;

    private Double geography;

    private Double biology;

    private Double chemical;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public Integer getSemester() {
        return semester;
    }

    public void setSemester(Integer semester) {
        this.semester = semester;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
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

    public Double getPhysico() {
        return physico;
    }

    public void setPhysico(Double physico) {
        this.physico = physico;
    }

    public Double getGeography() {
        return geography;
    }

    public void setGeography(Double geography) {
        this.geography = geography;
    }

    public Double getBiology() {
        return biology;
    }

    public void setBiology(Double biology) {
        this.biology = biology;
    }

    public Double getChemical() {
        return chemical;
    }

    public void setChemical(Double chemical) {
        this.chemical = chemical;
    }
}