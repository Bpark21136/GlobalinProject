package com.web.travel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MenuController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/sidebar.do", method = RequestMethod.GET)
	public String loadSideBar(@RequestParam String id) {
		return "content/" + id + "_content";
	}
	
	@RequestMapping(value = "/content.do", method = RequestMethod.GET)
	public String loadContent(@RequestParam String id) {
		return "sidebar/" + id + "_sidebar";
	}
}
