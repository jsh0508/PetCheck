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
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/form.css">
  <link rel="stylesheet" href="resources/css/myPage.css">
  <link rel="stylesheet" href="resources/css/btn.css">

<!-- GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet" type="text/css">
<link href="resources/vendor/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<!-- PAGE LEVEL PLUGIN STYLES -->
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css" />

<!-- THEME STYLES -->
<link href="resources/css/layout.min.css" rel="stylesheet" type="text/css" />

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" />

<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:if test="${!empty mvo}">
		<h1>펫 정보</h1>
		
  <div class="main_swiper">
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <c:forEach var="vo" items="${list}">
	    		<c:if test="${mvo.id == vo.id}">
	    		<div class="swiper-slide">
	    			<c:if test="${vo.pet_img != null && vo.pet_race == '강아지'}">
    					<img alt="강아지" src="${cpath}${vo.pet_img}" style="height: 200px; width: 150px;">
	    			</c:if>
	    			<c:if test="${vo.pet_img != null && vo.pet_race == '고양이'}">
	    				<img alt="고양이" src="${cpath}${vo.pet_img}" style="height: 200px; width: 150px;">
	    			</c:if>
	    			<c:if test="${vo.pet_img == null && vo.pet_race == '강아지'}">
	    				<img id="dog_img" alt="강아지" src="resources/img/dog.png">
	    			</c:if>
	    			<c:if test="${vo.pet_img == null && vo.pet_race == '고양이'}">
	    				<img id="cat_img" alt="고양이" src="resources/img/cat.png">
	    			</c:if>
	    			<br>
		    		<c:if test="${vo.pet_gender == '남아'}">
		    			<p style="font-size: 30px;">${vo.pet_name}</p><p style="color: blue; font-size: 40px; font-weight: 1000;">♂</p>
					</c:if>
					<c:if test="${vo.pet_gender == '여아'}">
		    			<p style="font-size: 30px;">${vo.pet_name}</p><p style="color: red; font-size: 40px; font-weight: 1000;">♀</p>
					</c:if>
					<div>
		    			<p style="font-size: 15px;">${vo.pet_race}</p>
		    			<p style="font-size: 15px;">${vo.pet_birthdate}</p>
					</div>
	    		</div>
	    		</c:if>
	    		</c:forEach>
      </div>
    	<div class="swiper-pagination"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>
  </div>
<hr>
  <div class="sub_swiper">
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <c:forEach var="vo" items="${list}">
    		<c:if test="${mvo.id == vo.id}">
    		<div class="swiper-slide">
    			<c:if test="${vo.pet_img != null && vo.pet_race == '강아지'}">
    				<img alt="강아지" src="${cpath}${vo.pet_img}" style="height: 200px; width: 150px;">
    			</c:if>
    			<c:if test="${vo.pet_img != null && vo.pet_race == '고양이'}">
    				<img alt="고양이" src="${cpath}${vo.pet_img}" style="height: 200px; width: 150px;">
    			</c:if>
    			<c:if test="${vo.pet_img == null && vo.pet_race == '강아지'}">
    				<img id="dog_img" alt="강아지" src="resources/img/dog.png">
    			</c:if>
    			<c:if test="${vo.pet_img == null && vo.pet_race == '고양이'}">
    				<img id="cat_img" alt="고양이" src="resources/img/cat.png">
    			</c:if>
    			<br>
    			<a id="updatePet" href="${cpath}/upPet.do?pet_seq=${vo.pet_seq}"><label >프로필 수정</label></a>
    			<br>
    			<label>이름 : </label>
    			<input type="text" readonly="readonly" value="${vo.pet_name}">
    			<br>
    			<label>품종 : </label>
    			<input type="text" readonly="readonly" value="${vo.pet_race}">
    			<c:if test="${vo.detail_race != null}">
    			<input type="text" readonly="readonly" value="${vo.detail_race}">
    			</c:if>
    			<br>
    		<c:if test="${vo.pet_gender == '남아'}">
    			<label>성별 : </label>
				<input type="text" readonly="readonly" value="o(*￣▽￣*)ブ남아">
    			<br>
			</c:if>
			<c:if test="${vo.pet_gender == '여아'}">
    			<label>성별 : </label>
				<input type="text" readonly="readonly" value="(●'◡'●)여아">
    			<br>
			</c:if>
    			<label>생년월일 : </label>
    			<input type="text" readonly="readonly" value="${vo.pet_birthdate}">
    			<br>
    		</div>
    		</c:if>
    		</c:forEach>
      </div>
    </div>
  </div>		
		
		<br>
		<button class="btn btn-warning btn-sm" onclick="location.href='${cpath}/addPet.do'">펫 추가버튼</button>
		<hr>
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
			</div>
			<!-- 버튼에 폼-컨트롤 은 길이를 맞추는 용도? -->
			<button type="submit" class="btn btn-primary btn-sm form-control">수정</button>
		</form>
		<button data-btn="deleteInfo" id="deleteInfo" class="btn btn-warning btn-sm">회원탈퇴</button>
	</c:if>
	<form action="frm">
	<input type="hidden" name="id" value="${mvo.id}">
	</form>
	<script type="text/javascript">
		var MainSwiper = new Swiper('.main_swiper .swiper-container', {
			  loop: true,
			  slidesPerView: 1,
			  spaceBetween: 50,
			  autoplay: {     //자동슬라이드 (false-비활성화)
		          delay: 3000, // 시간 설정
		        },
			  pagination: {
			    el: '.swiper-pagination',
			    clickable: true
			  },
			  navigation: {
			    prevEl: '.swiper-button-prev',
			    nextEl: '.swiper-button-next'
			  }
			});

			var SubSwiper = new Swiper('.sub_swiper .swiper-container', {
				  loop: true,
				  slidesPerView: 1,
				  spaceBetween: 50
			});

			MainSwiper.controller.control = SubSwiper;
			SubSwiper.controller.control = MainSwiper;
	
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
		});
	</script>
</body>
</html>
