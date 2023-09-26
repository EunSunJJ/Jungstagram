package com.sunny.jungstagram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.jungstagram.post.service.PostService;

// API
@RequestMapping("/post")
@RestController
public class PostRestController {

	@Autowired
	private PostService postService;

	// 새 게시물 만들기
	@PostMapping("/create")
	public Map<String, String> createPost(
			@RequestParam("content") String content
			, @RequestParam(value = "location", required = false) String location
			, @RequestParam("openScope") String openScope
			, @RequestParam(value = "imageFile", required = false) MultipartFile imageFile
			, HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		int userId = (Integer) session.getAttribute("userId");

		int count = postService.addPost(userId, content, location, openScope, imageFile);

		// response
		Map<String, String> resultMap = new HashMap<>();
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");

		}
		
		return resultMap;
	}
}
