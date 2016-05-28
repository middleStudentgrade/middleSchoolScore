package com.middleschool.score.web.controller;

import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.pojo.ResponseResult;
import com.middleschool.score.common.pojo.ScoreClass;
import com.middleschool.score.common.service.ScoreService;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.utils.JsonUtils;
import com.middleschool.score.common.utils.MD5Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Administrator on 2016/3/1.
 */
@Controller
@RequestMapping("/student/")
public class StudentController {

    private static final Logger LOG= LoggerFactory.getLogger(StudentController.class);

    @Autowired
    private StudentService studentService;

    @Autowired
    private ScoreService scoreService;
    private double getAllScore(MsScore msScore){
        return msScore.getBiology()+msScore.getChemical()+msScore.getChinese()+msScore.getEnglish()+
                msScore.getGeography()+msScore.getHistory()+msScore.getMath()+msScore.getPhysico()+msScore.getPolitical();
    }
    @RequestMapping("select")
    public MsStudent getInfo(@RequestParam Long  id){
        try{
            MsStudent msStudent=studentService.getById(id);
            return msStudent;
        }catch (Exception e){
            LOG.error("获取学生信息失败{}",e.getMessage());
            return null;
        }
    }

    @RequestMapping("changePassword")
    @ResponseBody
    public ResponseResult updatePassword(@RequestParam Long  id,@RequestParam String password){
        try{
            MsStudent msStudent=studentService.getById(id);
            msStudent.setPassword(MD5Utils.md5(password));
            studentService.updateStudent(msStudent);
            return ResponseResult.ok();
        }catch (Exception e){
            LOG.error("密码错误{}",e.getMessage());
            return ResponseResult.build(500,"修改密码失败");
        }
    }


    @RequestMapping(value = "getPassword",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getPasword(@RequestParam Long  id,@RequestParam String password){
        try{
            MsStudent msStudent=studentService.getById(id);
           if(MD5Utils.md5(password).equals(msStudent.getPassword()))
                return ResponseResult.ok();
            return ResponseResult.build(500,"密码错误");
        }catch (Exception e){
            LOG.error("密码错误{}",e.getMessage());
            return ResponseResult.build(500, "密码错误");
        }
    }

    @RequestMapping(value = "getNowScore")
    public String getNowScore(@RequestParam Long id, Model model){
        try{
            MsScore msScore =scoreService.selectNowScoreByStudentId(id).get(0);
            int ranking=scoreService.selectRanking(id,msScore.getClassId())+1;
            model.addAttribute("nowScore",msScore);
            model.addAttribute("allScore",getAllScore(msScore));
            model.addAttribute("ranking",ranking);
            return "students/stu_ncj";
        }
        catch (Exception e){
            LOG.error("查询成绩失败{}",e.getMessage());
            return "error/error";
        }
    }
    private String getClass(int i){
        String className="";
        switch (i){
            case 0: className= "高一上学期";break;
            case 1:className= "高一下学期";break;
            case 2:className= "高二上学期";break;
            case 3:className= "高二下学期";break;
            case 4:className= "高三上学期";break;
            case 5:className= "高三下学期";break;
        }
        return className;
    }
    @RequestMapping(value = "getAllScore")
    public String getAllScore(@RequestParam Long id, Model model){
        try{
           List<ScoreClass> msScores =scoreService.selectAllScoreByStudentId(id);
            for(int i=0;i< msScores.size();i++){
                msScores.get(i).setGrade(getClass(i));
            }
            model.addAttribute("scores",msScores);
            return "students/stu_bcj";
        }
        catch (Exception e){
            LOG.error("查询成绩失败{}",e.getMessage());
            return "error/error";
        }
    }
}
