package com.web.travel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/start.action")
	public String home(Model model,@RequestParam(value="menu",defaultValue="1") int menu) {
		logger.info("log : home");
		model.addAttribute("menu", menu);
		return "start";
	}
}
