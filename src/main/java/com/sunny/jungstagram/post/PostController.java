package com.sunny.jungstagram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunny.jungstagram.post.dto.PostDetail;
import com.sunny.jungstagram.post.service.PostService;
import com.sunny.jungstagram.user.domain.User;
import com.sunny.jungstagram.user.service.UserService;

// view
@RequestMapping("/post")
@Controller
public class PostController {
	
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private UserService userService;
	
	// 타임라인 보기
	@GetMapping("/timeline-view")
	public String postList(Model model) {
		List<PostDetail> postList = postService.getPostList();
		model.addAttribute("postList" , postList);
		
		return "post/timeline";
	}
	
	// 새 게시물 만들기
	@GetMapping("/create-view")
	public String postInput(Model model) {
		
		return "post/input";
	}
}
