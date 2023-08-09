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
	<c:if test="${!empty mvo}">
	 	<h1>회원 정보</h1>
	 	<form action="${cpath}/updateInfo" method="post">
			<div class="form-group">
				<input type="hidden" name="idx" value="${mvo.idx}"/>
				<label for="id">아이디 : </label>
				<input type="text" class="form-control" name="id" id="id" value="${mvo.id}" readonly="readonly"/>
			</div>
			<div class="form-group">
				<label for="pw">패스워드 : </label>
				<input type="password" class="form-control" name="pw" id="pw"/>
			</div>
			<div class="form-group">
				<label for="nick">닉네임 : </label>
				<input type="text" class="form-control" name="nick" id="nick" value="${mvo.nick}"/>
			</div>
			<div class="form-group">
				<button class="btn btn-warning btn-sm" data-btn="add_pet" id="add_pet">펫 추가버튼</button>
			</div>
			<!-- 버튼에 폼-컨트롤 은 길이를 맞추는 용도? -->
			<button type="submit" class="btn btn-primary btn-sm form-control">수정</button>
		</form>
		<form id="addPet" action="${cpath}/addPet" method="post">
			<div class="form-group">
			<input id="id" type="hidden" name="id" value="${mvo.id}">
			<label for="pet_name">펫 이름 :</label>
			</div>
			<div class="form-group">
			<input id="pet_name" type="text" name="pet_name">
			<label for="pet_race">펫 품종 :</label>
			</div>
			<div class="form-group">
			<input id="pet_race" type="text" name="pet_race">
			<label for="pet_gender">펫 성별 :</label>
			</div>
			<div class="form-group">
			<label><input id="pet_gender" type="radio" name="pet_gender" value="남아">남아</label>
			<label><input id="pet_gender" type="radio" name="pet_gender" value="남아">여아</label>
			</div>
			<label for="pet_birthdate">펫 출생일 :</label>
			<input id="pet_birthdate" type="date" name="pet_birthdate">
		</form>
		<button data-btn="deleteInfo" id="deleteInfo" class="btn btn-warning btn-sm">삭제</button>
	</c:if>
	<form id="frm">
		<input type="hidden" name="idx" value="${mvo.idx}">
	</form>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#deleteInfo").click(function(){
				if (!confirm("정말 탈퇴하시겠습니까?")) {
				} else {
				var frm = $("#frm");
				var data = $(this).data("btn");
				if (data == "deleteInfo") {
					frm.attr("action", "${cpath}/deleteInfo.do");
					frm.attr("method", "get");
				}
				frm.submit(); 
				}
			});
			
			$("#add_pet").click(function(){
				var plist = "<table class='table table-hover'>";
					plist += "<thead>";
					plist += "<tr>";
					plist += "<th>펫이름</th>";
					plist += "<th>제목</th>";
					plist += "<th>작성자</th>";
					plist += "<th>작성일</th>";
					plist += "<th>조회수</th>";
					plist += "</tr>";
					plist += "</thead>";
			});
		});
	</script>
</body>
</html>
