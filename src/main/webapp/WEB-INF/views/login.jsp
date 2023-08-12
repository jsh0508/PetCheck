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

<!-- GLOBAL MANDATORY STYLES -->
<link
	href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700"
	rel="stylesheet" type="text/css">
<link
	href="resources/vendor/simple-line-icons/simple-line-icons.min.css"
	rel="stylesheet" type="text/css" />
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<!-- PAGE LEVEL PLUGIN STYLES -->
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/vendor/swiper/css/swiper.min.css" rel="stylesheet"
	type="text/css" />

<!-- THEME STYLES -->
<link href="resources/css/layout.min.css" rel="stylesheet"
	type="text/css" />

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" href="resources/css/btn.css">

<!-- bootstrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- 로그인 디자인 CSS -->
<link rel="stylesheet" href="resources/css/form.css">
</head> <!-- END HEAD -->

<!-- BODY -->
<body>
	<!--========== HEADER ==========-->
	<header class="header" style="background-color: #FFFAF3;">
		<!-- Navbar -->
		<nav class="navbar" role="navigation">
			<div class="logo">
				<a class="logo-wrap" href="${cpath}/main.do"> <img
					class="logo-img logo-img-main" src="resources/img/nocatlogo.png"
					alt="">
				</a>
			</div>
			<div class="menu-container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="menu-container">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".nav-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="toggle-icon"></span>
					</button>
				</div>

				<!-- 네비게이션 -->
				<div class="collapse navbar-collapse nav-collapse">
					<div class="menu-container">
						<ul class="navbar-nav navbar-nav-right">
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="pricing.html">자가진단</a></li>
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="about.html">다이어리</a></li>
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="products.html">병원검색</a></li>
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="faq.html">게시판</a></li>
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover">|</a></li>
							<c:if test="${empty mvo}">
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover" href="${cpath}/login.do">로그인</a></li>
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover"
									href="${cpath}/memberjoin.do">회원가입</a></li>
							</c:if>
							<c:if test="${!empty mvo}">
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover" href="${cpath}/logout.do">로그아웃</a></li>
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover"
									href="${cpath}/myPage.do?idx=${mvo.idx}">내 정보</a></li>

							</c:if>
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="products.html"><i
									class="bi bi-person"></i></a></li>
						</ul>
					</div>
				</div> <!-- End Navbar Collapse -->
			</div>
		</nav> <!-- Navbar -->
	</header> <!--========== END HEADER ==========-->
	
<body>
	<div class="main">
		<p class="sign" align="center">Sign in</p>
		<div class="login">
			<form action="${cpath}/login.do" method="post" class="form1">
				<input type="text" id="id" name="id" class="un" align="center"
					placeholder="아이디를 입력해주세요"> 
			    <input type="password" id="pw"
					name="pw" class="pass" placeholder="비밀번호를 입력해주세요"> 
			    <a href="${cpath}/main.do" class="submit" align="left">로그인</a><br><br>
			</form>
		</div>
		<p class="intro-1" align="center">ㅡㅡㅡㅡㅡㅡ 간편로그인 / 회원가입 ㅡㅡㅡㅡㅡㅡ
		<p>
		<!-- <div class="apilogin"> -->
		<!-- 	<div class="naverlogo"> -->
				<button type="submit" class="apiLogo" href="javascript:void(0)"
					id="naverIdLogin_loginButton" align="center"> <img
					src="resources/img/naver0.png" alt="네이버 간편 로그인" class="naver"/>
				</button>
<!-- 			</div> -->
<!-- 			<div class="kakaologo"> -->
				<button type="button" class="apiLogo" href="javascript:kakaoLogin();" align="center">
					<img src="resources/img/kakao0.png" alt="카카오 간편 로그인" class="kakao"/>
				</button>
<!-- 			</div> -->
			<p class="intro-2" align="center">아직 PetCheck 회원이 아니신가요?
			<p>
			<div class="join">
				<a class="joinus" align="center"
					onclick="location.href='${cpath}/memberjoin.do'">회원가입하기</a>
			</div>
	<!-- 	</div> -->

	</div>
	<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "Eo_FUlEBW8bHSlohztQD", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8181/main.do", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		var nick = naverLogin.user.getNick();
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

/* function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
} */
</script>

	<script>
    window.Kakao.init('0cbbc520fc8aaa3c1adfb65f2f39c106');

    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
            success: function(response) {
                console.log(response) // 로그인 성공하면 받아오는 데이터
                window.Kakao.API.request({ // 사용자 정보 가져오기 
                    url: '/v2/user/me',
                    success: (res) => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account)
              		// window.location.href='/pc/main.do' //리다이렉트 되는 코드
                    }
                });
            },
            fail: function(error) {
                console.log(error);
            }
        });
    }
</script>
	</script>
</body>
</html>