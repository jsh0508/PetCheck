<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:if test="${empty mvo}">
	 	<h1>회원가입 / 로그인</h1>
	 	<form action="${cpath}/login.do" method="post">
			<div class="form-group">
				<label for="id">아이디 : </label>
				<input type="id" class="form-control" name="id" id="id"/>
			</div>
			<div class="form-group">
				<label for="pw">패스워드 : </label>
				<input type="password" class="form-control" name="pw" id="pw"/>
			</div>
			<!-- 버튼에 폼-컨트롤 은 길이를 맞추는 용도? -->
			<button type="submit" class="btn btn-primary btn-sm form-control">로그인</button>
		</form>
		<form action="${cpath}/memberjoin.do" method="post">
			<button type="submit" class="btn btn-primary btn-sm form-control">회원가입</button>
		</form>
	</c:if>
</body>
</html>
