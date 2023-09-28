package com.sunny.jungstagram.post.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class PostDetail {

	//  post table의 아이디값은 유용해서 무조건
	
	private int id;
	private int userId;
	private String loginId;
	private String content;
	private String imagePath;
	
}
