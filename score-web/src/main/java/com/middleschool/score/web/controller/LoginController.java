package com.middleschool.score.web.controller;

import com.middleschool.score.common.dto.MsClass;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.MsStudentNow;
import com.middleschool.score.common.dto.MsTeacher;
import com.middleschool.score.common.service.*;
import com.middleschool.score.common.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;


@Controller
public class LoginController {
    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private StudentNowService studentNowService;

    @Autowired
    private ClassService classService;

    @RequestMapping("/login")
    public String login(@RequestParam String  userName, @RequestParam String password, @RequestParam String type,Model model, HttpSession session) {
        try {
            if ("1".equals(type)) {
                MsStudent msStudent = studentService.getById(Long.valueOf(userName));
                if (msStudent != null) {
                    if (msStudent.getPassword().equals(MD5Utils.md5(password))) {
                        msStudent.setPassword("");
                        session.setAttribute("msStudent", msStudent);
                        MsStudentNow msStudentNow = studentNowService.getByStudentId(Long.valueOf(userName));
                        MsClass msClass = classService.getById(msStudentNow.getClassId());
                        session.setAttribute("msClass",msClass);
                        return "students/stu_index";
                    } else {
                        model.addAttribute("username", "用户名或密码错误");
                        return "login/login";
                    }
                } else {
                    model.addAttribute("username", "用户名或密码错误");
                    return "login/login";
                }
            } else if ("2".equals(type)) {
                MsTeacher msTeacher = teacherService.selectById(Long.valueOf(userName));
                if (msTeacher != null) {
                    if (msTeacher.getPassword().equals(MD5Utils.md5(password))) {
                        msTeacher.setPassword("");
                        session.setAttribute("msTeacher", msTeacher);
                        return "teachers/teach_index";
                    } else {
                        model.addAttribute("username", "用户名或密码错误");
                        return "login/login";
                    }
                } else {
                    model.addAttribute("username", "用户名或密码错误");
                    return "login/login";
                }
            }
            return "login/login";
        }catch (Exception e){
            model.addAttribute("username", "用户名或密码错误");
            return "login/login";
        }
    }
}
