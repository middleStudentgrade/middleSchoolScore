package com.middleschool.score.web.controller;

import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.MsTeacher;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @RequestMapping("/login")
    public String login(@RequestParam long userName, @RequestParam String password, @RequestParam String type, BindingResult errors, HttpSession session) {
        // long userName=201223259L;String password="aaa"; String type="1";BindingResult errors=null;
        if ("1".equals(type)) {
            MsStudent msStudent = studentService.getById(userName);
            if (msStudent != null) {
                if (msStudent.getPassword().equals(password)) {
                    session.setAttribute("msStudent", msStudent);
                    return "success";
                } else {
                    errors.rejectValue("username", "用户名或密码错误", "用户名或密码错误");
                    return "login";
                }
            } else {
                errors.rejectValue("username", "用户名或密码错误", "用户名或密码错误");
                return "login";
            }
        } else if ("2".equals(type)) {
            MsTeacher msTeacher = teacherService.selectById(userName);
            if (msTeacher != null) {
                if (msTeacher.getPassword().equals(password)) {
                    session.setAttribute("msTeacher", msTeacher);
                    return "success";
                } else {
                    errors.rejectValue("username", "用户名或密码错误", "用户名或密码错误");
                    return "login";
                }
            } else {
                errors.rejectValue("username", "用户名或密码错误", "用户名或密码错误");
                return "login";
            }
        }
        return "login";
    }
}
