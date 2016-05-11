package com.middleschool.score.admin.controller;

import com.middleschool.score.common.dto.MsClass;
import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.pojo.ResponseResult;
import com.middleschool.score.common.pojo.ScoreAdmin;
import com.middleschool.score.common.service.ClassService;
import com.middleschool.score.common.service.ScoreService;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.utils.WebConf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/score/")
public class ScoreController {

    private static final Logger LOG= LoggerFactory.getLogger(ScoreController.class);
    @Autowired
    private ScoreService scoreService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private ClassService classService;
    /**
     * 导入excel文件
     */
    @RequestMapping(value = "/import")
    public void importArchives(/*@RequestParam(value = "file") MultipartFile file*/) {
       /* Long courseId=1L;
        String grade="2";
        String jibu="ajib";
        List<MsScorePojo> msScoreList = new ArrayList<MsScorePojo>();
        List<MsScore> scoreList = new ArrayList<MsScore>();
        MsScore msScore=new MsScore();
        InputStream is = null;
        try {
            is = FileInputStreamToInputStream.getInputStream(new FileInputStream("/home/mentongwu/bb.xls"));
            String[] fileNames = new String[] { "courseId", "studentId", "score" };
            if (!is.markSupported()) {
                is = new PushbackInputStream(is, 8);
            }
            if (POIFSFileSystem.hasPOIFSHeader(is)) {
                ExcelHelper hssf = HssfExcelHelper.getInstance(is);
                msScoreList = hssf.readExcel(MsScorePojo.class, fileNames, true);
            }
            if (POIXMLDocument.hasOOXMLHeader(is)) {
                ExcelHelper xssf = XssfExcelHelper.getInstance(is);
                msScoreList = xssf.readExcel(MsScorePojo.class, fileNames, true);
            }
            for(MsScorePojo msScorePojo: msScoreList){
                msScore.setCourseCode(Long.valueOf(msScorePojo.getCourseId()));
                msScore.setGrade(grade);
                msScore.setStudentId(Long.valueOf(msScorePojo.getStudentId()));
                msScore.setJibu(jibu);
                msScore.setScore(Double.valueOf(msScorePojo.getScore()));
                scoreList.add(msScore);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        scoreService.saveScores(scoreList);*/
    }
    @RequestMapping("getAll")
    @ResponseBody
    public ResponseResult getAll(@RequestParam(value = "offset",defaultValue = "1")int offset){
        try {
            int limit=Integer.parseInt(WebConf.getValue("pageSize"));
            Page page = new Page();
            List<MsScore> msScores = scoreService.findAll(limit, (offset-1)*limit);
            List<ScoreAdmin> scoreAdmins=new ArrayList<>();
            for(MsScore m:msScores){
                ScoreAdmin scoreAdmin=new ScoreAdmin();
                MsStudent msStudent=studentService.getById(m.getStudentId());
                BeanUtils.copyProperties(m,scoreAdmin);
                scoreAdmin.setName(msStudent.getName());
                MsClass msClass=classService.getById((long)m.getClassId());
                scoreAdmin.setClassName(msClass.getName()+msClass.getGrade()+"班");
                if(m.getSemester()==1) {
                    scoreAdmin.setTerm("下学期");
                }else {
                    scoreAdmin.setTerm("上学期");
                }
                scoreAdmins.add(scoreAdmin);
            }
            page.setDatas(scoreAdmins);
            int count = scoreService.countScore();
            page.setNum(count);
            return ResponseResult.ok(page);
        }catch (Exception e){
            LOG.error("获取成绩信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取成绩信息失败");
        }
    }



    @RequestMapping("getScore")
    @ResponseBody
    public ResponseResult getScore(@RequestParam(value = "name")String name){
        try {
            Page page = new Page();
            List<MsScore> msScores = scoreService.findScore(name);
            List<ScoreAdmin> scoreAdmins=new ArrayList<>();
            for(MsScore m:msScores){
                ScoreAdmin scoreAdmin=new ScoreAdmin();
                MsStudent msStudent=studentService.getById(m.getStudentId());
                BeanUtils.copyProperties(m,scoreAdmin);
                scoreAdmin.setName(msStudent.getName());
                MsClass msClass=classService.getById((long)m.getClassId());
                scoreAdmin.setClassName(msClass.getName()+msClass.getGrade()+"班");
                if(m.getSemester()==1) {
                    scoreAdmin.setTerm("下学期");
                }else {
                    scoreAdmin.setTerm("上学期");
                }
                scoreAdmins.add(scoreAdmin);
            }
            page.setDatas(scoreAdmins);
            int count = scoreService.countScore();
            page.setNum(count);
            return ResponseResult.ok(page);
        }catch (Exception e){
            LOG.error("获取成绩信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取成绩信息失败");
        }
    }

    @RequestMapping("getOne")
    @ResponseBody
    public ResponseResult getOne(@RequestParam(value = "id")Long id,Model model){
        try {
            MsScore msScore = scoreService.getScoreById(id);
            ScoreAdmin scoreAdmin=new ScoreAdmin();
            BeanUtils.copyProperties(msScore,scoreAdmin);
            MsStudent msStudent=studentService.getById(msScore.getStudentId());
            BeanUtils.copyProperties(msScore,scoreAdmin);
            scoreAdmin.setName(msStudent.getName());
            MsClass msClass=classService.getById((long)msScore.getClassId());
            scoreAdmin.setClassName(msClass.getName()+msClass.getGrade()+"班");
            if(msScore.getSemester()==1) {
                scoreAdmin.setTerm("下学期");
            }else {
                scoreAdmin.setTerm("上学期");
            }
                model.addAttribute("scoreAdmin",scoreAdmin);
                return ResponseResult.ok(scoreAdmin);
        }catch (Exception e){
            LOG.error("获取成绩信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取成绩信息失败");
        }
    }
    @RequestMapping(value = "update")
    @ResponseBody
    public ResponseResult update(ScoreAdmin scoreAdmin){
        try {
            MsScore msScore=new MsScore();
            BeanUtils.copyProperties(scoreAdmin,msScore);
            scoreService.updateScore(msScore);
            return ResponseResult.ok();
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return ResponseResult.build(500, "更新失败");
        }
    }
    @RequestMapping(value = "delete")
    @ResponseBody
    public ResponseResult delete(@RequestParam("id")Long id){
        try {
            scoreService.delete(id);
            return ResponseResult.ok();
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return ResponseResult.build(500, "更新失败");
        }
    }

    @RequestMapping(value = "gradeTopHundredth")
    public String gradeTopHundredth(){
        try {
            return "admin/rank/grade_top100";
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return "admin/rank/grade_top100";
        }
    }
    @RequestMapping(value = "courseTopOne")
    public String CourseTopOne(){
        try {
            return "admin/rank/course_top1";
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return "admin/rank/course_top1";
        }
    }
    @RequestMapping(value = "passRate")
    public String passRate(){
        try {
            return "admin/rank/pass_rate";
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return "admin/rank/pass_rate";
        }
    }
    @RequestMapping(value = "deptTopTen")
    public String deptTopTen(){
        try {
            return "admin/rank/dept_top10";
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return "admin/rank/dept_top10";
        }
    }
}
