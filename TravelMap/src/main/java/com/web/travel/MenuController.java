package com.web.travel;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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

import com.web.travel.dto.ArticleDTO;
import com.web.travel.dto.CommentDTO;
import com.web.travel.dto.ReviewDTO;
import com.web.travel.service.ArticleService;
import com.web.travel.service.CommentService;
import com.web.travel.service.ReviewService;

@Controller
public class MenuController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	ArticleService as;
	
	@Autowired
	CommentService cs;
	
	@Autowired
	ReviewService rs;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/sidebar.action", method = RequestMethod.GET)
	public String loadSideBar(@RequestParam String id) {
		return "content/" + id + "_content";
	}
	
	@RequestMapping(value = "/content.action", method = RequestMethod.GET)
	public String loadContent(@RequestParam String id) {
		return "sidebar/" + id + "_sidebar";
	}
	
	@RequestMapping("/board.action")
	public String home(Model model,@RequestParam(value="page",defaultValue="1") int page,@RequestParam(value="query",defaultValue="") String query, HttpSession session) {
		logger.info("log : home");
		
		String userId = (String) session.getAttribute("userId");
		ArrayList<Map<String, Object>> ret = as.getArticleList(query,page);
		int maxPage = as.getMaxPage(query);
		model.addAttribute("articles",ret);
		model.addAttribute("userId", userId);
		model.addAttribute("maxPage",maxPage);
		return "content/menu2_content";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write() {
		return "bbsPage/write";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/article_create.do", method=RequestMethod.POST)
	public Map<String,Object> reviewCreate(@RequestBody Map<String,String> map, HttpSession session) {
		
		Map<String,Object> ret = new HashMap<String, Object>();
		ArticleDTO dto = new ArticleDTO();
		
		dto.setTitle(map.get("title"));
		dto.setContent(map.get("content"));
		String uid = session.getAttribute("userId").toString();
		dto.setUserID(uid);
		long id = as.insertArticle(dto);
		ret.put("aid", id);
		
		return ret;	
	}
	
	@RequestMapping(value = "/bbsview.action", method = RequestMethod.POST)
	public ModelAndView loadContent(@RequestParam(required = true, value = "aid") long aid,HttpSession session) {
		logger.debug("bbsView");

		Map<String, Object> article = as.selectArticleById(aid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("bbsPage/bbsView");
		modelAndView.addObject("ARTICLEID",article.get("ARTICLEID"));
		modelAndView.addObject("TITLE",article.get("TITLE"));
		modelAndView.addObject("CONTENT",article.get("CONTENT"));
		modelAndView.addObject("DATE",article.get("DATE"));
		modelAndView.addObject("USERID",article.get("USERID"));
		modelAndView.addObject("COUNTRY",article.get("COUNTRY"));
		if(session!= null) {
			if(session.getAttribute("userId") != null)
				modelAndView.addObject("CURRENTUSERID",session.getAttribute("userId"));
		}
		
		ArrayList<Map<String,Object>> comments = cs.getCommentListByAid(aid);
		modelAndView.addObject("comments",comments);
		return modelAndView;
	}
	@RequestMapping(value = "/load_article_update.do", method = RequestMethod.POST)
	public ModelAndView loadReviewUpdate(@RequestParam(required = true, value = "aid") long aid,HttpSession session) {
		logger.debug("review_update");

		Map<String, Object> article = as.selectArticleById(aid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("bbsPage/update");
		modelAndView.addObject("ARTICLEID",article.get("ARTICLEID"));
		modelAndView.addObject("TITLE",article.get("TITLE"));
		modelAndView.addObject("PREVIEW",article.get("PREVIEW"));
		modelAndView.addObject("CONTENT",article.get("CONTENT"));
		modelAndView.addObject("DATE",article.get("DATE"));
		modelAndView.addObject("USERID",article.get("USERID"));
		modelAndView.addObject("COUNTRY",article.get("COUNTRY"));
		modelAndView.addObject("POINTID",article.get("POINTID"));
		if(session!= null) {
			if(session.getAttribute("userId") != null)
				modelAndView.addObject("CURRENTUSERID",session.getAttribute("userId"));
		}
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value="/article_comment_create.do", method=RequestMethod.POST)
	public Map<String,Object> articleCommentCreate(@RequestBody Map<String,String> map, HttpSession session) {
		
		CommentDTO dto = new CommentDTO();
		
		dto.setContent(map.get("content"));
		dto.setArticleID(Long.parseLong(map.get("aid")));
		String uid = session.getAttribute("userId").toString();
		if(uid == null) {
			return null;
		}
		dto.setUserID(uid);
		if(cs.insertComment(dto) == 0) {
			return null;
		}
		
		long cid = dto.getCommentID();
		Map<String,Object> ret;
		ret = cs.getCommentById(cid);
		Date date = (Date) ret.get("DATE");
		logger.debug(date.toString());
		ret.put("DATE", date.toString());
		return ret;
	}
	
	@ResponseBody
	@RequestMapping(value="/article_delete.do", method=RequestMethod.POST)
	public Map<String,Object> deleteArticle(@RequestBody Map<String,String> map, HttpSession session) {
		long articleID = Long.parseLong(map.get("aid"));
		logger.debug("" + articleID);
		
		String uid = session.getAttribute("userId").toString();
		if(uid == null)
			return null;
		
		int code = as.deleteArticle(articleID,uid);
		if(code != 1)
			return null;
		
		
		Map<String,Object> ret = new HashMap<String, Object>();
		ret.put("code", code);
		return ret;
		
	}
	@ResponseBody
	@RequestMapping(value="/article_comment_delete.do", method=RequestMethod.POST)
	public Map<String,Object> deleteComment(@RequestBody Map<String,String> map, HttpSession session) {
		long commentID = Long.parseLong(map.get("cid"));
		logger.debug("" + commentID);
		
		String uid = session.getAttribute("userId").toString();
		if(uid == null)
			return null;
		
		int code = cs.deleteArticleComment(commentID,uid);
		if(code != 1)
			return null;
		
		
		Map<String,Object> ret = new HashMap<String, Object>();
		ret.put("code", code);
		return ret;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/article_update.do", method=RequestMethod.POST)
	public Map<String,Object> reviewUpdate(@RequestBody Map<String,String> map, HttpSession session) {
		
		Map<String,Object> ret = new HashMap<String, Object>();
		ArticleDTO dto = new ArticleDTO();
		
		dto.setTitle(map.get("title"));
		dto.setContent(map.get("content"));
		dto.setArticleID(Long.parseLong(map.get("aid")));
		String uid = session.getAttribute("userId").toString();
		dto.setUserID(uid);
		long code = as.updateArticle(dto);
		ret.put("code", code);
		if(code != 1) {
			return null;
		}
		
		return ret;	
	}

}
