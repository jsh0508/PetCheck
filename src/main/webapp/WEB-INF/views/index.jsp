<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!-- ==============================
    Project:        Metronic "Asentus" Frontend Freebie - Responsive HTML Template Based On Twitter Bootstrap 3.3.4
    Version:        1.0
    Author:         KeenThemes
    Primary use:    Corporate, Business Themes.
    Email:          support@keenthemes.com
    Follow:         http://www.twitter.com/keenthemes
    Like:           http://www.facebook.com/keenthemes
    Website:        http://www.keenthemes.com
    Premium:        Premium Metronic Admin Theme: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
================================== -->
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
</head>
<!-- END HEAD -->

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

					<!-- Logo -->
					<div class="logo">
						<a class="logo-wrap" href="index.html"> <!--  <img class="logo-img logo-img-active" src="resources/img/logo-dark.png" alt="Asentus Logo"> -->
						</a>
					</div>
					<!-- End Logo -->
				</div>

				<!-- 네비게이션 -->
				<div class="collapse navbar-collapse nav-collapse">
					<div class="menu-container">
						<ul class="navbar-nav navbar-nav-right">
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="${cpath}/upload.do">자가진단</a></li>
							<c:if test="${empty mvo}">
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover" href="">다이어리</a></li>
							</c:if>
							<c:if test="${!empty mvo}">
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover"
									href="${cpath}/diary.do?idx=${mvo.idx}">다이어리</a></li>
							</c:if>
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
				</div>
				<!-- End Navbar Collapse -->
			</div>
		</nav>
		<!-- Navbar -->
	</header>
	<!--========== END HEADER ==========-->

	<!--========== SLIDER ==========-->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="img-responsive" src="resources/img/1920x1080/mmain.png"
					alt="Slider Image">
				<div class="container">
					<div class="carousel-centered">
						<p>
							습한 여름철,<br>땀샘이 없는 고양이와 개는 피부질환에 노출되기 쉽습니다.<br> <br>
							나의 소중한 반려동물의 피부가 걱정되시나요?<br> 지금 바로 촬영하여 자가진단해보세요!
						<p>
					</div>
					<div class="buttons">
						<button class="btn-hover color-10">자가진단 시작하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--========== PAGE LAYOUT ==========-->
	<!-- 서비스 소개 -->
	<div class="bg-color-sky-light" data-auto-height="true">
		<div class="content-lg container">
			<div class="col-sm-3 sm-margin-b-30">
				<div class="wow fadeInLeft" data-wow-duration=".3"
					data-wow-delay=".3s">
					<div class="service" data-height="height">
						<div class="flex" style="margin-bottom: 15px;">
							<i class="bi bi-journal-plus" style="font-size: 35px;"></i>
						</div>
						<div class="service-info">
							<h3>
								건강관리<br>다이어리
							</h3>
							<p class="intro">
								반려동물<br>건강관리를<br>가족과 함께<br>할 수 있어요
							</p>
						</div>
						<a href="#" class="content-wrapper-link"></a>
					</div>
				</div>
			</div>
			<div class="col-sm-3 sm-margin-b-2">
				<div class="wow fadeInLeft" data-wow-duration=".3"
					data-wow-delay=".2s">
					<div class="service" data-height="height">
						<div class="flex" style="margin-bottom: 15px;">
							<i class="bi bi-people" style="font-size: 35px;"></i>
						</div>
						<div class="service-info">
							<h3>
								반려인<br>커뮤니티
							</h3>
							<p class="intro">
								반려인들과<br>양육 꿀팁을<br> 나누고<br> 소통해요
							</p>
						</div>
						<a href="#" class="content-wrapper-link"></a>
					</div>
				</div>
			</div>
			<div class="col-sm-3 sm-margin-b-30">
				<div class="wow fadeInLeft" data-wow-duration=".3"
					data-wow-delay=".4s">
					<div class="service" data-height="height">
						<div class="flex" style="margin-bottom: 15px;">
							<i class="bi bi-search-heart" style="font-size: 35px;"></i>
						</div>
						<div class="service-info">
							<h3>
								주변 동물<br>병원 검색
							</h3>
							<p class="intro">
								내 주변<br>동물 병원 정보를<br>확인해보세요.
							</p>
						</div>
						<a href="#" class="content-wrapper-link"></a>
					</div>
				</div>
			</div>
			<div class="col-sm-3 sm-margin-b-2">
				<div class="wow fadeInLeft" data-wow-duration=".3"
					data-wow-delay=".5s">
					<div class="service" data-height="height">
						<div class="flex" style="margin-bottom: 15px;">
							<i class="bi bi-robot" style="font-size: 35px;"></i>
						</div>
						<div class="service-info">
							<h3>
								PetCheck<br>챗봇
							</h3>
							<p class="intro">
								멍냥이에 대한 <br>A to Z !<br> 챗봇이 궁금증을 해결해줄게요.
							</p>
						</div>
						<a href="#" class="content-wrapper-link"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--========== END PAGE LAYOUT ==========-->

	<!--========== FOOTER ==========-->

	<footer>
		<div class="inner">
			<div class="footer-contact">
				<a href="https://github.com/jsh0508/PetCheck" target="_blank"> <i
					class="bi bi-github"></i>
				</a>
			</div>
			<div class="footer-copyright">독하고묘한팀</div>
		</div>
	</footer>

	<!--========== END FOOTER ==========-->

	<!-- Back To Top -->
	<a href="javascript:void(0);" class="js-back-to-top back-to-top">Top</a>

	<!-- JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- CORE PLUGINS -->
	<script src="resources/vendor/jquery.min.js" type="text/javascript"></script>
	<script src="resources/vendor/jquery-migrate.min.js"
		type="text/javascript"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>

	<!-- PAGE LEVEL PLUGINS -->
	<script src="resources/vendor/jquery.easing.js" type="text/javascript"></script>
	<script src="resources/vendor/jquery.back-to-top.js"
		type="text/javascript"></script>
	<script src="resources/vendor/jquery.smooth-scroll.js"
		type="text/javascript"></script>
	<script src="resources/vendor/jquery.wow.min.js" type="text/javascript"></script>
	<script src="resources/vendor/swiper/js/swiper.jquery.min.js"
		type="text/javascript"></script>
	<script src="resources/vendor/masonry/jquery.masonry.pkgd.min.js"
		type="text/javascript"></script>
	<script src="resources/vendor/masonry/imagesloaded.pkgd.min.js"
		type="text/javascript"></script>

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="resources/js/layout.min.js" type="text/javascript"></script>
	<script src="resources/js/components/wow.min.js" type="text/javascript"></script>
	<script src="resources/js/components/swiper.min.js"
		type="text/javascript"></script>
	<script src="resources/js/components/masonry.min.js"
		type="text/javascript"></script>

</body>
<!-- END BODY -->
</html>