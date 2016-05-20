package com.middleschool.score.admin.controller;

import com.middleschool.score.common.dto.MsClass;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.dto.MsStudentNow;
import com.middleschool.score.common.dto.StudentClass;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.pojo.ResponseResult;
import com.middleschool.score.common.service.ClassService;
import com.middleschool.score.common.service.ScoreService;
import com.middleschool.score.common.service.StudentNowService;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.utils.DateUtil;
import com.middleschool.score.common.utils.JsonUtils;
import com.middleschool.score.common.utils.MD5Utils;
import com.middleschool.score.common.utils.WebConf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Calendar;
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

    @Autowired
    private ScoreService scoreService;

    @RequestMapping("getAll")
    @ResponseBody
    public ResponseResult getAll(@RequestParam(value = "offset",defaultValue = "1")int offset){
        try {
            int limit=Integer.parseInt(WebConf.getValue("pageSize"));
            Page page = new Page();
            List<StudentClass> msStudents = studentService.findAll(limit, (offset-1)*limit);
            page.setDatas(msStudents);
            return ResponseResult.ok(page);
        }catch (Exception e){
            LOG.error("获取学生信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取学生信息失败");
        }
    }

    @RequestMapping("getOne")
    @ResponseBody
    public ResponseResult getOne(@RequestParam(value = "id")Long id){
        try {
            List<StudentClass> msStudents = studentService.findOne(id);
            if(msStudents.size()!=0) {
                return ResponseResult.ok(msStudents.get(0));
            }
            return ResponseResult.build(500,"获取学生信息失败");
        }catch (Exception e){
            LOG.error("获取学生信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取学生信息失败");
        }
    }

    @RequestMapping("getStudent")
    @ResponseBody
    public ResponseResult getStudent(@RequestParam(value = "name")String name,Model model){
        try {
            Page page = new Page();
            List<StudentClass> msStudents = studentService.findStudent(name);
            page.setDatas(msStudents);
            int count=msStudents.size();
            int pageSize=Integer.parseInt(WebConf.getValue("pageSize"));
            count=count%pageSize==0?count/pageSize:count/pageSize+1;
            page.setNum(count);
                return ResponseResult.ok(page);
        }catch (Exception e){
            LOG.error("获取学生信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取学生信息失败");
        }
    }

    @RequestMapping(value = "update")
    @ResponseBody
    public ResponseResult update(StudentClass studentClass){
        try {
            MsStudent msStudent1=studentService.getById(studentClass.getId());
            MsStudent msStudent = new MsStudent();
            BeanUtils.copyProperties(studentClass, msStudent);
            MsStudentNow msStudentNow = studentNowService.getByStudentId(studentClass.getId());
            msStudent.setPassword(msStudent1.getPassword());
            List<MsClass> classe=classService.getByRankDeptAndGradeAndName(studentClass.getClassName(),Integer.parseInt(studentClass.getGrade().toString()));
            if(classe!=null) {
                msStudentNow.setClassId(classe.get(0).getId());
            }
            msStudent.setDatesAttendance(DateUtil.formatDate(studentClass.getDatesAttendance()));
            studentNowService.update(msStudentNow);
            studentService.updateStudent(msStudent);
            return ResponseResult.ok();
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return ResponseResult.build(500, "更新失败");
        }
    }

    @RequestMapping(value = "save")
    @ResponseBody
    public ResponseResult save(StudentClass studentClass){
        try {
            MsStudent msStudent = new MsStudent();
            BeanUtils.copyProperties(studentClass, msStudent);
            msStudent.setPassword(MD5Utils.md5(studentClass.getIdCard().substring(studentClass.getIdCard().length()-6,studentClass.getIdCard().length())));
            List<MsClass> classe=classService.getByRankDeptAndGradeAndName(studentClass.getClassName(),Integer.parseInt(studentClass.getGrade().toString()));
            MsStudentNow msStudentNow=new MsStudentNow();
            msStudentNow.setClassId(classe.get(0).getId());
            msStudent.setDatesAttendance(DateUtil.formatDate(studentClass.getDatesAttendance()));
            studentService.saveStudent(msStudent);
            msStudentNow.setStudentId(msStudent.getId());
            Calendar now = Calendar.getInstance();
            int semester=0;
            if(now.get(Calendar.MONTH)>3&&now.get(Calendar.MONTH)<9){
                semester=1;
            }
            msStudentNow.setSemester(semester);
            studentNowService.save(msStudentNow);
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
            studentService.delete(id);
            studentNowService.deleteByStudentId(id);
            scoreService.deleteByStudentId(id);
            return ResponseResult.ok();
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return ResponseResult.build(500, "更新失败");
        }
    }

}
