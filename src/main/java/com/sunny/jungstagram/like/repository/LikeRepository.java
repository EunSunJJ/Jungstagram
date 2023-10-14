package com.sunny.jungstagram.like.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeRepository {

	// 좋아요 취소하기
	public int deleteLikeByPostIdAndUserId(
			@Param("userId") int userId
			,@Param("postId") int postId);
	
	// 좋아요 삭제하기
	public int deleteLikeByPostId(@Param("postId") int postId);
	
	// 좋아요를 했는지 안했는지
	public int selectCountLikeByUserId(
			@Param("postId") int postId
			, @Param("userId") int userId); 
	
	// 좋아요 갯수 조회
	public int selectCountLike(
			@Param("postId") int postId);
	
	// 좋아요 클릭하면 정보저장
	public int insertLike(
			@Param("userId") int userId
			,@Param("postId") int postId);
}
