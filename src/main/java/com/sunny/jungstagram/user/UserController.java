package com.sunny.jungstagram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// View 페이지를 위한 Controller
@RequestMapping("/user")
@Controller
public class UserController {

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
