package com.sunny.jungstagram.comment.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class CommentDto {

	// 댓글전체보기 페이지에 필요한 데이터모음
	private int id;
	private String comment;

	private int userId;
	private int postId;

}
