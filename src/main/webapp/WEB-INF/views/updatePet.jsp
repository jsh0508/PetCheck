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
  <style>
 .insertDog {
    content:url(resources/img/gg.jpg);
    height:200px;
    width:150px;
 }
 .insertCat {
    content:url(resources/img/cc.jpg);
    height:200px;
    width:150px;
 }
 .filebox label {
 	display: inline-block;
 	padding: .5em .75em;
 	background-color: #fdfdfd;
 	color: #999;
 	cursor: pointer;
 	border: 1px solid #ebebeb;
 	border-radius: .25em;
 }
 #pet_img {
 	position: absolute;
 	width: 1px;
 	height: 1px;
 	padding: 0;
 	border: 0;
 	margin: -1px;
 	overflow: hidden;
 	clip: rect(0, 0, 0, 0);
 }
</style>
</head>
<body>
	<c:if test="${!empty mvo}">
	<h1>우리아이 프로필 수정</h1>
		<form id="updatePet" action="${cpath}/update.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="idx" value="${mvo.idx}">
			<input type="hidden" name="id" value="${mvo.id}">
			<input type="hidden" name="id" value="${vo.pet_seq}">
			<br>
			<div class="form-group filebox">
        		<img id="imagePreview" src="${cpath}${vo.pet_img}" alt="Image Preview" style="max-width: 200px; max-height: 200px;">
				<br>
				<br>
				<label for="pet_img">프로필 이미지</label>
				<input type="file" id="pet_img" name="petImg">
			</div>
			<br>
			<div class="form-group">
				<label for="pet_name">펫 이름 :</label>
				<input id="pet_name" type="text" name="pet_name" value="${vo.pet_name}">
			</div>
			<br>
			<div class="form-group">
				<label for="pet_race">펫 품종 :</label>
				<label><div class="insertDog"></div><input type="radio" name="pet_race" value="${vo.pet_race}">강아지</label>
				<label><div class="insertCat"></div><input type="radio" name="pet_race" value="${vo.pet_race}">고양이</label>
			</div>
			<br>
			<div class="form-group">
				<label for="detail_race">상세품종 :</label>
				<input type="text" name="detail_race" value="${vo.detail_race}">
			</div>
			<br>
			<div class="form-group">
				<label for="pet_gender">펫 성별 :</label>
				<label><input type="radio" name="pet_gender" value="${vo.pet_gender}">남아</label>
				<label><input type="radio" name="pet_gender" value="${vo.pet_gender}">여아</label>
			</div>
			<br>
			<div class="form-group">
				<label for="pet_birthdate">펫 출생일 :</label>
				<input id="pet_birthdate" type="date" name="pet_birthdate" value="${vo.pet_birthdate}">
			</div>
			<button class="btn btn-warning btn-sm" type="submit">펫 추가버튼</button>
		</form>
	</c:if>
	<script>
	    $(document).ready(function () {
	        $("#pet_img").change(function () {
	            readURL(this);
	        });
	    });
	
	    function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $("#imagePreview").attr("src", e.target.result);
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	</script>
</body>
</html>
