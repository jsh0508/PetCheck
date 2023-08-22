<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" class="no-js">

<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>PetCheck</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link rel="stylesheet" href="resources/css/upload.css">
<link rel="stylesheet" href="resources/css/form.css">
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
<!-- <link rel="stylesheet" href="resources/css/btn.css"> -->

<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- 로그인 디자인 CSS -->
<link rel="stylesheet" href="resources/css/form.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<!-- END HEAD -->

<body>
	<!--========== HEADER ==========-->
	<header class="header" style="background-color: #FFFAF3;">
		<!-- Navbar -->
		<nav class="navbar" role="navigation">
			<div class="logo">
			  <a class="logo-wrap" href="${cpath}/main.do"> 
			  <img class="logo-img logo-img-main" src="resources/img/nocatlogo.png" alt="로고" style="width: 110px;">
			  </a>
			</div>
			 <div class="menu-container">
				<!-- Brand and toggle get grouped for better mobile display -->
			   <div class="menu-container">
				 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
				   <span class="sr-only">Toggle navigation</span> 
				   <span class="toggle-icon"></span>
			     </button>
			   </div>

				<!-- 네비게이션 -->
				<div class="collapse navbar-collapse nav-collapse">
					<div class="menu-container">
						<ul class="navbar-nav navbar-nav-right">
							<li class="nav-item">
							<a class="nav-item-child nav-item-hover" href="${cpath}/upload.do">자가진단</a></li>
							<li class="nav-item">
							<a class="nav-item-child nav-item-hover" href="${cpath}/diary.do?idx=${mvo.idx}">다이어리</a></li>
							<li class="nav-item">
							<a class="nav-item-child nav-item-hover" href="${cpath}/hospital.do">병원검색</a></li>
							<li class="nav-item">
							<a class="nav-item-child nav-item-hover" href="faq.html">게시판</a></li>
							<li class="nav-item">
							<a class="nav-item-child nav-item-hover">|</a></li>
							<c:if test="${empty mvo}">
						    <li class="nav-item">
							<a class="nav-item-child nav-item-hover" href="${cpath}/login.do">로그인</a></li>
							<li class="nav-item">
							<a class="nav-item-child nav-item-hover"
							href="${cpath}/memberjoin.do">회원가입</a></li>
							</c:if>
							
							<c:if test="${!empty mvo}">
							<li class="nav-item">
							<a class="nav-item-child nav-item-hover" href="${cpath}/logout.do">로그아웃</a></li>
							<li class="nav-item">
							<a class="nav-item-child nav-item-hover" href="${cpath}/myPage.do?idx=${mvo.idx}">내 정보</a></li>
							</c:if>
						</ul>
					</div>
				</div><!-- End Navbar Collapse -->
			</div>
		</nav> <!-- End Navbar -->
	</header>
	
     <!-------- 회원가입 폼 ---------->
	<div class="main">
	  <p class="sign-in" align="center">Join Us</p>
		<form action="${cpath}/memberjoin.do" method="post" name="form" class="form">
		   <div class="success-message hide" style="text-align: center;">사용할 수 있는 아이디입니다.</div>
		   <div class="failure-message hide" style="text-align: center;">아이디는 4~12자이어야 합니다.</div>
		   <div class="failure-message2 hide" style="text-align: center;">영어 또는 숫자만 가능합니다.</div>
		   <input type="text" id="id" name="id" class="id" align="center" placeholder="아이디를 입력해주세요.">
		   <div class="strongpw-message hide" style="text-align: center;">비밀번호는 8~15자, 영문, 숫자, 특수문자를 사용하세요.</div>
		   <input type="password" id="pw" name="pw" class="password" align="center" placeholder="비밀번호를 입력해주세요">
		   <div class="strongnick-message hide" style="text-align: center;">닉네임은 최소 2글자 이상이어야 합니다.</div>
		   <input type="text" id="nick" name="nick" class="nick" align="center" placeholder="닉네임을 입력해주세요">
			 <button type="button" class="success" onclick="joinChk();">회원가입 완료</button>
			 <button type="button" class="back" onclick="location.href='${cpath}/main.do'">돌아가기</button>
		</form>
	</div>
	<script>
		// 1. 아이디 입력창 정보 가져오기
		let elInputid = document.querySelector('#id'); // input#id
		// 2. 성공 메시지 정보 가져오기
		let elSuccessMessage = document.querySelector('.success-message'); // div.success-message.hide
		// 3. 실패 메시지 정보 가져오기 (글자수 제한 4~12글자)
		let elFailureMessage = document.querySelector('.failure-message'); // div.failure-message.hide
		// 4. 실패 메시지2 정보 가져오기 (영어 또는 숫자)
		let elFailureMessageTwo = document.querySelector('.failure-message2'); // div.failure-message2.hide
		
		// 1. 비밀번호 입력창 정보 가져오기
		let elInputpw = document.querySelector('#pw'); // input#pw
		// 2. 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자, 특수문자 미사용)
		let elStrongpwMessage = document.querySelector('.strongpw-message'); // div.strongpw-message.hide
		
		// 1. 닉네임 입력창 정보 가져오기
		let elInputnick = document.querySelector('#nick'); // input#nick
		// 3. 실패 메시지 정보 가져오기 (글자수 제한 2이상)
		let elStrongnickMessage = document.querySelector('.strongnick-message');
		
		function idLength(value) {
			return value.length >= 4 && value.length <= 12
		}
		
		function onlyNumberAndEnglish(str) {
			return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
		}
		
		function strongpw (str) {
			return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/.test(str);
		}
		
		function nickLength(value) {
			return value.length >= 2
		}
		
		elInputid.onkeyup = function () {
			  // 값을 입력한 경우
			  if (elInputid.value.length !== 0) {
			    // 영어 또는 숫자 외의 값을 입력했을 경우
			    if(onlyNumberAndEnglish(elInputid.value) === false) {
			      elSuccessMessage.classList.add('hide');
			      elFailureMessage.classList.add('hide');
			      elFailureMessageTwo.classList.remove('hide'); // 영어 또는 숫자만 가능합니다
			      elFailureMessageTwo.style.color = '#C90000'; // 빨간색 글씨로 변경
			      elInputid.focus();
				  return;
			    }
			    // 글자 수가 4~12글자가 아닐 경우
			    else if(idLength(elInputid.value) === false) {
			      elSuccessMessage.classList.add('hide'); // 성공 메시지가 가려져야 함
			      elFailureMessage.classList.remove('hide'); // 아이디는 4~12글자이어야 합니다
			      elFailureMessage.style.color = '#C90000'; // 빨간색 글씨로 변경
			      elFailureMessageTwo.classList.add('hide'); // 실패 메시지2가 가려져야 함
			      elInputid.focus();
				  return;
			    }
			    // 조건을 모두 만족할 경우
			    else if(idLength(elInputid.value) || onlyNumberAndEnglish(elInputid.value)) {
			      elFailureMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
			      elFailureMessageTwo.classList.add('hide'); // 실패 메시지2가 가려져야 함
			    }
			  }
			  // 값을 입력하지 않은 경우 (지웠을 때)
			  // 모든 메시지를 가린다.
			  else {
			    elSuccessMessage.classList.add('hide');
			    elFailureMessage.classList.add('hide');
			    elFailureMessageTwo.classList.add('hide');
			    elInputid.focus();
				return;
			  }
			  
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
		
			// 중복검Esage'); // div.id-check-message.hide

			elInputid.addEventListener('input', function() {
			    let enteredId = elInputid.value;

			    // AJAX를 이용하여 서버로 아이디 중복 여부를 확인하는 요청 보내기
			    $.ajax({
			        type: 'POST',
			        url: '${cpath}/idCheck.do', // 실제로 중복검사를 처리하는 컨트롤러 주소
			        data: { id: enteredId }, // 서버로 보낼 데이터 (아이디)
			        success: function(response) {
			        	
			        	responseValue = response;
			        	
			        	if (idLength(elInputid.value) === true) {
							
			            if (response == 0 && onlyNumberAndEnglish(elInputid.value) === true) {
			            	elSuccessMessage.textContent = '사용할 수 있는 아이디입니다.';
			            	elSuccessMessage.style.color = 'green'; // 초록색 글씨로 변경
			            	elSuccessMessage.classList.remove('hide');
			            } else if (response != 0){
			            	elSuccessMessage.textContent = '이미 사용중인 아이디입니다.';
			            	elSuccessMessage.style.color = '#C90000'; // 빨간색 글씨로 변경
			            	elSuccessMessage.classList.remove('hide');
			            }
						}
			        },
			        error: function(error) {
			            console.log(error);
			        }
			    });
			});
			var form = document.form;
		    var id = document.getElementById('id');
		    var pw = document.getElementById('pw');
		    var nick = document.getElementById('nick');
			   
			function joinChk() {
				if (!idLength(elInputid.value) || !onlyNumberAndEnglish(elInputid.value) || responseValue != 0) {
		          	alert('아이디를 정확하게 입력해 주세요.');
		            id.focus();
		            return;
				}
				
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

	</script>
</body>
</html>