package com.web.travel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/start.action")
	public String startRequest() {
		
		return "start";
	}
}
