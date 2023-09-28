package com.sunny.jungstagram.bookmark.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookmarkRepository {

	public int insertBookmark(
			@Param("userId") int userId
			, @Param("postId") int postId);
}
