package com.middleschool.score.common.dto;

import java.util.Date;

/**
 * Created by Administrator on 2016/5/6.
 */
public class StudentClass  {
    private Long id;

    private String password;

    private String name;

    private Integer age;

    private String sex;

    private String idCard;

    private String birthPlace;

    private String politicalLandscape;

    private Date datesAttendance;
    private String grade;
    private String className;

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getBirthPlace() {
        return birthPlace;
    }

    public void setBirthPlace(String birthPlace) {
        this.birthPlace = birthPlace;
    }

    public String getPoliticalLandscape() {
        return politicalLandscape;
    }

    public void setPoliticalLandscape(String politicalLandscape) {
        this.politicalLandscape = politicalLandscape;
    }

    public Date getDatesAttendance() {
        return datesAttendance;
    }

    public void setDatesAttendance(Date datesAttendance) {
        this.datesAttendance = datesAttendance;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
}
