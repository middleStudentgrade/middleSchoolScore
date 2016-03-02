package com.middleschool.score.web.controller;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/3/1.
 */
@Controller
@RequestMapping("/student/")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("select")
    public MsStudent getInfo(Long id){
        try{
            MsStudent msStudent=studentService.getById(id);
            return msStudent;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    @RequestMapping("change")
    public void changePassword(Long id,String password){
        try{
            MsStudent msStudent=studentService.getById(id);
            msStudent.setPassword(MD5Utils.md5(password));
            studentService.saveStudent(msStudent);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    @RequestMapping("getScore")
    public MsScore getScore(Long id){
        try {
            Date startDate=
        }
    }
}
