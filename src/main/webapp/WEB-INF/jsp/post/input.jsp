<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 게시물 만들기 • Jungstagram</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>

<body>
	<div id="wrap">
			<c:import url="/WEB-INF/jsp/include/header.jsp"  />
		
			<c:import url="/WEB-INF/jsp/include/nav.jsp"  />

			
			<section class="contents">
				<div class="mb-4 d-flex justify-content-between">
					<h2 class="ml-4"> 새 게시물 만들기</h2>
					<button type="button" class="btn btn-secondary mr-4" id="postBtn">게시하기</button>
				</div>
				<div class="d-flex justify-content-center align-items-center">
					<div class="image"><input type="file" id="imageInput"></div>
					<div class="input-box">
						 user프로필 사진 + userId자리
						<textarea class="form-control my-4" rows="8" id="contentInput" placeholder="사진에 대한 설명"></textarea>
						
						<div class="d-flex my-4">
							<img src="/static/img/location.png">
							<input type="text" class="form-control" placeholder="위치를 추가하세요" id="locationInput">
						</div>	
						
						<select name="scope" class="form-control" id="scopeInput">
							<option value="entire">전체공개</option>
							<option value="friend">친구공개</option>
							<option value="private">비공개</option>
						</select>
					</div>
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
	$("#postBtn").on("click",function(){
		
		let image = $("#imageInput")[0];
		let content = $("#contentInput").val();
		let location = $("#locationInput").val();
		let openScope = $("#scopeInput").val();
		
		// validation
		// 사진유효성 검사
		if(image.files[0] == 0){
			alert("사진을 선택해주세요");
			return;
		}
		
		if(content == "") {
			alert("사진에 대한 설명을 입력해주세요");
			return;
		}
		
		if (openScope == "") {
			alert("공개범위를 설정해주세요");
			return;
		}
		
		// let file = $("#fileInput")[0]; 사용법
		let formData = new FormData();
		formData.append("content", content);
		formData.append("location", location);
		formData.append("openScope", openScope);		
		formData.append("imageFile", image.files[0]);
		
		$.ajax({
			type:"post"
			, url:"/post/create"
			, data:formData
			, enctype:"multipart/form-data"  // 파일 업로드 필수 옵션
			, processData:false  // 파일 업로드 필수 옵션
			, contentType:false  // 파일 업로드 필수 옵션
			, success:function(data){
				if (data.result == "success") {
					alert("게시물 작성 성공");
					location.href = "/post/timeline-view"
				} else {
					alert("게시물 작성 실패");
				}
			}
			, errer:function(){
				alert("게시물 작성 에러");
			}
		});
	});
});
</script>
</body>
</html>