package com.middleschool.score.admin.controller;

import com.middleschool.score.common.dto.MsClass;
import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.pojo.*;
import com.middleschool.score.common.service.ClassService;
import com.middleschool.score.common.service.ScoreService;
import com.middleschool.score.common.service.StudentService;
import com.middleschool.score.common.utils.DateUtil;
import com.middleschool.score.common.utils.ExcelUtil;
import com.middleschool.score.common.utils.WebConf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.*;

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
    @RequestMapping(value = "import",method = RequestMethod.POST)
    public String importArchives(@RequestParam(value = "file") MultipartFile file,@RequestParam(value = "grade")Integer grade,@RequestParam(value = "className") String className) throws Exception {

        InputStream is;
        is = file.getInputStream();
        if (!is.markSupported()) {
            is = new PushbackInputStream(is, 8);
        }
        List<MsScore> msScores=new ArrayList<>();
        List<MsClass> msClass=classService.getByRankDeptAndGradeAndName(className, grade);
        try {
            ExcelUtil excelUtil = ExcelUtil.create(is);
            int semester=0;
            String start="";
            String end="";
            Date startDate=null;
            Date endDate=null;
            int type=1;
            Calendar now = Calendar.getInstance();

            if(now.get(Calendar.MONTH)>3&&now.get(Calendar.MONTH)<9){
                semester=1;
                start=now.get(Calendar.YEAR)+"-03-01";
                end=now.get(Calendar.YEAR)+"-09-01";
                startDate= DateUtil.formatDate(start);
                endDate=DateUtil.formatDate(end);
            }else{
                start=now.get(Calendar.YEAR)+"-09-02";
                end=(now.get(Calendar.YEAR)+1)+"-02-28";
                startDate= DateUtil.formatDate(start);
                endDate=DateUtil.formatDate(end);
            }
            if("高一".equals(className)){
                type=1;
                List<SophomoreScore> list = excelUtil.readExcel(SophomoreScore.class);
                for(SophomoreScore e:list){
                    MsScore msScore=new MsScore();
                    BeanUtils.copyProperties(e,msScore);
                    msScore.setClassId(Integer.parseInt(msClass.get(0).getId().toString()));
                    msScore.setSemester(semester);
                    msScore.setStartDate(startDate);
                    msScore.setEndDate(endDate);
                    msScore.setType(type);
                    msScores.add(msScore);
                }
            }else if("高二".equals(className)){
                if(grade<7){
                    type=2;
                    List<JuniorScoreArt> list = excelUtil.readExcel(JuniorScoreArt.class);
                    for(JuniorScoreArt e:list){
                        MsScore msScore=new MsScore();
                        BeanUtils.copyProperties(e,msScore);
                        msScore.setClassId(Integer.parseInt(msClass.get(0).getId().toString()));
                        msScore.setSemester(semester);
                        msScore.setStartDate(startDate);
                        msScore.setEndDate(endDate);
                        msScore.setType(type);
                        msScores.add(msScore);
                    }
                }else {
                    type=3;
                    List<JuniorScoreScience> list = excelUtil.readExcel(JuniorScoreScience.class);
                    for(JuniorScoreScience e:list){
                        MsScore msScore=new MsScore();
                        BeanUtils.copyProperties(e,msScore);
                        msScore.setClassId(Integer.parseInt(msClass.get(0).getId().toString()));
                        msScore.setSemester(semester);
                        msScore.setStartDate(startDate);
                        msScore.setEndDate(endDate);
                        msScore.setType(type);
                        msScores.add(msScore);
                    }
                }
            }else{
                if(grade<7){
                    type=4;
                    List<SeniorScoreArt> list = excelUtil.readExcel(SeniorScoreArt.class);
                    for(SeniorScoreArt e:list){
                        MsScore msScore=new MsScore();
                        BeanUtils.copyProperties(e,msScore);
                        msScore.setClassId(Integer.parseInt(msClass.get(0).getId().toString()));
                        msScore.setSemester(semester);
                        msScore.setStartDate(startDate);
                        msScore.setEndDate(endDate);
                        msScore.setType(type);
                        msScores.add(msScore);
                    }
                }else {
                    type=5;
                    List<SeniorScoreScience> list = excelUtil.readExcel(SeniorScoreScience.class);
                    for(SeniorScoreScience e:list){
                        MsScore msScore=new MsScore();
                        BeanUtils.copyProperties(e,msScore);
                        msScore.setClassId(Integer.parseInt(msClass.get(0).getId().toString()));
                        msScore.setSemester(semester);
                        msScore.setStartDate(startDate);
                        msScore.setEndDate(endDate);
                        msScore.setType(type);
                        msScores.add(msScore);
                    }
                }
            }
            scoreService.saves(msScores);
        } catch (Exception e) {

            e.printStackTrace();
           return "error";
        }
        return "success";
    }
    @RequestMapping("getAll")
    @ResponseBody
    public ResponseResult getAll(@RequestParam(value = "offset",defaultValue = "1")int offset,@RequestParam(value = "grade",defaultValue = "1")int grade,@RequestParam(value = "name",defaultValue = "高一")String name){
        try {
            int limit=Integer.parseInt(WebConf.getValue("pageSize"));
            Page page = new Page();
            List<MsScore> msScores = scoreService.findAll(limit, (offset-1)*limit,grade,name);
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
                scoreAdmin.setAllGrade(getAllScore(m));
                scoreAdmins.add(scoreAdmin);
            }
            page.setNum(scoreAdmins.size());
            page.setDatas(scoreAdmins);
            return ResponseResult.ok(page);
        }catch (Exception e){
            LOG.error("获取成绩信息失败{}",e.getMessage());
            return ResponseResult.build(500,"获取成绩信息失败");
        }
    }

    private double getAllScore(MsScore msScore){
        return msScore.getBiology()+msScore.getChemical()+msScore.getChinese()+msScore.getEnglish()+
                msScore.getGeography()+msScore.getHistory()+msScore.getMath()+msScore.getPhysico()+msScore.getPolitical();
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
            return "admin/rank/grade_top10";
        }catch (Exception e){
            LOG.error("更新失败{}",e.getMessage());
            return "admin/rank/grade_top10";
        }
    }


    @RequestMapping(value = "gradeTopHundredthHighOne")
    @ResponseBody
    public ResponseResult gradeTopHundredthHighOne(@RequestParam("id")Integer id,@RequestParam(value = "offset",defaultValue = "1")int offset){
        try {
            int limit=Integer.parseInt(WebConf.getValue("pageSize"));
            Page page = new Page();
            List<MsScore> msScores = scoreService.findTopHundredth(id,limit,(offset-1)*limit);
            List<ScoreAdmin> scoreAdmins=new ArrayList<>();
            int i=1;
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
                scoreAdmin.setAllGrade(getAllScore(m));
                scoreAdmin.setRanking(i++);
                scoreAdmins.add(scoreAdmin);
            }
            page.setDatas(scoreAdmins);
            return ResponseResult.ok(page);
        }catch (Exception e){
            LOG.error("查询失败{}",e.getMessage());
            return ResponseResult.build(500,"查询失败");
        }
    }



    @RequestMapping(value = "courseTopOne")
    public String CourseTopOne(Model model){
        try {
            List<TopScore> sophomoreScore=scoreService.getSophomoreScore();
            List<TopScore> juniorScoreArt=scoreService.getJuniorScoreArt();
            List<TopScore> juniorScoreScience=scoreService.juniorScoreScience();
            List<TopScore> seniorScoreArt=scoreService.getSeniorScoreArt();
            List<TopScore> seniorScoreScience=scoreService.getSeniorScoreScience();
            model.addAttribute("sophomoreScore",sophomoreScore);
            model.addAttribute("juniorScoreArt",juniorScoreArt);
            model.addAttribute("juniorScoreScience",juniorScoreScience);
            model.addAttribute("seniorScoreScience",seniorScoreScience);
            model.addAttribute("seniorScoreArt",seniorScoreArt);
            return "admin/rank/course_top1";
        }catch (Exception e){
            LOG.error("查询失败{}",e.getMessage());
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
    @RequestMapping(value = "passRateInfo")
    @ResponseBody
    public ResponseResult passRateGetInfo(){
        try {
            double[] sophomoreScore = scoreService.getSophomoreAvgScore();
            double[] juniorScoreArt = scoreService.getJuniorScoreAvgArt();
            double[] juniorScoreScience = scoreService.juniorScoreAvgScience();
            double[] seniorScoreArt = scoreService.getSeniorScoreAvgArt();
            double[] seniorScoreScience = scoreService.getSeniorScoreAvgScience();
            Map<String, double[]> map = new HashMap<>();
            map.put("sophomoreScore", sophomoreScore);
            map.put("juniorScoreArt", juniorScoreArt);
            map.put("juniorScoreScience", juniorScoreScience);
            map.put("seniorScoreArt", seniorScoreArt);
            map.put("seniorScoreScience", seniorScoreScience);
            return ResponseResult.ok(map);
        }catch (Exception e){
            return ResponseResult.build(500,"获取平均成绩失败");
        }
    }
}
