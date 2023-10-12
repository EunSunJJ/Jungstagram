package com.sunny.jungstagram.bookmark;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// view
@Controller
public class BookmarkController {
	
	// 모든 책갈피 모음
	@GetMapping("/bookmark-list-view")
	public String bookmarkList() {
		return "post/bookmarkList";
	}
}
