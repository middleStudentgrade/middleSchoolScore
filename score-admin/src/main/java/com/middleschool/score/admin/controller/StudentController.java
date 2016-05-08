package com.middleschool.score.admin.controller;

import com.middleschool.score.common.dto.MsClass;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.MsStudentNow;
import com.middleschool.score.common.dto.StudentClass;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.pojo.ResponseResult;
import com.middleschool.score.common.service.ClassService;
import com.middleschool.score.common.service.StudentNowService;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.utils.JsonUtils;
import com.middleschool.score.common.utils.WebConf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * Created by Administrator on 2016/5/6.
 */
@Controller
@RequestMapping("admin/student/")
public class StudentController {

    Logger LOG= LoggerFactory.getLogger(StudentController.class);

    @Autowired
    private StudentService studentService;

    @Autowired
    private ClassService classService;

    @Autowired
    private StudentNowService studentNowService;

    @RequestMapping("getAll")
    @ResponseBody
    public ResponseResult getAll(@RequestParam(value = "offset",defaultValue = "1")int offset){
        try {
            int limit=Integer.parseInt(WebConf.getValue("pageSize"));
            Page page = new Page();
            List<StudentClass> msStudents = studentService.findAll(limit, (offset-1)*limit);
            page.setDatas(msStudents);
            int count = studentService.countStudent();
            page.setNum(count);
            return ResponseResult.ok(page);
        }catch (Exception e){
            LOG.error("获取学生信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取学生信息失败");
        }
    }

    @RequestMapping("getOne")
    @ResponseBody
    public ResponseResult getOne(@RequestParam(value = "id")Long id,Model model){
        try {
            List<StudentClass> msStudents = studentService.findOne(id);
            if(msStudents.size()!=0) {
                model.addAttribute("student",msStudents.get(0));
                return ResponseResult.ok(msStudents.get(0));
            }
            return ResponseResult.build(500,"获取学生信息失败");
        }catch (Exception e){
            LOG.error("获取学生信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取学生信息失败");
        }
    }
    @RequestMapping("update")
    public String update(@RequestBody StudentClass studentClass){
        try {
            MsStudent msStudent = new MsStudent();
            MsStudent msStudent1=studentService.getById(studentClass.getId());
            MsStudentNow msStudentNow = studentNowService.getByStudentId(studentClass.getId());
            BeanUtils.copyProperties(studentClass, msStudent);
            msStudent.setPassword(msStudent1.getPassword());
            List<MsClass> classe=classService.getByRankDeptAndGradeAndName(studentClass.getClassName(),studentClass.getRankDept(),studentClass.getGrade());
            if(classe!=null) {
                msStudentNow.setClassId(classe.get(0).getId());
            }
            studentNowService.save(msStudentNow);
            studentService.saveStudent(msStudent);
            return "admin/ad_index";
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return "error";
        }
    }

}
