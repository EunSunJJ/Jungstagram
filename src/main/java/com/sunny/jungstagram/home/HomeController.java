package com.sunny.jungstagram.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	// 메인 홈 화면
	@GetMapping("/home-view")
	public String homeView() {
		return "home/main";
	}
}

