package com.sunny.jungstagram.bookmark.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.jungstagram.bookmark.repository.BookmarkRepository;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkRepository bookmarkRepository;
	
	public int addBookmark(int userId, int postId) {
		
		return bookmarkRepository.insertBookmark(userId, postId);
	
	}
}
