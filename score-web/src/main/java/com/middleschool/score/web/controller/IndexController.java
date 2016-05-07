package com.middleschool.score.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {

	@RequestMapping("/")
	public String showIndex(){
		return "login/login";
	}

	@RequestMapping("/stuTop")
	public String showstuTop(){
		return "students/stu_top";
	}

	@RequestMapping("/stuNcj")
	public String showstu_ncj(){
		return "students/stu_ncj";
	}

	@RequestMapping("/stuGmm")
	public String showstu_gmm(){
		return "students/stu_gmm";
	}

	@RequestMapping("/stuInfo")
	public String showstuInfo(){
		return "students/stu_info";
	}

	@RequestMapping("/teachTop")
	public String showTeachTop(){
		return "teachers/teach_top";
	}

	@RequestMapping("/teachInfo")
	public String showTeachInfo(){
		return "teachers/teach_info";
	}

	@RequestMapping("/teachLeft")
	public String showTeachLeft(){
		return "teachers/teach_left";
	}

	@RequestMapping("/teachGmm")
	public String showteach_gmm(){
		return "teachers/t_gmm";
	}

	@RequestMapping("/tJige")
	public String showJige(){return "teachers/t_jige";}

	@RequestMapping("menu/{module}/{page}")
	public String showPage(@PathVariable String module, @PathVariable String page){
		return module+"/"+page;
	}


	
	
}
