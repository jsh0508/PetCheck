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
	<h1>게시물 작성</h1>
		<form action="${cpath}/postRegister.do" method="post">
		<!-- pvo에 저장 시발아-->
			<input type="hidden" name="id" value="${mvo.id}"/>
			<label>제목:</label>
			<input type="text" name="post_title" class="form-control"/>
			<label>작성자:</label>
			<input type="text" name="nick" class="form-control" value="${mvo.nick}" readonly/>
			<label>내용:</label>
			<textarea rows="10" name="post_content" class="form-control"></textarea>  
			<br/>
			<!-- 파일 업로드 <button type="file"></button> -->
			<button type="submit" class="btn btn-primary btn-sm">등록</button>
			<button type="reset" class="btn btn-warning btn-sm">취소</button>
		</form>
</body>
</html>