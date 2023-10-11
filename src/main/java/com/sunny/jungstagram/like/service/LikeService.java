package com.sunny.jungstagram.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.jungstagram.like.repository.LikeRepository;

@Service
public class LikeService {

	@Autowired
	private LikeRepository likeRepository;
	
	// 좋아요를 했는지 안했는지
	public boolean isLike (int postId, int userId) {
		int count = likeRepository.selectCountLikeByUserId(postId, userId);
//		if (count == 0) {
//			return false;
//		} else {
//			return true;
//		}
		
		return count != 0;
	}
	
	// 좋아요 갯수 조회
	public int countLike(int postId) {
		return likeRepository.selectCountLike(postId);
	}
	
	// 좋아요 클릭하면 정보저장
	public int addLike(int userId, int postId) {
		return likeRepository.insertLike(userId, postId);

	}
}
