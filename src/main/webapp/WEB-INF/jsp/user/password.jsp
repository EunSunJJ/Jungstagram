<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- 내가 설정한 CSS -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>

<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"  />
		
		<section class="d-flex justify-content-center">
			<div class="reset-password d-flex align-items-center">
				<div>
					<h1 class="text-center mb-2">비밀번호 재설정</h1>
					<h1 class="text-center mb-4">이메일이 발송됩니다</h1>

					<div>
						<input type="text" placeholder=" 이메일주소를 입력하세요"
							class="reset-password-info" id="emailInput"> <input
							type="text" placeholder=" 이름을 입력하세요" class="reset-password-info"
							id="nameInput">
					</div>

					<div class="d-flex justify-content-center">
						<button type="button" class="btn btn-secondary"
							id="passwordFindBtn">확인</button>
					</div>
				</div>
			</div>
		</section>

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {

			// 확인버튼 클릭
			$("#passwordFindBtn").on("click", function() {

				let email = $("#emailInput").val();
				let name = $("#nameInput").val();

				// validation
				if (email == "") {
					alert("이메일주소를 입력하세요");
					return;
				}

				if (name == "") {
					alert("이름을 입력하세요");
					return;
				}

				$.ajax({
					type : "post",
					url : "/user/reset/password",
					data : {
						"email" : email,
						"name" : name
					},
					success : function(data) {

						if (data.isPasswordReset) {
							// location.href = "/user/login-view"
							alert("발송 완료! 입력하신 이메일로 임시비밀번호가 발송되었습니다")
							// 이메일 발송
							$.ajax({
								type : "post",
								url : "/send/email",
								data : {
									"email" : email,
									"name" : name
								}
							});

						} else {
							alert("이메일, 이름을 확인해주세요");
						}
					},
					error : function() {
						alert("비밀번호 변경 에러");
					}
				});

			});

		});
	</script>

</body>
</html>