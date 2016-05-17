package com.middleschool.score.admin.controller;

import com.middleschool.score.common.dto.MsUser;
import com.middleschool.score.common.service.TestService;
import com.middleschool.score.common.service.UserService;
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
    private UserService userService;
    @Autowired
    private TestService testService;

    @RequestMapping("/login")
    public String login(@RequestParam String userName, @RequestParam String password,HttpSession session ,Model model) {
        try {
            MsUser msUser = userService.selectUser(userName);
            if (msUser != null) {
                if (msUser.getPassword().equals(MD5Utils.md5(password))) {
                    session.setAttribute("msUser", msUser);
                    return "admin/ad_index";
                } else {
                    model.addAttribute("username", "用户名或密码错误");
                    return "login/login";
                }
            } else {
                model.addAttribute("username", "用户名或密码错误");
                return "login/login";
            }
        }catch (Exception e){
            model.addAttribute("username","用户名或密码错误");
            return "login/login";
        }
    }
}
