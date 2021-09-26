package com.web.travel;

import java.util.Date;

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
import com.web.travel.dto.auth_passwordTO;
import com.web.travel.modelDAO.MailSender;
import com.web.travel.modelDAO.SecurityConfig;

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
		
		SecurityConfig enc = new SecurityConfig();
		
		String userId = request.getParameter("id");
		String password = enc.encryptionMain(request.getParameter("password"));
			
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

		SecurityConfig enc = new SecurityConfig();
		
		String userId = request.getParameter("userId");
		String password = enc.encryptionMain(request.getParameter("password"));
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
	
	// 비밀번호 분실 초기화면
	@RequestMapping(value = "/forgot_id.action")
	public String forgotIdRequest() {

		return "account/forgot_id";
	}
	
	// 비밀번호 찾기 초기화면
	@RequestMapping(value = "/forgot_password.action")
	public String forgotPasswordRequest() {

		return "account/forgot_password";
	}
	
	// 아이디 찾기 버튼 클릭한 경우
	@RequestMapping(value = "/findId.action")
	public ModelAndView findIdRequest(HttpServletRequest request) {

		accountDTO to = new accountDTO();

		String email = request.getParameter("email");
		to.setEmail(email);

		int sqlOK = 0;
		String id = sqlSession.selectOne("findIdSelect", to);
		if(id != null) {
			sqlOK = 1;
		}

		request.setAttribute("sqlOK", sqlOK);
		request.setAttribute("id", id);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("account/JSON/findid_json");
		modelAndView.addObject("list", request);

		return modelAndView;
	}
	
	// 인증번호 발송 버튼을 클릭한 경우
	@RequestMapping(value = "/sendNumber.action")
	public ModelAndView sendNumberRequest(HttpServletRequest request) {

		accountDTO to = new accountDTO();
		auth_passwordTO ato = new auth_passwordTO();
		SecurityConfig enc = new SecurityConfig();
		MailSender ms = new MailSender();

		String email = request.getParameter("email");
		String id = request.getParameter("id");
		to.setUserId(id);
		to.setEmail(email);
		ato.setEmail(email);

		int sqlOK = 0;
		String result = "";
		String authNumber = "";

		// id와 email 일치 시 이메일 인증번호 생성
		if(sqlSession.selectOne("sendNumberSelect", to) != null) {
			sqlOK = 1;
			for( int i = 0; i < 6; i ++) {
				result += String.valueOf((int)((Math.random()*10000)%10));
			}
			authNumber = enc.encryptionMain(result);			

			ato.setAuthKey(authNumber);

			// 이메일 인증 번호 테이블 중복 검사
			int count = 0;
			while(count == 0) {
				if(sqlSession.selectOne("duplicateAuth_KeySelect", ato) == null) {
					count = 1;
				} else {
					for( int i = 0; i < 6; i ++) {
						result += String.valueOf((int)((Math.random()*10000)%10));
					}
					authNumber = enc.encryptionMain(result);

					ato.setAuthKey(authNumber);
				}
			}
			// 현재 시각 생성
			Date date = new Date(System.currentTimeMillis());
			ato.setGenerateDate(date);
			// 중복된 이메일이 있는지 검사하고 인증번호 데이터 베이스 삽입
			if(sqlSession.selectOne("duplicateEmailSelect", ato) != null) {
				sqlSession.delete("duplicateEmailDelete", ato);
				sqlSession.insert("auth_KeyInsert", ato);
			} else {
				sqlSession.insert("auth_KeyInsert", ato);				
			}
			// 1시간이 지난 인증번호 삭제
			ms.sendMailMain(to.getEmail(), ato.getAuthKey());
		}

		request.setAttribute("sqlOK", sqlOK);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/JSON/sqlOK_json");
		modelAndView.addObject("list", request);

		return modelAndView;
	}
	
	// 인증번호 입력 확인 버튼을 누른 경우
	@RequestMapping(value = "/checkAuthKey.action")
	public ModelAndView checkAuthKeyRequest(HttpServletRequest request) {
		// 1시간이 지난 인증번호 삭제
		sqlSession.delete("auth_KeyDelete");

		auth_passwordTO ato = new auth_passwordTO();

		ato.setAuthKey(request.getParameter("number"));

		int sqlOK = 0;
		String email = sqlSession.selectOne("authKeySelect", ato);
		if(email != null) {
			sqlOK = 1;
		}

		request.setAttribute("sqlOK", sqlOK);
		request.setAttribute("email", email);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/JSON/sqlOK_json");
		modelAndView.addObject("list", request);

		return modelAndView;
	}

	// 비밀번호 변경 확인 버튼 클릭 시
	@RequestMapping(value = "/changePassword.action")
	public ModelAndView changePasswordRequest(HttpServletRequest request) {

		accountDTO to = new accountDTO();
		SecurityConfig enc = new SecurityConfig();

		String password = enc.encryptionMain(request.getParameter("password")); 
		String email = request.getParameter("email");
		
		to.setEmail(email);
		to.setHashedPassword(password);

		int sqlOK = 0;
		int update = sqlSession.update("userPasswordUpdate", to);
		if(update == 1) {
			sqlOK = update;
			sqlSession.update("userPasswordUpdate", to);
		}

		request.setAttribute("sqlOK", sqlOK);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/JSON/sqlOK_json");
		modelAndView.addObject("list", request);

		return modelAndView;
	}
	
	// 비밀번호 초기화면  
	@RequestMapping(value = "/change_password.action")
	public String change_PasswordRequest() {

		return "account/change_password";
	}
}
