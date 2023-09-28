package com.sunny.jungstagram.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.jungstagram.comment.service.CommentService;

// API
@RestController
public class CommentRestController {

	@Autowired
	private CommentService commentService;
	
	// 댓글 작성 기능
	@PostMapping("/post/comment/create")
	public Map<String, String >createComment(
			@RequestParam("postId") int postId
			, @RequestParam("content") String content
			, HttpSession session) {
		
		int userId = (Integer) session.getAttribute("userId");
		int count = commentService.addComment(userId, postId, content);
		
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
