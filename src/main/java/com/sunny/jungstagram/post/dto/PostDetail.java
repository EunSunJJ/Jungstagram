package com.sunny.jungstagram.post.dto;

import java.util.List;

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
	//private List<Comment> commentList;
	// comment -> commentDtail로 가면 된다 - 찾아보세요
	
}
