package com.sunny.jungstagram.bookmark;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.jungstagram.bookmark.service.BookmarkService;

// API
@RestController
public class BookmarkRestController {

	@Autowired
	private BookmarkService bookmarkService;
	
	// 책갈피 취소하기
	@DeleteMapping("/post/unbookmark")
	public Map<String, String> unbookmark(
			@RequestParam("postId") int postId
			, HttpSession session) {
		
		int userId = (Integer) session.getAttribute("userId");
		int count = bookmarkService.deleteBookmarkByPostIdAndUserId(postId, userId);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 책갈피를 클릭하면 정보저장
	@PostMapping("/post/bookmark")
	public Map<String, String> bookmark(
			@RequestParam("postId") int postId
			, HttpSession session) {
		
		int userId = (Integer) session.getAttribute("userId");
		int count = bookmarkService.addBookmark(userId, postId);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
