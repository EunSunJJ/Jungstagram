package com.sunny.jungstagram.bookmark;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.jungstagram.bookmark.service.BookmarkService;

@RestController
public class BookmarkRestController {

	@Autowired
	private BookmarkService bookmarkService;
	
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
