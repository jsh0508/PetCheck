<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- BEGIN HEAD -->
<head>
  <meta charset="utf-8">
  <title>Mypage</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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
<div class="myPagemain" text-align="center";>
   <c:if test="${!empty mvo}">
       <h1>회원 정보</h1>
       <form action="${cpath}/updateInfo" method="post">
         <div class="form-group">
            <input type="hidden" name="idx" value="${mvo.idx}"/>
            <label for="id">아이디</label>
            <input type="text" class="mypageID " name="id" id="id" value="${mvo.id}" readonly="readonly"/>
         </div>
         <div class="form-group">
            <label for="pw">패스워드</label>
            <input type="password" class="form-control" name="pw" id="pw"/>
         </div>
         <div class="form-group">
            <label for="nick">닉네임</label>
            <input type="text" class="form-control" name="nick" id="nick" value="${mvo.nick}"/>
         </div>
         <div class="form-group">
         </div>
         <!-- 버튼에 폼-컨트롤 은 길이를 맞추는 용도? -->
         <button type="submit" class="btn btn-primary btn-sm form-control">수정</button>
      </form>
      <button data-btn="deleteInfo" id="deleteInfo" class="btn btn-warning btn-sm">회원탈퇴</button>
      <form id="addPet" action="${cpath}/addPet.do" method="post">
         <input type="hidden" name="id" value="${mvo.id}">
         <br>
         <div class="form-group">
         <label for="pet_name">펫 이름</label>
         <input id="pet_name" type="text" name="pet_name">
         </div>
         <br>
         <div class="form-group">
         <label for="pet_race">펫 품종</label>
         <label><input type="radio" name="pet_race" value="개">개</label>
         <label><input type="radio" name="pet_race" value="고양이">고양이</label>
         </div>
         <br>
         <div class="form-group">
         <label for="pet_gender">펫 성별</label>
         <label><input type="radio" name="pet_gender" value="남아">남아</label>
         <label><input type="radio" name="pet_gender" value="여아">여아</label>
         </div>
         <br>
         <div class="form-group">
         <label for="pet_birthdate">펫 출생일</label>
         <input id="pet_birthdate" type="date" name="pet_birthdate">
         </div>
      <button class="btn btn-warning btn-sm" type="submit">펫 추가등록</button>
      </form>
   </c:if>
   <form id="frm">
      <input type="hidden" name="idx" value="${mvo.idx}">
   </form>
   </div>
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
         
         /* $("#add_pet").click(function(){
         }); */
      });
   </script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>