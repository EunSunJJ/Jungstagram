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
						<div>
							<div class="d-flex justify-content-between mb-2">
								<div>${post.profilePath}<strong>${post.nickname}</strong></div>
								<i class="bi bi-arrow-clockwise" id="modifyBtn" data-post-id="${post.id}"></i>
								
								<%-- 로그인한 사용자의 게시글에만 more-btn 노출 --%>
								<c:if test="${post.userId eq userId}">
								<i class="bi bi-three-dots-vertical more-btn" data-post-id="${post.id}" data-toggle="modal" data-target="#moreModal"></i>
								</c:if>
								<!-- <i class="bi bi-trash3" id="deleteBtn" data-post-id="${post.id}"></i> -->
							</div>
							
							<div class="post-image-box d-flex justify-content-center">
								<img id="post-image" src="${post.imagePath}">
							</div>
							
							<div class="d-flex justify-content-between">
								<!-- 좋아요 아이콘  -->
								<c:choose>
									<c:when test="${post.like}">
										<i class="bi bi-heart-fill bi-5 text-danger unlike-icon" data-post-id="${post.id}"></i>
									</c:when>
								
									<c:otherwise>
										<i class="bi bi-heart bi-5 like-icon" data-post-id="${post.id}"></i>
									</c:otherwise>
								</c:choose>
								
								<!-- 책갈피 아아콘 -->
								<c:choose>
									<c:when test="${post.bookmark}">
										<i class="bi bi-bookmark-star-fill unbookmark-icon" data-post-id="${post.id}"></i>
									</c:when>
				
									<c:otherwise>
										<i class="bi bi-bookmark-star bookmark-icon" data-post-id="${post.id}"></i>
									</c:otherwise>
								</c:choose>
								
							</div>
							
							<div>
								<div class="font-weight-bold">좋아요 ${post.likeCount}개</div>
								<div class="mb-3">${post.nickname} - ${post.content}</div>
								
									<c:forEach var="comment" items="${post.commentDetailList}">
										<div><b>${comment.nickname}</b> ${comment.comment}</div>
									</c:forEach>
									
								<div><a href="/post/comment-view?id=${post.id}">댓글 모두 보기</a></div>
								
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
			
			<!-- Modal -->
			<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">

			      <div class="modal-body">
			       <a href="#" id="modalDeleteBtn">삭제하기</a>
			      </div>
			      
			      <div class="modal-body">
			      <a href="#" id="modalModifyBtn">수정하기</a>
			      </div>

			    </div>
			  </div>
			</div>
	</div>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	
	<!-- 책갈피 취소하기 -->
	$(".unbookmark-icon").on("click", function(){
		let postId = $(this).data("post-id");
		
		$.ajax({
			type:"delete"
			, url:"/post/unbookmark"
			, data:{"postId":postId}
			, success:function(data){
				if(data.result == "success"){
					location.reload();
				} else {
					alert("책갈피 취소 실패");
				}
			}
			, error:function(){
				alert("책갈피 취소 에러");
			}
		});
	});
	
	<!-- 좋아요 취소하기 -->
	$(".unlike-icon").on("click", function(){
		let postId = $(this).data("post-id");
		
		$.ajax({
			type:"delete"
			, url:"/post/unlike"
			, data:{"postId":postId}
			, success:function(data){
				if(data.result == "success"){
					location.reload();
				} else {
					alert("좋아요 실패");
				}
			}
			, error:function(){
				alert("좋아요 취소 에러");
			}
			
		});
	});
	
	<!-- 게시물 수정하기-->
	$("#modifyBtn").on("click", function(){
		alert("수정하는 곳으로 이동");
		
		let postId = $(this).data("post-id");
		location.href="/post/modify-view";
	});
	
	<!-- 책갈피 기능 -->
	$(".bookmark-icon").on("click", function(){
		// alert("책갈피");
		let postId = $(this).data("post-id");
		// alert(postId);
		
		$.ajax({
			type:"post"
			, url:"/post/bookmark"
			, data:{"postId":postId}
			, success:function(data){
				if(data.result == "success"){
					location.reload();
				} else {
					alert("책갈피에 저장 실패");
				}
			}
			, errer:function(){
				alert("책갈피 저장 에러");
			}
		});
	});
	
	<!-- 게시물 삭제하기 -->
	// postId 가져오기
	$(".more-btn").on("click", function(){
		// 모달에 있는 삭제하기 링크 태그에 postId를 data 속성에 추가한다
		// data-post-id
		let postId = $(this).data("post-id");
		
		$("#modalDeleteBtn").data("post-id", postId);
		
	});
	
	// 삭제버튼 클릭이벤트
	$("#modalDeleteBtn").on("click", function(){
		
		let postId = $(this).data("post-id");
		
		$.ajax({
			type:"delete"
			, url:"/post/delete"
			, data:{"postId":postId}
			, success:function(data){
				if(data.result == "success"){
					alert("게시물 삭제 성공");
					location.reload();
				} else {
					alert("게시물 삭제 실패");
				}
			}
			, error:function(){
				alert("게시물 삭제 에러");
			}
			
		});
	});

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