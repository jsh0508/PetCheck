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
     <div class="pet-modify" onclick="togglePet('petInfo')">
      <p class="petinformation" align="center">펫 정보 수정하기</p>
     </div> 
     <br>
     <div class="petInfo" style="display: none;">
       <div class="main_swiper">
        <div class="swiper-container">
          <div class="swiper-wrapper">
             <c:forEach var="vo" items="${list}">
             <c:if test="${mvo.id == vo.id}">
              <div class="swiper-slide">
                <c:if test="${vo.pet_img != null && vo.pet_race == '강아지'}">
                   <img alt="강아지" src="${cpath}${vo.pet_img}" style="height: 100px; width: 100px; border-radius: 100%;">
                </c:if>
                <c:if test="${vo.pet_img != null && vo.pet_race == '고양이'}">
                   <img alt="고양이" src="${cpath}${vo.pet_img}" style="height: 100px; width: 100px; border-radius: 100%;">
                </c:if>
                <c:if test="${vo.pet_img == null && vo.pet_race == '강아지'}">
                   <img id="dog_img" alt="강아지" src="resources/img/dog.png" style="height: 100px; width: 100px; border-radius: 100%;">
                </c:if>
                <c:if test="${vo.pet_img == null && vo.pet_race == '고양이'}">
                   <img id="cat_img" alt="고양이" src="resources/img/cat.png" style="height: 100px; width: 100px; border-radius: 100%;">
                </c:if>
