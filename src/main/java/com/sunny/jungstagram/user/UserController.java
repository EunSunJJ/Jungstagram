package com.sunny.jungstagram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// View 페이지를 위한 Controller
@RequestMapping("/user")
@Controller
public class UserController {

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
