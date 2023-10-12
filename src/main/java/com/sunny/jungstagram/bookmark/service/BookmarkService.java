package com.sunny.jungstagram.bookmark.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.jungstagram.bookmark.repository.BookmarkRepository;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkRepository bookmarkRepository;
	
	// 책갈피를 눌렀는지 안눌렀는지
	public boolean isBookmark(int postId, int userId) {
		int count = bookmarkRepository.selectCountBookmark(postId, userId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// 책갈피를 클릭하면 정보저장
	public int addBookmark(int userId, int postId) {
		return bookmarkRepository.insertBookmark(userId, postId);
	
	}
}
