<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 전체보기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	<section>
		<div class="d-flex justify-content-center">
			<!-- 작성한 게시물 -->
			<div class="mb-3">
				<div>작성자 nickname</div>
				<img class="comment-post" src="/static/img/cat-551554_640.jpg" alt="샘플">
				<div>고양이 귀엽지?</div>
			</div>
			
			<div>
				<div class="mt-3"> 
					<span><strong>댓글 전체보기</strong></span>
					<table class="table text-center">
						<tbody>
						<c:forEach var="comment" items="${commentList}">
							<tr>
								<td>${comment.userId}</td>
								<td>${comment.comment}</td>							
							</tr>
						</c:forEach>	
						</tbody>
					</table>				
				</div>
				
				<hr>
				
				<div class="mb-2"><!-- 댓글모두보기 아래 -->
					<i class="bi bi-heart bi-5 like-icon"></i> 
					<span class="ml-2"> 좋아요갯수 표시</span>
				</div>
				<!-- 댓글 달기 -->
				<div class="d-flex">
					<i class="bi bi-emoji-smile"></i>
					<input type="text" placeholder="댓글달기" class="form-control">
					<button type="button" class="btn btn-outline-dark comment-btn">게시</button>
				</div>				
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>