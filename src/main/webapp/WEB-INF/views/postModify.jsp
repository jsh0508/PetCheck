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
	<h1>게시물 수정하기</h1>
	<form action="${cpath}/postModify.do" method="post">
		<input type="hidden" name="post_idx" value="${pvo.post_idx}"/>
		<input type="hidden" name="page" value="${cri.page}"/>
		<input type="hidden" name="type" value="${cri.type}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"/>
		<label>제목:</label>
		<input type="text" name="post_title" class="form-control" value="${pvo.post_title}"/>
		<label>내용:</label>
		<textarea rows="10" name="post_content" class="form-control">${pvo.post_content}</textarea>  
		<label>작성자:</label>
		<input type="text" name="nick" class="form-control" value="${pvo.nick}" readonly/>
		<br/>
		<button type="submit" class="btn btn-primary btn-sm">수정하기 </button>
		<button type="reset" class="btn btn-warning btn-sm">취소</button>
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${cpath}/postList.do'">목록</button>
	</form>
    <div class="card-footer">
		푸터
    </div>
</body>
</html>