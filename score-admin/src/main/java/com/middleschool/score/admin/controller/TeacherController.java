package com.middleschool.score.admin.controller;

import com.middleschool.score.common.dto.MsTeacher;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.pojo.ResponseResult;
import com.middleschool.score.common.service.TeacherService;
import com.middleschool.score.common.utils.WebConf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2016/5/9.
 */
@Controller
@RequestMapping("/admin/teacher/")
public class TeacherController {

    private final static Logger LOG= LoggerFactory.getLogger(TeacherController.class);
    @Autowired
    private TeacherService teacherService;
    @RequestMapping("getAll")
    @ResponseBody
    public ResponseResult getAll(@RequestParam(value = "offset",defaultValue = "1")int offset){
        try {
            int limit=Integer.parseInt(WebConf.getValue("pageSize"));
            Page page = new Page();
            List<MsTeacher> msTeachers = teacherService.findAll(limit, (offset-1)*limit);
            page.setDatas(msTeachers);
            int count = teacherService.countTeacher();
            page.setNum(count);
            return ResponseResult.ok(page);
        }catch (Exception e){
            LOG.error("获取老师信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取老师信息失败");
        }
    }

    @RequestMapping("getOne")
    @ResponseBody
    public ResponseResult getOne(@RequestParam(value = "id")Long id,Model model){
        try {
            MsTeacher msTeacher = teacherService.selectById(id);
            model.addAttribute("teacher",msTeacher);
            return ResponseResult.ok(msTeacher);
        }catch (Exception e){
            LOG.error("获取老师信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取老师信息失败");
        }
    }
    @RequestMapping(value = "update")
    @ResponseBody
    public ResponseResult update(MsTeacher msTeacher){
        try {
            MsTeacher msTeacher1=teacherService.selectById(msTeacher.getId());
            msTeacher.setPassword(msTeacher1.getPassword());
           teacherService.updateTeacher(msTeacher);
            return ResponseResult.ok();
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return ResponseResult.build(500, "更新失败");
        }
    }
    @RequestMapping("getTeacher")
    @ResponseBody
    public ResponseResult getStudent(@RequestParam(value = "name")String name){
        try {
            Page page = new Page();
            List<MsTeacher> teacher = teacherService.findTeacher(name);
            page.setDatas(teacher);
            int count=teacher.size();
            int pageSize=Integer.parseInt(WebConf.getValue("pageSize"));
            count=count%pageSize==0?count/pageSize:count/pageSize+1;
            page.setNum(count);
            return ResponseResult.ok(page);
        }catch (Exception e){
            LOG.error("获取学生信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取学生信息失败");
        }
    }
    @RequestMapping(value = "save")
    @ResponseBody
    public ResponseResult save(MsTeacher msTeacher){
        try {
            msTeacher.setPassword(msTeacher.getIdCard().substring(msTeacher.getIdCard().length()-6,msTeacher.getIdCard().length()));
            teacherService.insertTeacher(msTeacher);
            return ResponseResult.ok();
        }catch (Exception e){
            LOG.error("添加失败{}",e.getMessage());
            return ResponseResult.build(500, "添加失败");
        }
    }
    @RequestMapping(value = "delete")
    @ResponseBody
    public ResponseResult delete(@RequestParam("id")Long id){
        try {
            teacherService.delete(id);
            return ResponseResult.ok();
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return ResponseResult.build(500, "更新失败");
        }
    }

}
