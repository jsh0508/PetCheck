<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>MyPage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
  <link rel="stylesheet" href="resources/css/myPage.css">
  
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
  #petLabel {
   margin: 0px 60px 10px 60px;
   width: 300px;
   color: rgb(38, 50, 56);
   font-weight: 700;
   font-size: 14px;
   letter-spacing: 1px;
   background: rgba(136, 126, 126, 0.04);
   padding: 10px 20px;
   border: none;
   border-radius: 20px;
   outline: none;
   box-sizing: border-box;
   border: 2px solid rgba(0, 0, 0, 0.02);
   text-align: center;
   font-family: 'RIDIBatang';
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
 #insertPet {
 text-align: center;
 }
</style>
</head>
<body>
  <div class="main">
   <c:if test="${!empty mvo}">
      <p class="petinformation" align="center">반려동물 등록하기</p>
     <br>
     <br>
     <form id="insertPet" action="${cpath}/insertPet.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="idx" value="${mvo.idx}">
			<input type="hidden" name="id" value="${mvo.id}">
			<br>
			<img id="imagePreview" src="#" alt="Image Preview" style="height: 100px; width: 100px; border-radius: 100%;">
				<br>
				<br>
				<label id="petLabel" for="pet_img">프로필 이미지</label>
				<input class="in-put" type="file" id="pet_img" name="petImg">
			<br>
				<input class="in-put" id="pet_name" type="text" name="pet_name" placeholder="반려동물 이름을 입력하세요.">
			<br>
				<label><div class="insertDog"></div><input type="radio" name="pet_race" id="radio_dog" value="강아지">강아지</label>
				<label><div class="insertCat"></div><input type="radio" name="pet_race" id="radio_cat" value="고양이">고양이</label>
			<br>
				<input class="in-put" type="text" name="detail_race" placeholder="ex)비숑, 코리안숏헤어 등등">
			<br>
				<label><input type="radio" name="pet_gender" id="pet_m" value="남아">남아</label>
				<label><input type="radio" name="pet_gender" id="pet_f" value="여아">여아</label>
			<br>
				<input class="in-put" id="pet_birthdate" type="date" name="pet_birthdate" placeholder="반려동물 생년월일을 입력하세요.">
			<br>
      	<button class="addpetbtn" type="submit">펫 등록</button>
		</form>
   </c:if>
 </div> <!-- main -->
   <script type="text/javascript">
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