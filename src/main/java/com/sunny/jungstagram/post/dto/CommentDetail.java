package com.sunny.jungstagram.post.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CommentDetail {

	private int id;	
	private int userId; // 당장 필요하지 않아도 넣는걸 추천!
	private String comment;
	private String nickname;
}
