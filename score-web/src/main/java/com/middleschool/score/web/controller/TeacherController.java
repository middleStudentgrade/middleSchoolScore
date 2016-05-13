package com.middleschool.score.web.controller;

import com.middleschool.score.common.dto.MsTeacher;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.pojo.ResponseResult;
import com.middleschool.score.common.service.ScoreService;
import com.middleschool.score.common.service.TeacherService;
import com.middleschool.score.common.utils.JsonUtils;
import com.middleschool.score.common.utils.MD5Utils;
import com.middleschool.score.common.utils.WebConf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Administrator on 2016/3/20.
 */
@Controller
@RequestMapping("/teacher/")
public class TeacherController {

    private static final Logger LOG = LoggerFactory.getLogger(TeacherController.class);

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ScoreService scoreService;

    @RequestMapping("changePassword")
    @ResponseBody
    public ResponseResult updatePassword(@RequestParam Long id, @RequestParam String password) {
        try {
            MsTeacher msTeacher = teacherService.selectById(id);
            msTeacher.setPassword(MD5Utils.md5(password));
            teacherService.saveTeacher(msTeacher);
            return ResponseResult.ok();
        } catch (Exception e) {
            LOG.error("密码错误{}", e.getMessage());
            return ResponseResult.build(500, "修改密码失败");
        }
    }


    @RequestMapping(value = "getPassword", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getPasword(@RequestParam Long id, @RequestParam String password) {
        try {
            MsTeacher msTeacher = teacherService.selectById(id);
            if (MD5Utils.md5(password).equals(msTeacher.getPassword()))
                return ResponseResult.ok();
            return ResponseResult.build(500, "密码错误");
        } catch (Exception e) {
            LOG.error("密码错误{}", e.getMessage());
            return ResponseResult.build(500, "密码错误");
        }
    }

    @RequestMapping("scoreSort")
    public String sort(@RequestParam Long id, Model model) {
        try {
            int count=scoreService.countStudents(id);
            int pageSize=Integer.parseInt(WebConf.getValue("pageSize"));
            count=count%pageSize==0?count/pageSize:count/pageSize+1;
            model.addAttribute("count", count);
            return "teachers/t_dkcj";
        } catch (Exception e) {
            LOG.error("查询成绩失败{}", e.getMessage());
            return "error/error";
        }
    }

    @RequestMapping("scoreSelect")
    @ResponseBody
    public ResponseResult sorts(@RequestParam Long id, @RequestParam(defaultValue = "0") int offset, Model model) {
        try {
            int limit= Integer.parseInt(WebConf.getValue("pageSize"));
            Page msScores = scoreService.selectNowScoreByClassId(id, limit, (offset-1)*limit);
           return ResponseResult.ok(msScores);
        } catch (Exception e) {
            LOG.error("查询成绩失败{}", e.getMessage());
            return ResponseResult.build(500,"查询失败");
        }
    }

    @RequestMapping("passRate")
    public String passRate(@RequestParam Long id, Model model) {
        try {
            int []pass = scoreService.selectPassRateByClassId(id);
            model.addAttribute("passNum",pass);
            return "teachers/t_jige";
        } catch (Exception e) {
            LOG.error("查询成绩失败{}", e.getMessage());
            return "error/error";
        }
    }
}