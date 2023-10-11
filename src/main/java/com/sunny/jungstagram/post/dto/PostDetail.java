package com.sunny.jungstagram.post.dto;

import java.util.List;

import com.sunny.jungstagram.comment.domain.Comment;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class PostDetail {

	//  post table의 아이디값은 유용해서 무조건
	
	private int id;
	private int userId;
	private String nickname;
	private String profilePath;
	private String content;
	private String imagePath;
	private int likeCount;
	private boolean isLike;
	private List<CommentDetail> commentDetailList;
	
}
