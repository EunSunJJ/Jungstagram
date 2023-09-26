package com.sunny.jungstagram.post.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public interface PostRepository {
	
	// 새 게시물 만들기
	public int insertPost(
			@Param("userId") int userId
			,@Param("content") String content
			, @Param("location") String location
			, @Param("openScope") String openScope
			, @Param("imagePath") String imagePath);
}
