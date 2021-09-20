package com.web.travel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/review_form.do", method = RequestMethod.GET)
	public String loadSideBar() {
		return "reviews/review_form";
	}
	
	@RequestMapping(value = "/review_detail.do", method = RequestMethod.GET)
	public String loadContent() {
		return "reviews/review_detail";
	}
}