package com.sunny.jungstagram.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sunny.jungstagram.post.domain.Post;
import com.sunny.jungstagram.user.domain.User;

@Repository
public interface PostRepository {
	
	// id를 기반으로 게시글의 정보를 얻어오기
	public Post selectPost(
			@Param("id") int id);
	
	// 게시물 삭제하기
	public int deletePost(int postId);
	
	// timeline 조회
	public List<Post> selectPostList();
	
	// 새 게시물 만들기
	public int insertPost(
			@Param("userId") int userId
			,@Param("content") String content
			, @Param("location") String location
			, @Param("openScope") String openScope
			, @Param("imagePath") String imagePath);
}
