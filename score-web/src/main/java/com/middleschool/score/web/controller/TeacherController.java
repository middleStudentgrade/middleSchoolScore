package com.middleschool.score.web.controller;

import com.middleschool.score.common.dto.MsSchoolmaster;
import com.middleschool.score.common.dto.MsTeacher;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.pojo.ResponseResult;
import com.middleschool.score.common.pojo.TopScore;
import com.middleschool.score.common.service.SchoolMasterService;
import com.middleschool.score.common.service.ScoreService;
import com.middleschool.score.common.service.TeacherService;
import com.middleschool.score.common.utils.MD5Utils;
import com.middleschool.score.common.utils.WebConf;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Autowired
    private SchoolMasterService schoolMasterService;
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
    private String getCourseName(String courseEnglish){
        if("chinese".equals(courseEnglish))
            return "语文";
        else if("english".equals(courseEnglish))
            return "英语";
        else if("math".equals(courseEnglish))
            return "数学";
        else if("political".equals(courseEnglish))
            return "政治";
        else if("geography".equals(courseEnglish))
            return "地理";
        else if("history".equals(courseEnglish))
            return "历史";
        else if("physico".equals(courseEnglish))
            return "物理";
        else if("chemical".equals(courseEnglish))
            return "化学";
        else if("biology".equals(courseEnglish))
            return "生物";
        else
            return "基本能力";
    }

    private String getEngCourseName(String courseEnglish){
        if("语文".equals(courseEnglish))
            return "chinese";
        else if("英语".equals(courseEnglish))
            return "english";
        else if("数学".equals(courseEnglish))
            return "math";
        else if("政治".equals(courseEnglish))
            return "political";
        else if("地理".equals(courseEnglish))
            return "geography";
        else if("历史".equals(courseEnglish))
            return "history";
        else if("物理".equals(courseEnglish))
            return "physico";
        else if("化学".equals(courseEnglish))
            return "chemical";
        else if("生物".equals(courseEnglish))
            return "biology";
        else
            return "basic_competencies";
    }
    @RequestMapping("scoreSort")
    public String sort(@RequestParam Long id, Model model,@RequestParam(value = "name",defaultValue = "")String name) {
        try {
            List<MsSchoolmaster> msSchoolmasters= schoolMasterService.selectByTeacherId(id);
            Map<String,String> classNames=new HashMap<>();
            if(msSchoolmasters.size()!=0){
                 for(MsSchoolmaster m:msSchoolmasters){
                 String className="";
                 if((m.getClassId()-1)/12==0){
                    className+="高一"+m.getClassId()%12+"班";
                    }else if((m.getClassId()-1)/12==1){
                    className+="高二"+m.getClassId()%12+"班";
                     }else{
                    className+="高三"+m.getClassId()%12+"班";
                 }
                classNames.put(className, className);
            }
                model.addAttribute("courseName",getCourseName(msSchoolmasters.get(0).getCourseName()));
                if(!"".equals(name)) {
                    String className = name.substring(0, 2);
                    long classId = 0L;
                    int type = 1;
                    int grade = Integer.parseInt(name.substring(2, name.length() - 1));
                    if ("高一".equals(className)) {
                        classId = grade;
                    } else if ("高二".equals(className)) {
                        classId = grade + 12;

                    } else {
                        classId = grade + 24;
                    }
                    int count = scoreService.countStudents(classId, msSchoolmasters.get(0).getCourseName());
                    int pageSize = Integer.parseInt(WebConf.getValue("pageSize"));
                    count = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
                    model.addAttribute("count", count);
                }
            }else{
                model.addAttribute("courseName","");
                model.addAttribute("count", 1);
            }
            model.addAttribute("name",name);
            model.addAttribute("classNames",classNames);
            return "teachers/t_dkcj";
        } catch (Exception e) {
            LOG.error("查询成绩失败{}", e.getMessage());
            return "error/error";
        }
    }

    @RequestMapping("scoreSelect")
    @ResponseBody
    public ResponseResult sorts( @RequestParam(defaultValue = "1") int offset,@RequestParam(value = "name",defaultValue = "")String name,@RequestParam(value = "course",defaultValue = "")String course,Model model) {
        try {
            int limit= Integer.parseInt(WebConf.getValue("pageSize"));
            String className=name.substring(0,2);
            long classId=0L;
            int type=1;
            int grade=Integer.parseInt(name.substring(2,name.length()-1));
            if("高一".equals(className)){
                classId=grade;
            }else if("高二".equals(className)){
                classId=grade+12;
                if((grade>=1&&grade<=3)||(grade>=7&&grade<=9)){
                  type=2;
                }else{
                   type=3;
                }
            }else{
                classId=grade+24;
                if((grade>=1&&grade<=3)||(grade>=7&&grade<=9)){
                   type=4;
                }else{
                  type=5;
                }
            }
            Page msScores = scoreService.selectNowScoreByClassId(getEngCourseName(course), limit, (offset-1)*limit,classId,type);
           return ResponseResult.ok(msScores);
        } catch (Exception e) {
            LOG.error("查询成绩失败{}", e.getMessage());
            return ResponseResult.build(500,"查询失败");
        }
    }

    @RequestMapping("passRate")
    public String passRate(@RequestParam(value = "id",defaultValue = "-1") Long id, Model model,@RequestParam(value = "className",defaultValue = "")String retClassName,@RequestParam(value = "courseName",defaultValue = "")String courseName) {
        try {
            List<MsSchoolmaster> msSchoolmasters= schoolMasterService.selectByTeacherId(id);
            Map<String,String> classNames=new HashMap<>();
            if(msSchoolmasters.size()!=0){
                for(MsSchoolmaster m:msSchoolmasters){
                    String className="";
                    if((m.getClassId()-1)/12==0){
                        className+="高一"+m.getClassId()%12+"班";
                    }else if((m.getClassId()-1)/12==1){
                        className+="高二"+m.getClassId()%12+"班";
                    }else{
                        className+="高三"+m.getClassId()%12+"班";
                    }
                    classNames.put(className, className);
                }
                model.addAttribute("courseName",getCourseName(msSchoolmasters.get(0).getCourseName()));
                int count=scoreService.countStudents(id,msSchoolmasters.get(0).getCourseName());
                int pageSize=Integer.parseInt(WebConf.getValue("pageSize"));
                count=count%pageSize==0?count/pageSize:count/pageSize+1;
                model.addAttribute("count", count);
            }else{
                model.addAttribute("courseName","");
                model.addAttribute("count", "");
            }
            model.addAttribute("name",retClassName);
            model.addAttribute("classNames",classNames);
            if(id!=-1) {
                int[] pass = scoreService.selectPassRateByClassId(id);
                model.addAttribute("passNum", pass);
            }else{
                String className=retClassName.substring(0,2);
                long classId=0L;
                int grade=Integer.parseInt(retClassName.substring(2,retClassName.length()-1));
                if("高一".equals(className)){
                    classId=grade;
                }else if("高二".equals(className)){
                    classId=grade+12;
                }else{
                    classId=grade+24;
                }
                int[] pass=scoreService.selectPassRateByClassId(classId);
                model.addAttribute("passNum", pass);
            }
            return "teachers/t_jige";
        } catch (Exception e) {
            LOG.error("查询成绩失败{}", e.getMessage());
            return "error/error";
        }
    }
}