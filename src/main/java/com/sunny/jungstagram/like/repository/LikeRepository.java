package com.sunny.jungstagram.like.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeRepository {

	public int insertLike(
			@Param("userId") int userId
			,@Param("postId") int postId);
}