<!--                 <br> -->
             
                <!-- pet 이름, 종, 성별, 생년월일 -->
                <c:if test="${vo.pet_gender == '남아'}">
                  <div class="petName">
                    <p style="font-size: 25px;">${vo.pet_name}</p><button class="updatePet" onclick="redirectToEdit(${vo.pet_seq})">수정</button>
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
                   <p style="font-size: 30px;">${vo.pet_name}</p><button class="updatePet" onclick="redirectToEdit(${vo.pet_seq})">수정</button>
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

              <div class="pet-modify">
                <input type="hidden" value="${vo.pet_seq}" name="pet_seq">
                <input type="text" class="in-put" value="${vo.pet_name}" readonly="readonly">
                <br>
                <c:if test="${vo.detail_race != null}">
                <input type="text" class="in-put" value="${vo.detail_race}" readonly="readonly">
                </c:if>
                <br>
                <c:if test="${vo.pet_gender == '남아'}">
                <input type="text" class="in-put" value="남아" readonly="readonly">
                <br>
                </c:if>
                <c:if test="${vo.pet_gender == '여아'}">
                <input type="text" class="in-put" value="여아" readonly="readonly">
                <br>
                </c:if>
                <input type="text" class="in-put" value="${vo.pet_birthdate}" readonly="readonly">
            </div>
         </div>
          </c:if>
          </c:forEach>
      </div>
    </div>
  </div>      
      <div class="addpetBtn">
      <button class="addpetbtn" onclick="location.href='${cpath}/addPet.do'">펫 추가하기</button>
      </div>
     </div>
      <br>
      <br>
     <c:if test="${mvo.sns_type == null}">
      <!-- 회원정보 수정하기 -->
      <div class="openInfo" onclick="toggleInfo('memberModify')">
          <p class="my-information" align="center">내 정보 수정하기</p>
      </div>
      <div class="memberModify" style="display: none;">
        <div class="myinformation">
            <form id="form" class="form" action="${cpath}/updateInfo" method="post">
                <input type="hidden" name="idx" value="${mvo.idx}"/>
                <input type="text" class="in-put" name="id" id="id" value="${mvo.id}" readonly="readonly"/>
                <div class="strongpw-message hide" style="text-align: center;">비밀번호는 8~15자, 영문, 숫자, 특수문자를 사용하세요.</div>
                <input type="password" class="in-put" name="pw" id="pw" placeholder="변경할 비밀번호를 입력하세요"/>
            	<div class="strongnick-message hide" style="text-align: center;">닉네임은 최소 2글자 이상이어야 합니다.</div>
                <input type="text" class="in-put" name="nick" id="nick" value="${mvo.nick}"/>
         <button type="button" class="success" onclick="update();">수정 완료</button>
            </form>
       </div>
     </div>
           <form id="frm" class="frm">
             <input type="hidden" name="idx" value="${mvo.idx}">
             <input type="hidden" name="pet_seq" value="${vo.pet_seq}">
           </form>
      </c:if>
     
   </c:if>
 </div> <!-- main -->
 <a class="deleteInfo" data-btn="deleteInfo" id="deleteInfo" style="justify-content: center;
    align-items: center;
    display: flex;">회원탈퇴</a>
   <script type="text/javascript">
	// 1. 비밀번호 입력창 정보 가져오기
	let elInputpw = document.querySelector('#pw'); // input#pw
	// 2. 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자, 특수문자 미사용)
	let elStrongpwMessage = document.querySelector('.strongpw-message'); // div.strongpw-message.hide
	
	// 1. 닉네임 입력창 정보 가져오기
	let elInputnick = document.querySelector('#nick'); // input#nick
	// 3. 실패 메시지 정보 가져오기 (글자수 제한 2이상)
	let elStrongnickMessage = document.querySelector('.strongnick-message');
   
	function strongpw (str) {
		return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/.test(str);
	}
	
	function nickLength(value) {
		return value.length >= 2
	}
	
	elInputpw.onkeyup = function () {

		  // 값을 입력한 경우
		  if (elInputpw.value.length !== 0) {
		    if(strongpw(elInputpw.value)) {
		      elStrongpwMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
		    }
		    else {
		      elStrongpwMessage.classList.remove('hide'); // 실패 메시지가 보여야 함
		      elStrongpwMessage.style.color = '#C90000'; // 빨간색 글씨로 변경
		      elInputpw.focus();
			  return;
		    }
		  }
		  // 값을 입력하지 않은 경우 (지웠을 때)
		  // 모든 메시지를 가린다.
		  else {
		    elStrongpwMessage.classList.add('hide');
		    elInputpw.focus();
			return;
		  }
	}
	
	elInputnick.onkeyup = function () {
		
		// 값을 입력한 경우
		if (elInputnick.value.length !== 0) {
			if (nickLength(elInputnick.value) === false) {
				elStrongnickMessage.classList.remove('hide'); // 닉네임은 최소 2글자 이상이어야 합니다.
				elStrongnickMessage.style.color = '#C90000'; // 빨간색 글씨로 변경
			    elInputnick.focus();
				return;
			} else {
				elStrongnickMessage.classList.add('hide');
			}
		}
	}
	
    var pw = document.getElementById('pw');
    var nick = document.getElementById('nick');
	   
	function update() {
		
		if (!strongpw(elInputpw.value)) {
			alert('비밀번호를 정확하게 입력해 주세요.');
            pw.focus();
            return;
		}
		
		if (!nickLength(elInputnick.value)) {
			alert('닉네임을 정확하게 입력해 주세요.');
            nick.focus();
            return;
		}
		
		form.submit();
	}
	
	function toggleInfo(memberModify) {
	    var target = document.querySelector('.' + 'memberModify');
	    if (target.style.display === "none") {
	        target.style.display = "block";
	    } else {
	        target.style.display = "none";
	    }
	}
	
	function togglePet(petInfo) {
	    var target = document.querySelector('.' + 'petInfo');
	    if (target.style.display === "none") {
	        target.style.display = "block";
	    } else {
	        target.style.display = "none";
	    }
	}
	
	function redirectToEdit(petSeq) {
	    var url = '${cpath}/upPet.do?pet_seq=' + petSeq;
	    window.location.href = url;
	}
/* 	function toggleReadonly() {
		document.getElementsByTagName( 'input' )[0].removeAttribute( 'readonly' );
		document.getElementsByTagName( 'input' )[1].removeAttribute( 'readonly' );
		document.getElementsByTagName( 'input' )[2].removeAttribute( 'readonly' );
		document.getElementsByTagName( 'input' )[3].removeAttribute( 'readonly' );
		document.getElementsByTagName( 'input' )[4].removeAttribute( 'readonly' );
	} */
	
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
      
      $(document).ready(function(){
          
          $("#deletePet").click(function(){
             if (!confirm("정말 삭제하시겠습니까?")) {
             } else {
             var frm = $("#petfrm");
             var data = $(this).data("btn");
             if (data == "deletePet") {
            	 console.log(${vo.pet_seq});
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