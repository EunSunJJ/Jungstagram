package com.sunny.jungstagram.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.jungstagram.common.FileManager;
import com.sunny.jungstagram.post.domain.Post;
import com.sunny.jungstagram.post.dto.PostDetail;
import com.sunny.jungstagram.post.repository.PostRepository;
import com.sunny.jungstagram.user.domain.User;
import com.sunny.jungstagram.user.service.UserService;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	
	// 타임라인 만들기
	public List<PostDetail> getPostList() {
		
		List<Post> postList = postRepository.selectPostList();
		// 모든 게시물의 정보 = postList
		// 반복문을 수행해서 userId를 기반으로 사용자 정보를 조회해온다
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post: postList) {
			
			int userId = post.getUserId();
			User user= userService.getUserById(userId);
			
			PostDetail postDetail = PostDetail.builder()
									.id(post.getId())
									.userId(userId)
									.content(post.getContent())
									.imagePath(post.getImagePath())
									.loginId(user.getLoginId())
									.build();
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList; 
	}
	
	
	// 새 게시물 만들기
	public int addPost(int userId, String content, String location, String openScope, MultipartFile imageFile) {
		
		String imagePath = FileManager.saveFile(userId, imageFile);
		
		return postRepository.insertPost(userId, content, location, openScope, imagePath);
	}
}
