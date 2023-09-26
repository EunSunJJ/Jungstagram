package com.sunny.jungstagram.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.jungstagram.common.FileManager;
import com.sunny.jungstagram.post.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	// 새 게시물 만들기
	public int addPost(int userId, String content, String location, String openScope, MultipartFile imageFile) {
		
		String imagePath = FileManager.saveFile(userId, imageFile);
		
		return postRepository.insertPost(userId, content, location, openScope, imagePath);
	}
}
