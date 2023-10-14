package com.sunny.jungstagram.comment.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sunny.jungstagram.comment.domain.Comment;

@Repository
public interface CommentRepository {

	// 댓글 삭제하기
	public int deleteCommentByPostId(@Param("postId") int postId);
	
	// 댓글 전체보기
	public List<Comment> selectAllCommentList(
			@Param("postId") int postId);
	
	// timeline에 게시글 마다 달린 댓글 가져오기
	public List<Comment> selectCommentList(
			@Param("postId") int postId);
	
	// 댓글 저장
	public int insertComment(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("comment") String comment);
}
