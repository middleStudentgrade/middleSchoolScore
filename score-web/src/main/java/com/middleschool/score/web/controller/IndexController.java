package com.middleschool.score.web.controller;

import com.middleschool.score.common.dto.MsStudent;
import com.middleschool.score.common.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {
	@Autowired
	private TestService testService;

	@RequestMapping("/")
	public String showIndex(){
		return "index";
	}
	
	@RequestMapping("/menu/{module}/{page}")
	public String showPage(@PathVariable String module, @PathVariable String page){
		return module+"/"+page;
	}


	
	
}
