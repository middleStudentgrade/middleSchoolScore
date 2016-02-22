package com.middleschool.score.admin.controller;

import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.MsUser;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.service.TestService;
import com.middleschool.score.common.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private TestService testService;

    @RequestMapping("/login")
    public String login(/*@RequestParam String userName, @RequestParam String password,*/HttpSession session ) {
        BindingResult errors=null;
        String userName="123456";
        String password="123456";
            MsUser msUser = userService.selectUser(userName);
            if (msUser != null) {
                if (msUser.getPassword().equals(password)) {
                    session.setAttribute("msUser", msUser);
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


    @RequestMapping("/test")
    public String test(){
       MsStudent msStudent= testService.selectstudent(201223259);
        return "success";
    }
}
