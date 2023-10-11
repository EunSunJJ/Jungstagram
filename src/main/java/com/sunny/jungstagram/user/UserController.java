package com.sunny.jungstagram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunny.jungstagram.user.service.UserService;

// View 페이지를 위한 Controller
@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	// 아이디 찾기
	@GetMapping("/find/loginId-view")
	public String findLoginId(Model model) {
		
		
		return "user/loginId";
	}
	
	
	// 비밀번호 재설정
	@GetMapping("/password-view")
	public String resetPassword() {
		return "user/password";
	}
	
	
	// 내정보
	@GetMapping("/info-view")
	public String myInfo() {
		return "user/info";
	}
	
	
	// 로그아웃 기능
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userNickname");
		
		return "redirect:/user/login-view";
		
	}
	
	// 회원가입 페이지
	@GetMapping("/join-view")
	public String joinInput() {
		return "user/join";
	}
	
	// 로그인 페이지
	@GetMapping("/login-view")
	public String loginInput() {
		return "user/login";
	}
}
