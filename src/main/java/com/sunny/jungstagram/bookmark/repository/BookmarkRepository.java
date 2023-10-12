package com.sunny.jungstagram.bookmark.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookmarkRepository {
	
	// 책갈피를 눌렀는지 안눌렀는지 갯수가 궁금해
	public int selectCountBookmark(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	// 책갈피를 클릭하면 정보저장
	public int insertBookmark(
			@Param("userId") int userId
			, @Param("postId") int postId);
}
