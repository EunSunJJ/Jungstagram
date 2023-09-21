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

<body>
	<div id="wrap">
		<section class="contents d-flex justify-content-center">
			<div>
				<div class="join-box">
					<div class="logo d-flex justify-content-center">
						<div>
							<img src ="/static/img/instagram.jpg"  width="340" height="100" class="mt-3 mb-3">
							<div class="text-center">친구들의 사진과 동영상을 보려면 가입하세요.</div>
							<hr>
						</div>
					</div>
					
					<div class="join-input">
						<div class="d-flex">
							<input type="text" placeholder="로그인 아이디" class="loginId-input-box my-4 ml-5 mr-2" id="loginIdInput">
							<button class="btn btn-info my-4" id="loginIdDuplicateBtn">중복확인</button>
						</div>
							<div class="small text-success ml-5 d-none" id="nonDuplicatedId">사용가능한 아이디 입니다</div>
							<div class="small text-danger ml-5 d-none" id="duplicatedId">중복된 아이디 입니다</div>						

						<input type="text" placeholder="이메일 주소" class="login-input-box mb-4 ml-5"  id="emailInput">
						<input type="text" placeholder="이름" class="login-input-box mb-4 ml-5"  id="nameInput">
						<input type="text" placeholder="닉네임" class="login-input-box mb-4 ml-5"  id="nicknameInput">
						<input type="password" placeholder="비밀번호" class="login-input-box mb-4 ml-5" id="passwordInput">
						
						<button type="button" class="btn btn-info btn-block ml-5" id="joinBtn">가입</button>					
					</div>
				</div>
				
				<div class="join-box-bottom d-flex justify-content-center align-items-center">
					<div>계정이 있으신가요? <a href="/user/login-view">로그인</a></div>
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
		// 아이디 중복확인버튼 클릭
		$("#loginIdDuplicateBtn").on("click", function(){
			
			let loginId = $("#loginIdInput").val();
			
			if (loginId == "") {
				alert("아이디를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/user/duplicate-id"
				, data:{"loginId" : loginId}
				, success:function(data){
					
					if (data.isDupicate) {
						// 중복되었다
						$("#duplicatedId").removeClass("d-none");
						$("#nonDuplicatedId").addClass("d-none");
					} else {
						// 중복되지 않았다
						$("#nonDuplicatedId").removeClass("d-none");
						$("#duplicatedId").addClass("d-none");
					}
				}
				, error:function(){
					alert("아이디 중복확인 에러");
				}
			});
		});
		
		// 가입버튼 클릭
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
				type:"post"
				, url:"/user/join"
				, data:{"loginId":loginId, "email":email, "name":name, "nickname":nickname, "password":password}
				, success:function(data){
					
					if (data.result == "success") {
						alert("회원가입 완료");
						location.href="/user/login-view"
					} else {
						alert("회원가입 실패");
					}
				}
				, error:function(){
					alert("회원가입 에러");
				}
				
		});
	});
</script>
</body>
</html>