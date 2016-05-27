package com.middleschool.score.admin.controller;


import com.middleschool.score.common.dto.MsClass;
import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.pojo.Page;
import com.middleschool.score.common.service.*;
import com.middleschool.score.common.utils.WebConf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
public class IndexController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private TeacherService teacherService;

	@Autowired
	private ScoreService scoreService;

	@Autowired
	private ClassService classService;
	/**
	 * @Title	showIndex
	 * @Description show index
	 * @param	@return
	 * @return	String
	 * @throws
	 */
	@RequestMapping("/")
	public String showIndex(){
		return "login/login";
	}
	@RequestMapping("adTop")
	public String adTop(){
		return "admin/ad_top";
	}
	@RequestMapping("adLeft")
	public String adLeft(){
		return "admin/ad_left";
	}
	@RequestMapping("adSinfo")
	public String adSinfo(Model model){
		int count = studentService.countStudent();
		int pageSize=Integer.parseInt(WebConf.getValue("pageSize"));
		count=count%pageSize==0?count/pageSize:count/pageSize+1;
		model.addAttribute("count",count);
			return "admin/ad_sinfo";
	}
	@RequestMapping("adTinfo")
	public String adTinfo(Model model){
		int count = teacherService.countTeacher();
		int pageSize=Integer.parseInt(WebConf.getValue("pageSize"));
		count=count%pageSize==0?count/pageSize:count/pageSize+1;
		model.addAttribute("count",count);
		return "admin/ad_tinfo";
	}
	@RequestMapping("adScore")
	public String adScore(Model model,@RequestParam(value = "grade",defaultValue = "1")int grade,@RequestParam(value = "stuclassName",defaultValue = "高一")String stuclassName){
		int count = scoreService.countScore(grade,stuclassName);
		int pageSize=Integer.parseInt(WebConf.getValue("pageSize"));
		List<MsClass> msClass=classService.getByRankDeptAndGradeAndName(stuclassName,grade);
		if(msClass.size()!=0){
			model.addAttribute("classTeacherId",msClass.get(0).getTeacherId());
		}
		count=count%pageSize==0?count/pageSize:count/pageSize+1;
		model.addAttribute("count",count);
		model.addAttribute("grade",grade);
		model.addAttribute("className",stuclassName);
		return "admin/ad_score";
	}

@RequestMapping("tests")
	public String tests(){
	return "test";
}
}
