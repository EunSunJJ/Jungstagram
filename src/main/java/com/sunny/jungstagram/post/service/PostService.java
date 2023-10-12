package com.sunny.jungstagram.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.jungstagram.comment.domain.Comment;
import com.sunny.jungstagram.comment.service.CommentService;
import com.sunny.jungstagram.common.FileManager;
import com.sunny.jungstagram.like.service.LikeService;
import com.sunny.jungstagram.post.domain.Post;
import com.sunny.jungstagram.post.dto.CommentDetail;
import com.sunny.jungstagram.post.dto.PostDetail;
import com.sunny.jungstagram.post.repository.PostRepository;
import com.sunny.jungstagram.user.domain.User;
import com.sunny.jungstagram.user.service.UserService;

@Service
public class PostService {

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	// 게시물 삭제하기
	public int deletePost(int postId) {
		
		// postId기반으로 게시글 정보 얻어오기
		Post post =  postRepository.selectPost(postId);
		
		// 이미지도 같이 삭제하기
		FileManager.removeFiles(post.getImagePath());
		
		return postRepository.deletePost(postId); 
	}
	
	// 타임라인 만들기
	public List<PostDetail> getPostList(int loginUserId) {
		
		List<Post> postList = postRepository.selectPostList();
		// 모든 게시물의 정보 = postList
		// 반복문을 수행해서 userId를 기반으로 사용자 정보를 조회해온다
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post: postList) {
			
			int userId = post.getUserId();
			User user= userService.getUserById(userId);
			
			// 좋아요 개수 조회 -> 특정 게시글에 해당하는 좋아요 개수
			int likeCount =likeService.countLike(post.getId());
			
			// 좋아요를 눌렀는지 안눌렀는지
			boolean countClickLike = likeService.isLike(post.getId(), loginUserId);
			
			// 게시글 마다 달린 댓글 가져오기 -> 게시글 아이디로 조회해오기
			List<CommentDetail> commentDetailList = commentService.getCommentList(post.getId());
			
			// 책갈피 눌렀는지 안눌렀는지
			
			PostDetail postDetail = PostDetail.builder()
									.id(post.getId())
									.userId(userId)
									.content(post.getContent())
									.imagePath(post.getImagePath())
									.nickname(user.getNickname())
									.profilePath(user.getProfilePath())
									.likeCount(likeCount)
									.isLike(countClickLike)
									.commentDetailList(commentDetailList)
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
