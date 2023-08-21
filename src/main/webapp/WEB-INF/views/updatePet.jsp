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

</head>
<body>
  <div class="main">
   <c:if test="${!empty mvo}">
      <p class="petinformation" align="center">펫 정보 수정하기</p>
     <br>
     <br>
     <form id="updatePet" action="${cpath}/updatePet.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="idx" value="${mvo.idx}">
			<input type="hidden" name="id" value="${mvo.id}">
			<input type="hidden" name="pet_seq" value="${vo.pet_seq}">
			<br>
        		<img id="imagePreview" src="${cpath}${vo.pet_img}" alt="Image Preview" style="height: 100px; width: 100px; border-radius: 100%;">
				<br>
				<br>
				<input class="in-put" type="file" id="pet_img" name="petImg" value="${vo.pet_img}">
			<br>
				<input class="in-put" id="pet_name" type="text" name="pet_name" value="${vo.pet_name}">
			<br>
				<label><div class="insertDog"></div><input type="radio" name="pet_race" id="radio_dog" value="${vo.pet_race}">강아지</label>
				<label><div class="insertCat"></div><input type="radio" name="pet_race" id="radio_cat" value="${vo.pet_race}">고양이</label>
			<br>
				<input class="in-put" type="text" name="detail_race" value="${vo.detail_race}">
			<br>
				<label><input type="radio" name="pet_gender" id="pet_m" value="${vo.pet_gender}">남아</label>
				<label><input type="radio" name="pet_gender" id="pet_f" value="${vo.pet_gender}">여아</label>
			<br>
				<input class="in-put" id="pet_birthdate" type="date" name="pet_birthdate" value="${vo.pet_birthdate}">
			<br>
      	<button class="updatePetbtn" type="submit">펫 수정</button>
      	<br>
      	<button class="deletePet" type="button" data-btn="deletePet" id="deletePet">펫 삭제</button>
		</form>
   </c:if>
 </div> <!-- main -->
     <form id="frm" class="frm">
      <input type="hidden" name="idx" value="${mvo.idx}">
      <input type="hidden" name="pet_seq" value="${vo.pet_seq}">
    </form>
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
   
   function selectRadioByValue(value) {
       var radioDog = document.getElementById('radio_dog');
       var radioCat = document.getElementById('radio_cat');
       var pet_m = document.getElementById('pet_m');
       var pet_f = document.getElementById('pet_f');
       
       if (value === '강아지') {
           radioDog.checked = true;
           radioCat.checked = false;
       } else if (value === '고양이') {
           radioDog.checked = false;
           radioCat.checked = true;
       }
       
       if (value === '남아') {
       	pet_m.checked = true;
       	pet_f.checked = false;
		} else if (value === '여아') {
			pet_m.checked = false;
           pet_f.checked = true;
		}
   }
   window.addEventListener('load', function () {
       selectRadioByValue('${vo.pet_race}'); // 원하는 값으로 선택 상태 변경
       selectRadioByValue('${vo.pet_gender}'); // 원하는 값으로 선택 상태 변경
   });
      
   $(document).ready(function(){
       
       $("#deletePet").click(function(){
          if (!confirm("정말 삭제하시겠습니까?")) {
          } else {
          var frm = $("#frm");
          var data = $(this).data("btn");
          if (data == "deletePet") {
             frm.attr("action", "${cpath}/deletePet.do?pet_seq=${vo.pet_seq}");
             frm.attr("method", "get");
          }
          frm.submit(); 
          }
       });
    });
   </script>
</body>
</html>