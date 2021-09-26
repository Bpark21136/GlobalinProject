package com.web.travel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.travel.dto.accountDTO;
import com.web.travel.modelDAO.SecurityConfig;
import com.web.travel.service.ArticleService;
import com.web.travel.service.CommentService;
import com.web.travel.service.MypageService;
import com.web.travel.service.ReviewService;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	ArticleService as;
	
	@Autowired
	CommentService cs;
	
	@Autowired
	ReviewService rs;
	
	@Autowired
	MypageService ms;
	
	@RequestMapping("/mypage.do")
	public String home(Model model, HttpSession session) {
		logger.info("log : home");
		
		String userId = (String) session.getAttribute("userId");
		accountDTO user = ms.selectUser(userId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("email",user.getEmail());
		model.addAttribute("country",user.getCountry());
		return "content/menu4_content";
	}
	@RequestMapping("/change_user_info.do")
	public String homexxx(Model model, HttpSession session) {
		logger.info("log : home");
		
		String userId = (String) session.getAttribute("userId");
		accountDTO user = ms.selectUser(userId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("email",user.getEmail());
		model.addAttribute("country",user.getCountry());
		return "myPage/change";
	}
	
	@ResponseBody
	@RequestMapping(value="/pw_check.do", method=RequestMethod.POST)
	public Map<String,Object> pw_check(@RequestBody Map<String,String> map, HttpSession session) {
		SecurityConfig enc = new SecurityConfig();
		String pw = map.get("pw");
		String pwenc = enc.encryptionMain(pw);
		String userId = session.getAttribute("userId").toString();
		accountDTO dto =  ms.selectUser(userId);
		logger.debug("pwenc : " + pwenc);
		logger.debug("userPW : " + dto.getHashedPassword());
		Map<String,Object> ret = new HashMap<String, Object>();
		if(!pwenc.equals(dto.getHashedPassword())) {
			logger.debug("return error");
			ret.put("code", -1);
			return ret;
		}
		ret.put("code", 1);
		return ret;	
	}
	
	@ResponseBody
	@RequestMapping(value="/change_info.do", method=RequestMethod.POST)
	public Map<String,Object> change_info(@RequestBody Map<String,String> map, HttpSession session) {
		SecurityConfig enc = new SecurityConfig();
		String pw = map.get("newPw");
		String country = map.get("country");
		String pwenc = enc.encryptionMain(pw);
		String userId = session.getAttribute("userId").toString();
		accountDTO dto =  new accountDTO();
		dto.setCountry(country);
		dto.setHashedPassword(pwenc);
		dto.setUserId(userId);
		logger.debug(dto.getHashedPassword());
		
		int code = ms.updateUserInfo(dto);
		Map<String,Object> ret = new HashMap<String, Object>();
		
		if(code != 1)
			return null;
		
		ret.put("code", 1);
		return ret;	
	}
	
	@ResponseBody
	@RequestMapping(value="/delete_user.do", method=RequestMethod.POST)
	public Map<String,Object> delete_user(@RequestBody Map<String,String> map, HttpSession session) {
		Map<String,Object> ret = pw_check(map,session);
		if((Integer) ret.get("code") != 1) {
			return ret;
		}
		String userId = session.getAttribute("userId").toString();
		
		int code = ms.deleteUser(userId);
		
		if(code != 1)
			return null;
		
		session.invalidate();
		
		ret.put("code", 1);
		return ret;	
	}
	
	@ResponseBody
	@RequestMapping(value="/delete_info.do", method=RequestMethod.POST)
	public Map<String,Object> delete_info(@RequestBody Map<String,String> map, HttpSession session) {
		return null;
	}
	
	
	
	@RequestMapping("/my_reviews.do")
	public String homeadad(Model model,@RequestParam(value="page",defaultValue="1") int page, HttpSession session) {
		logger.info("log : home");
		
		String userId = (String) session.getAttribute("userId");
		ArrayList<Map<String, Object>> ret = rs.getReviewListByUid(userId,page);
		int maxPage = rs.getMaxPage(userId);
		model.addAttribute("reviews",ret);
		model.addAttribute("userId", userId);
		model.addAttribute("maxPage",maxPage);
		return "myPage/my_reviews";
	}
	@RequestMapping("/my_articles.do")
	public String homex(Model model,@RequestParam(value="page",defaultValue="1") int page, HttpSession session) {
		logger.info("log : home");
		
		String userId = (String) session.getAttribute("userId");
		ArrayList<Map<String, Object>> ret = as.getArticleListByUid(userId,page);
		int maxPage = as.getMaxPageByUid(userId);
		model.addAttribute("articles",ret);
		model.addAttribute("userId", userId);
		model.addAttribute("maxPage",maxPage);
		return "myPage/my_articles";
	}
	
	@RequestMapping(value = "/load_my_reviews_detail.do", method = RequestMethod.POST)
	public ModelAndView loadContent(@RequestParam(required = true, value = "rid") long rid,HttpSession session) {
		logger.debug("review_detail");

		Map<String, Object> review = rs.selectReviewById(rid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("myPage/my_reviews_detail");
		modelAndView.addObject("REVIEWID",review.get("REVIEWID"));
		modelAndView.addObject("TITLE",review.get("TITLE"));
		modelAndView.addObject("PREVIEW",review.get("PREVIEW"));
		modelAndView.addObject("CONTENT",review.get("CONTENT"));
		modelAndView.addObject("DATE",review.get("DATE"));
		modelAndView.addObject("USERID",review.get("USERID"));
		modelAndView.addObject("COUNTRY",review.get("COUNTRY"));
		modelAndView.addObject("POINTID",review.get("POINTID"));
		if(session!= null) {
			if(session.getAttribute("userId") != null)
				modelAndView.addObject("CURRENTUSERID",session.getAttribute("userId"));
		}
		
		ArrayList<Map<String,Object>> comments = cs.getCommentListByRid(rid);
		modelAndView.addObject("comments",comments);
		return modelAndView;
	}
	
	@RequestMapping(value = "/load_my_review_update.do", method = RequestMethod.POST)
	public ModelAndView loadReviewUpdate(@RequestParam(required = true, value = "rid") long rid,HttpSession session) {
		logger.debug("review_update");

		Map<String, Object> review = rs.selectReviewById(rid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("myPage/my_review_update");
		modelAndView.addObject("REVIEWID",review.get("REVIEWID"));
		modelAndView.addObject("TITLE",review.get("TITLE"));
		modelAndView.addObject("PREVIEW",review.get("PREVIEW"));
		modelAndView.addObject("CONTENT",review.get("CONTENT"));
		modelAndView.addObject("DATE",review.get("DATE"));
		modelAndView.addObject("USERID",review.get("USERID"));
		modelAndView.addObject("COUNTRY",review.get("COUNTRY"));
		modelAndView.addObject("POINTID",review.get("POINTID"));
		if(session!= null) {
			if(session.getAttribute("userId") != null)
				modelAndView.addObject("CURRENTUSERID",session.getAttribute("userId"));
		}
		
		ArrayList<Map<String,Object>> comments = cs.getCommentListByRid(rid);
		modelAndView.addObject("comments",comments);
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
}
