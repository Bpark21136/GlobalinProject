package com.web.travel;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
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

import com.web.travel.dto.ReviewDTO;
import com.web.travel.service.PointService;
import com.web.travel.service.ReviewService;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ReviewService rs;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/review_form.do", method = RequestMethod.POST)
	public String loadSideBar() {
		return "reviews/review_form";
	}
	
	@RequestMapping(value = "/review_detail.action", method = RequestMethod.GET)
	public String loadContent() {
		return "reviews/review_detail";
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