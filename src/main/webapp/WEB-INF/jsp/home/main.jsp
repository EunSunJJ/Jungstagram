<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home 화면</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
	<div id=wrap>
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section>
			<div class="d-flex justify-content-between">
				
				<div>
					<div class="home-icon mt-2 mb-5 text-center">
						<a href="/user/join-view"><img class="home-logo" src="/static/img/logo_2.png" alt="홈화면 로고">
						<span>회원가입 후 즐겨보세요</span></a>
						<div class="login-after-click">
							<a href="/post/timeline-view" class="home-timeline">
								<i class="bi bi-check-circle-fill"></i>
								<span class="login-after">로그인 후 클릭</span>
								<i class="bi bi-check-circle-fill"></i>
							</a>
						</div>
					</div>	
				</div>
					
				<img class="home-picture" src="/static/img/home_main.jpg" alt="홈화면 사진">
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