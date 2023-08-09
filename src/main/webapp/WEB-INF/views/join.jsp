<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<form action="${cpath}/memberjoin.do" method="post">
		<label for="id">아이디 : </label>
		<input type="text" id="id" name="id" class="form-control">
		<hr>
		<label for="pw">비밀번호 : </label>
		<input type="password" id="pw" name="pw" class="form-control">
		<hr>
		<label for="nick">닉네임 : </label>
		<input type="text" id="nick" name="nick" class="form-control">
		<hr>
		<button type="submit" class="btn btn-primary btn-sm">완료</button>
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${cpath}/main.do'">돌아가기</button>
	</form>

</body>
</html>