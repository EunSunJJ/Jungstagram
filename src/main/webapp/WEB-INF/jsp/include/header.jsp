<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="bg-warning d-flex justify-content-between">
	<div class="ml-3"><img src="/static/img/instagram.jpg" width="300" height="100" alt="로고"></div>
	<div>친구 검색기능</div>
	<c:if test="${not empty userId}">
		<div class="mr-3"> ${userNickname}님 <a href="/user/logout"> 로그아웃</a></div>
	</c:if>
</header>