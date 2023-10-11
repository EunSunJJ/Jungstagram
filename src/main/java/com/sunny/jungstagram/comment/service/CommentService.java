package com.sunny.jungstagram.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.jungstagram.comment.domain.Comment;
import com.sunny.jungstagram.comment.repository.CommentRepository;
import com.sunny.jungstagram.post.dto.CommentDetail;
import com.sunny.jungstagram.user.domain.User;
import com.sunny.jungstagram.user.service.UserService;

@Service
public class CommentService {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CommentRepository commentRepository;
	
	// timeline에 게시글 마다 달린 댓글 가져오기
	public List<CommentDetail> getCommentList(int postId){
		
		// 댓글창에서 가져올 정보
		List<Comment> commentList = commentRepository.selectCommentList(postId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		for (Comment comment: commentList) {
			int userId = comment.getUserId();
			User user = userService.getUserById(userId);
			
			CommentDetail commentDetail = CommentDetail.builder()
											.id(comment.getId())
											.comment(comment.getComment())
											.nickname(user.getNickname())
											.build();
			commentDetailList.add(commentDetail);
		}
		return commentDetailList;
	}
	
	// 댓글 저장
	public int addComment(int userId, int postId, String comment) {
		
		return commentRepository.insertComment(userId, postId, comment);
	}
}
