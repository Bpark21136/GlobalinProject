package com.web.travel;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.travel.dto.CommentDTO;
import com.web.travel.dto.ReviewDTO;
import com.web.travel.service.CommentService;
import com.web.travel.service.PointService;
import com.web.travel.service.ReviewService;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ReviewService rs;
	
	@Autowired
	CommentService cs;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/review_form.do", method = RequestMethod.POST)
	public String loadSideBar() {
		return "reviews/review_form";
	}
	
	@RequestMapping(value = "/review_detail.action", method = RequestMethod.POST)
	public ModelAndView loadContent(@RequestParam(required = true, value = "rid") long rid,HttpSession session) {
		logger.debug("review_detail");

		Map<String, Object> review = rs.selectReviewById(rid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("reviews/review_detail");
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
	
	@RequestMapping(value = "/load_review_update.do", method = RequestMethod.POST)
	public ModelAndView loadReviewUpdate(@RequestParam(required = true, value = "rid") long rid,HttpSession session) {
		logger.debug("review_update");

		Map<String, Object> review = rs.selectReviewById(rid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("reviews/review_update");
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
	
	@ResponseBody
	@RequestMapping(value="/review_delete.do", method=RequestMethod.POST)
	public Map<String,Object> deleteReview(@RequestBody Map<String,String> map, HttpSession session) {
		long reviewID = Long.parseLong(map.get("rid"));
		logger.debug("" + reviewID);
		
		String uid = session.getAttribute("userId").toString();
		if(uid == null)
			return null;
		
		int code = rs.deleteReview(reviewID,uid);
		if(code != 1)
			return null;
		
		
		Map<String,Object> ret = new HashMap<String, Object>();
		ret.put("code", code);
		return ret;
		
	}
	@ResponseBody
	@RequestMapping(value="/comment_delete.do", method=RequestMethod.POST)
	public Map<String,Object> deleteComment(@RequestBody Map<String,String> map, HttpSession session) {
		long commentID = Long.parseLong(map.get("cid"));
		logger.debug("" + commentID);
		
		String uid = session.getAttribute("userId").toString();
		if(uid == null)
			return null;
		
		int code = cs.deleteReviewComment(commentID,uid);
		if(code != 1)
			return null;
		
		
		Map<String,Object> ret = new HashMap<String, Object>();
		ret.put("code", code);
		return ret;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/review_create.do", method=RequestMethod.POST)
	public Map<String,Object> reviewCreate(@RequestBody Map<String,String> map, HttpSession session) {
		
		Map<String,Object> ret = new HashMap<String, Object>();
		ReviewDTO dto = new ReviewDTO();
		
		dto.setTitle(map.get("title"));
		dto.setPreview(map.get("preview"));
		dto.setContent(map.get("content"));
		dto.setPointID(Long.parseLong(map.get("pid")));
		String uid = session.getAttribute("userId").toString();
		dto.setUserID(uid);
		long id = rs.insertReview(dto);
		ret.put("id", id);
		
		return ret;	
	}
	
	@ResponseBody
	@RequestMapping(value="/review_update.do", method=RequestMethod.POST)
	public Map<String,Object> reviewUpdate(@RequestBody Map<String,String> map, HttpSession session) {
		
		Map<String,Object> ret = new HashMap<String, Object>();
		ReviewDTO dto = new ReviewDTO();
		
		dto.setTitle(map.get("title"));
		dto.setPreview(map.get("preview"));
		dto.setContent(map.get("content"));
		dto.setReviewID(Long.parseLong(map.get("rid")));
		String uid = session.getAttribute("userId").toString();
		dto.setUserID(uid);
		long code = rs.updateReview(dto);
		ret.put("code", code);
		if(code != 1) {
			return null;
		}
		
		return ret;	
	}
	
	@ResponseBody
	@RequestMapping(value="/comment_create.do", method=RequestMethod.POST)
	public Map<String,Object> commentCreate(@RequestBody Map<String,String> map, HttpSession session) {
		
		CommentDTO dto = new CommentDTO();
		
		dto.setContent(map.get("content"));
		dto.setReviewID(Long.parseLong(map.get("rid")));
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
	@RequestMapping(value="/get_reviews.action", method=RequestMethod.POST)
	public Map<String,Object> getReviewList(@RequestBody Map<String,String> map) {
		int page = Integer.parseInt(map.get("page"));		
		long pid = Long.parseLong(map.get("pid"));
		
		Map<String,Object> ret = rs.getReviewList(pid,page);
		
			Set<String> keyset = ((Map<String,Object>) ((List)ret.get("reviews")).get(0)).keySet();
			for(String x : keyset) {
				logger.debug("key : " + x);
			}
			logger.debug(ret.get("maxPage").toString());
		return ret;	
	}
	
	
	@ResponseBody
	@RequestMapping(value="/upload_image.do", method=RequestMethod.POST)
	public void imgUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		UUID uuid = UUID.randomUUID();
	
		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;
	
		//System.out.println("원본 파일명 : " + org_filename);
		//System.out.println("저장할 파일명 : " + str_filename);
	
		logger.debug(""+file.getSize());
		String filepath = "resources/review_img/" + str_filename;
		//System.out.println("파일경로 : " + filepath);

		String serverFliePath = request.getSession().getServletContext().getRealPath("/resources/review_img/")+ str_filename;
		logger.debug(serverFliePath);
		File f = new File(serverFliePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		file.transferTo(f);
		out.println(filepath);
		out.close();
	}
}