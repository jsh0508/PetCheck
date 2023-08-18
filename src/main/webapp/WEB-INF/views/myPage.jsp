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
     <div class="pet-modify">
      <p class="petinformation" align="center">펫 정보 수정하기</p>
     </div> 
     
       <div class="main_swiper">
        <div class="swiper-container">
          <div class="swiper-wrapper">
             <c:forEach var="vo" items="${list}">
             <c:if test="${mvo.id == vo.id}">
              <div class="swiper-slide">
                <c:if test="${vo.pet_img != null && vo.pet_race == '강아지'}">
                   <img alt="강아지" src="${cpath}${vo.pet_img}" style="height: 100px; width: 100px;">
                </c:if>
                <c:if test="${vo.pet_img != null && vo.pet_race == '고양이'}">
                   <img alt="고양이" src="${cpath}${vo.pet_img}" style="height: 100px; width: 100px;">
                </c:if>
              <%--   <c:if test="${vo.pet_img == null && vo.pet_race == '강아지'}">
                   <img id="dog_img" alt="강아지" src="resources/img/dog.png">
                </c:if> --%>
             <%--    <c:if test="${vo.pet_img == null && vo.pet_race == '고양이'}">
                   <img id="cat_img" alt="고양이" src="resources/img/keropy.png">
                </c:if> --%>
<!--                 <br> -->
             
                <!-- pet 이름, 종, 성별, 생년월일 -->
                <c:if test="${vo.pet_gender == '남아'}">
                  <div class="petName">
                    <p style="font-size: 25px;">${vo.pet_name}</p>
             <!--        <br> -->
                    <p style="color: hotpink; font-size: 18px; font-weight: 400;">♂</p>
                    <div class="petIntro">
                      <p>${vo.pet_race}</p>
                      <p>${vo.pet_birthdate}</p>
                    </div>
                  </div>
                </c:if>
                <c:if test="${vo.pet_gender == '여아'}">
                 <div class="petName">
                   <p style="font-size: 30px;">${vo.pet_name}</p>
                   <br>
                   <p style="color: hotpink;font-size: 20px;font-weight: 1000;">♀</p>
                    <div class="petIntro">
                      <p>${vo.pet_race}</p>
                      <p>${vo.pet_birthdate}</p>
                    </div>
                  </div>  
               </c:if>
             </div>
             </c:if>
             </c:forEach>
      </div>
       <div class="swiper-pagination"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>
  </div>
<!-- <hr> -->
  <div class="sub_swiper">
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <c:forEach var="vo" items="${list}">
          <c:if test="${mvo.id == vo.id}">
          <div class="swiper-slide">
             <%-- <c:if test="${vo.pet_img != null && vo.pet_race == '강아지'}">
                <img src="${cpath}${vo.pet_img}" alt="강아지" style="height: 200px; width: 150px;">
             </c:if>
             <c:if test="${vo.pet_img != null && vo.pet_race == '고양이'}">
                <img src="${cpath}${vo.pet_img}" alt="고양이" style="height: 200px; width: 150px;">
             </c:if> --%>
          <%--    <c:if test="${vo.pet_img == null && vo.pet_race == '강아지'}">
                <img id="dog_img" alt="강아지" src="resources/img/dog.png">
             </c:if>
             <c:if test="${vo.pet_img == null && vo.pet_race == '고양이'}">
                <img id="cat_img" alt="고양이" src="resources/img/cat.png">
             </c:if> --%>
             
              <!-- 한 화면에 펫, 회원 정보수정 모두 처리하기위해 따로 넘어가는 페이지 주석처리할게요 -->
            <%--  <label >프로필 수정</label></a>
             <a id="updatePet" href="${cpath}/upPet.do?pet_seq=${vo.pet_seq}"> --%>

              <div class="pet-modify">
                <!--      <label>이름</label> -->
                <input type="text" class="in-put" value="${vo.pet_name}" >
                <br>
           <!--   <label>품종</label> -->
     <%--         <input type="text" readonly="readonly" value="${vo.pet_race}"> --%>
                <c:if test="${vo.detail_race != null}">
                <input type="text" class="in-put" value="${vo.detail_race}" >
                </c:if>
                <br>
                <c:if test="${vo.pet_gender == '남아'}">
                <!--  <label>성별</label> -->
                <input type="text" class="in-put" value="남아">
                <br>
                </c:if>
                <c:if test="${vo.pet_gender == '여아'}">
                <!-- <label>성별</label> -->
                <input type="text" class="in-put" value="여아">
                <br>
                </c:if>
                <!--    <label>생년월일</label> -->
                <input type="text" class="in-put" value="${vo.pet_birthdate}">
            </div><!-- pet-modify 끝 -->
         </div>
          </c:if>
          </c:forEach>
      </div>
    </div>
  </div>      
      <div class="addpetBtn">
      <button class="addpetbtn" onclick="location.href='${cpath}/addPet.do'">펫 추가하기</button>
      </div><br><br>
<!--       <hr> -->
      
      <!-- 회원정보 수정하기 -->
          <p class="my-information" align="center">내 정보 수정하기</p>
      <div class="memberModify">
        <div class="myinformation">
            <form action="${cpath}/updateInfo" method="post">
        <!-- <div class="form-group"> -->
                <input type="hidden" name="idx" value="${mvo.idx}"/>
            <!--      <label for="id">아이디 : </label> -->
                <input type="text" class="in-put" name="id" id="id" value="${mvo.id}" readonly="readonly"/>
            <!--  </div> -->
            <!--  <div class="form-group"> -->
            <!--  <label for="pw">패스워드 : </label> -->
                <input type="password" class="in-put" name="pw" id="pw" placeholder="변경할 비밀번호를 입력하세요"/>
            <!-- </div> -->
            <!-- <div class="form-group"> -->
            <!--     <label for="nick">닉네임 : </label> -->
                <input type="text" class="in-put" name="nick" id="nick" value="${mvo.nick}"/>
            <!--  </div> -->
            <!--  <div class="form-group">
             </div> -->
         <!-- 버튼에 폼-컨트롤 은 길이를 맞추는 용도? -->
         <button type="submit" class="success">수정 완료</button>
            </form>
       </div>
     </div>
   </c:if>
           <form action="frm">
             <input type="hidden" name="id" value="${mvo.id}">
           </form>
 </div> <!-- main -->
 
         <button data-btn="deleteInfo" id="deleteInfo" class="joinus">회원탈퇴</button>
   <script type="text/javascript">
      var MainSwiper = new Swiper('.main_swiper .swiper-container', {
           loop: true,
           slidesPerView: 1,
           spaceBetween: 50,
/*            autoplay: {     //자동슬라이드 (false-비활성화)
                delay: 3000, // 시간 설정
              }, */
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