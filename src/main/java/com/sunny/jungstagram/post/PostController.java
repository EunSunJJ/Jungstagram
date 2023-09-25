package com.sunny.jungstagram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// view
@RequestMapping("/post")
@Controller
public class PostController {
	
	
	// 새 게시물 만들기
	@GetMapping("/create-view")
	public String postInput() {
		return "/post/input";
	}
}