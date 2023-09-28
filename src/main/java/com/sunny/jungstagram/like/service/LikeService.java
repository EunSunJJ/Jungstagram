package com.sunny.jungstagram.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.jungstagram.like.repository.LikeRepository;

@Service
public class LikeService {

	@Autowired
	private LikeRepository likeRepository;
	
	public int addLike(int userId, int postId) {
		
		return likeRepository.insertLike(userId, postId);

	}
}
