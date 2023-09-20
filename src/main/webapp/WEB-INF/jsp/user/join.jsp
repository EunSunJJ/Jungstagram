<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 • Jungstagram</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
	<div id="wrap">
	
		<section class="contents d-flex justify-content-center">
			<div>
				<div class="join-box">
					<div>
						<img src = ""  width="300" height="100">
						<div>친구들의 사진과 동영상을 보려면 가입하세요.</div>
						<hr>
					</div>
					
					<div class="input-box">
						<div class="d-flex">
							<input type="text" placeholder="로그인 아이디" class="form-control"  id="loginIdInput">
							<button class="btn btn-primary" id="loginIdDuplicationCk">중복확인</button>
						</div>
						<input type="text" placeholder="이메일 주소" class="form-control"  id="emailInput">
						<input type="text" placeholder="이름" class="form-control"  id="nameInput">
						<input type="text" placeholder="닉네임" class="form-control"  id="nicknameInput">
						<input type="password" placeholder="비밀번호" class="form-control"  id="passwordInput">
						
						<button type="button" class="btn btn-primary" id="joinBtn">가입</button>
					</div>	
				</div>
				
				<div class="join-box-bottom d-flex justify-content-center align-items-center">
					<div>계정이 있으신가요? 
						<a href="/user/login-view">로그인</a>
					<div>
				</div>
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
<body>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){
		
		$("#joinBtn").on("click", function(){
			
			let loginId = $("#loginIdInput").val();
			let email = $("#emailInput").val();
			let name = $("#nameInput").val();
			let nickname = $("#nicknameInput").val();
			let password = $("#passwordInput").val();
			
			
			if (loginId == "") {
				alert("아이디를 입력하세요");
				return;
			}
			
			if (email == "") {
				alert("이메일을 입력하세요");
				return;
			}
			
			if (name == "") {
				alert("이름을 입력하세요");
				return;
			}
			
			if (nickname == "") {
				alert("닉네임을 입력하세요");
				return;
			}
			
			if (password == "") {
				alert("비밀번호를 입력하세요");
				return;
			}
			
			$.ajax({
				
			});
		});
	});
</script>
</body>
</html>