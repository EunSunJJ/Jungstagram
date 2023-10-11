<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jungstagram</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>

<body>
	<div id="wrap">
			<c:import url="/WEB-INF/jsp/include/header.jsp"  />
		
			<c:import url="/WEB-INF/jsp/include/nav.jsp"  />

			
			<section class="list-box">
				<div>
					<c:forEach var="post" items="${postList}">
					<div class="d-flex justify-content-end">
						<div class="bor">
							<div>${post.profilePath} +  ${post.nickname}</div>
							
							<div class="post-image-box d-flex justify-content-center">
								<img id="post-image" src="${post.imagePath}">
							</div>
							
							<div class="d-flex justify-content-between">
								<c:choose>
									<c:when test="${post.like}">
									<i class="bi bi-heart-fill bi-5 text-danger"></i>
									</c:when>
								
									<c:otherwise>
									<i class="bi bi-heart bi-5 like-icon" data-post-id="${post.id}"></i>
									</c:otherwise>
								</c:choose>
								
								<i class="bi bi-bookmark-star"></i>
								
							</div>
							
							<div>
								<div class="font-weight-bold">좋아요 ${post.likeCount}개</div>
								<div class="mb-3">${post.nickname} - ${post.content}</div>
								
									<c:forEach var="comment" items="${post.commentDetailList}">
										<div><b>${comment.nickname}</b> ${comment.comment}</div>
									</c:forEach>
									
								<div><a href="/post/comment-view">댓글 모두 보기</a></div>
								
								<div class="d-flex">
									<i class="bi bi-emoji-smile"></i>
									<input type="text" placeholder="댓글달기" class="form-control" id="commentInput${post.id}">
									<button type="button" class="btn btn-outline-dark comment-btn" data-post-id="${post.id}">게시</button>
								</div>	
								
							</div>
						</div>	
					</div>
					<hr width="75%" align="right">	
				</c:forEach>
				</div>
			</section>
						
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	<!-- 댓글작성 기능 -->
	$(".comment-btn").on("click", function(){
		// alert("댓글작성하기");
		let postId = $(this).data("post-id");
		let comment = $("#commentInput" + postId).val();
				
		// alert(comment);
		
		$.ajax({
			type:"post"
			, url:"/post/comment/create"
			, data:{"postId":postId, "comment":comment}
			, success:function(data){
				
				if(data.result == "success") {
					location.reload();
				} else {
					alert("댓글 작성 실패");
				}
			}
			, error:function(){
				alert("댓글 작성 에러");
			}
		});
		
	});
	<!-- 좋아요 기능 -->
	$(".like-icon").on("click", function(){
		// alert("좋아요");
		let postId = $(this).data("post-id");
		
		$.ajax({
			type:"post"
			, url:"/post/like"
			, data:{"postId":postId}
			, success:function(data){
				if(data.result == "success") {
					location.reload();
				} else {
				alert("좋아요 실패");
				}
			}
			, error:function(){
				alert("좋아요 에러");
			}
		});
	});
});
</script>
</body>
</html>