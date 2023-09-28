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
</head>
<body>
	<div id="wrap">
		<div class="d-flex justify-content-center mt-5">
			<section class="picture bg-dark">
				<div class="slide"> 
					<div class="slide-img"><img src="/static/img/login_picture.png" width="300px" height="600px" alt="slide1"></div>
					<div class="slide-img"><img src="/static/img/login_picture2.png" width="300px" height="600px" alt="slide2"></div>
					<div class="slide-img"><img src="/static/img/login_picture3.png" width="300px" height="600px" alt="slide3"></div>
				</div>
			</section>
			
			<section class="login-box">
				<img src ="/static/img/instagram.jpg"  width="350" height="100" class="mt-4 mb-4 ml-4">
				<div class="d-flex justify-content-center">
					<div class="login-input">
						<form id="loginForm">
							<input type="text" placeholder="아이디를 입력하세요" class="login-input-box mb-4" id="loginIdInput">
							<input type="password" placeholder="비밀번호를 입력하세요" class="login-input-box form-control mb-4" id="passwordInput">
							
							<button type="submit" class="btn btn-info btn-block mb-5" id="loginBtn">로그인</button>
							<hr>
						</form>
						<div class="text-center mt-2"><a href="#" class="forgot-link">비밀번호를 잊으셨나요?</a></div>	
						<div class="text-center"><a href="#" class="forgot-link">아이디를 잊으셨나요?</a></div>	
					</div>
				</div>
					
				<div class="d-flex justify-content-center">	
					<div class="join-box-bottom d-flex justify-content-center align-items-center my-4">
						<div>계정이 없으신가요? <a href="/user/join-view">가입하기</a></div>
					</div>
				</div>
			</section>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



<script>
//로그인 화면 이미지 슬라이드

// 로그인
$(document).ready(function(){
	
	$("#loginForm").on("submit", function(e){
		
		e.preventDefault();
		
		let loginId = $("#loginIdInput").val();
		let password = $("#passwordInput").val();
		
		if (loginId == "") {
			alert("아이디를 입력하세요");
			return;
		}
		
		if (password == "") {
			alert("비밀번호를 입력하세요");
			return;
		}

		$.ajax({
			type:"post"
			, url:"/user/login"
			, data:{"loginId":loginId, "password":password}
			, success:function(data){
				
				if (data.result == "success") {
					alert("로그인에 성공했습니다");
					location.href = "/post/timeline-view"
				} else {
					alert("아이디, 비밀번호를 확인하세요");
				}
			}
			, error:function(){
				alert("로그인 에러");
			}	
			
		});

	});
});

</script>

</body>
</html>