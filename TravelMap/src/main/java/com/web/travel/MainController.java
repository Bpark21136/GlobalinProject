  package com.web.travel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.travel.dto.accountDTO;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/start.action")
	public String home(Model model,@RequestParam(value="menu",defaultValue="1") int menu, HttpSession session) {
		logger.info("log : home");
		
		String userId = (String) session.getAttribute("userId");
		
		model.addAttribute("menu", menu);
		model.addAttribute("userId", userId);
		return "start";
	}
	
	// 로그인창으로 이동
	@RequestMapping("/login.action")
	public String loginRequest() {
		return "account/login";
	}
	
	// 회원가입창으로 이동
	@RequestMapping("/register.action")
	public String registerRequest() {
		return "account/register";
	}
	
	// 메인에서 로그인 버튼을 누를 경우
	@RequestMapping(value = "/loginOK.action")
	public ModelAndView loginRequest(HttpServletRequest request, HttpSession session) {
		
		accountDTO to = new accountDTO();
		
		String userId = request.getParameter("id"); 
		// 패스워드 암호화 필요
		String password = request.getParameter("password");
			
		to.setUserId(userId);
		to.setHashedPassword(password);
		
		int sqlOK = 0;

		if(sqlSession.selectOne("loginSelect", to) != null) {
			sqlOK = 1;
			to = sqlSession.selectOne("loginSelect", to);
			
			session.setAttribute("userId", to.getUserId());
		}
		
		request.setAttribute("sqlOK", sqlOK);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/JSON/sqlOK_json");
		modelAndView.addObject("list", sqlOK);
		
		return modelAndView;
	}
	
	// 로그아웃 버튼을 누른 경우
	@RequestMapping(value = "/logout.action")
	public String logoutRequest() {
		
		return "account/logout";
	}
	
	// 회원가입 창에서 확인 버튼을 누른 경우
	@RequestMapping(value = "/sign_up.action")
	public ModelAndView sign_upRequest(HttpServletRequest request) {

		accountDTO to = new accountDTO();
		
		String userId = request.getParameter("userId"); 
		/* 패스워드 암호화 필요*/
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		
		if(country.equals("Korea, Republic of")) {
			country = "KOR";
		} else if( country.equals("Japan")) {
			country = "JPN";
		}
		
		to.setUserId(userId);;
		to.setHashedPassword(password);
		to.setEmail(email);
		to.setCountry(country);
		
		/* sql구문 실행 여부 확인용 변수*/
		int sqlOK = 0;
		
		sqlOK = sqlSession.insert("signUpInsert", to);
		
		request.setAttribute("sqlOK", sqlOK);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("account/register_ok");
		modelAndView.addObject("sqlOK",sqlOK);
		
		return modelAndView;
	}
	
	// 아이디 중복검사 버튼 클릭한 경우
	@RequestMapping(value = "/duId.action")
	public ModelAndView duplicateIdRequest(HttpServletRequest request) {

		accountDTO to = new accountDTO();
		
		to.setUserId(request.getParameter("userId"));
		
		/* sql구문 실행 여부 확인용 변수*/
		int sqlOK = 0;
		
		if(sqlSession.selectOne("duIdSelect", to) != null) {
			sqlOK = 1;
		}
		
		request.setAttribute("sqlOK", sqlOK);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/JSON/sqlOK_json");
		modelAndView.addObject("list", request);
		
		return modelAndView;
	}
	
	// 이메일 중복검사 버튼 클릭한 경우
	@RequestMapping(value = "/duEmail.action")
	public ModelAndView duplicateEmailRequest(HttpServletRequest request) {

		accountDTO to = new accountDTO();
		
		String email = request.getParameter("email");
		
		to.setEmail(email);
		
		/* sql구문 실행 여부 확인용 변수*/
		int sqlOK = 0;
		
		if(sqlSession.selectOne("duEmailSelect", to) != null) {
			sqlOK = 1;
		}
		
		request.setAttribute("sqlOK", sqlOK);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/JSON/sqlOK_json");
		modelAndView.addObject("list", request);
		
		return modelAndView;
	}
}
