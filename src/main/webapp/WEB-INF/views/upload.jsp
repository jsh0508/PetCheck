<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>Image Upload and Preview</title>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
	<link rel="stylesheet" href="resources/css/upload.css">

	<!-- GLOBAL MANDATORY STYLES -->
	<link href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet" type="text/css">
	<link href="resources/vendor/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
	<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	
	<!-- PAGE LEVEL PLUGIN STYLES -->
	<link href="resources/css/animate.css" rel="stylesheet">
	<link href="resources/vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css"/>
	
	<!-- THEME STYLES -->
	<link href="resources/css/layout.min.css" rel="stylesheet" type="text/css"/>
	
	<!-- Favicon -->
	<link rel="shortcut icon" href="favicon.ico"/>
	<link rel="stylesheet" href="resources/css/btn.css">
	
	<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<header class="header" style="background-color: #FFFAF3;">
		<!-- Navbar -->
		<nav class="navbar" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="menu-container">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".nav-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="toggle-icon"></span>
					</button>

					<!-- Logo -->
					<div class="logo">
						<a class="logo-wrap" href="index.html"> 
						</a>
					</div>
					<!-- End Logo -->
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-collapse">
					<div class="menu-container" style="text-align: center;">
						<!-- 폰트 적용 다시 해보기 -->
						<ul class="navbar-nav navbar-nav-right">
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="${cpath}/main.do">HOME</a></li>
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="${cpath}/upload.do">자가진단</a></li>
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
				</div>
				<!-- End Navbar Collapse -->
			</div>
		</nav>
		<!-- Navbar -->
	</header>

	<div id="root">
		<h2 class="title">File Upload</h2>
		<hr>
		<form action="http://172.30.1.65:5000/result" method="post"
			enctype="multipart/form-data" id = "uploadForm">
			<div class="contents">
				<div class="upload-box">
					<div id="drop-file" class="drag-file">
						<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png"
							alt="파일 아이콘" class="image">
						<p class="message">Drag files to upload</p>
						<img src="" alt="미리보기 이미지" class="preview">
					</div>
					<label class="file-label" for="image-input">Choose File</label> <input
						name="image" class="file" id="image-input" type="file"
						onchange="dropFile.handleFiles(this.files)"
						accept="image/png, image/jpeg, image/gif">
					<button type="button" onclick="uploadFile()">Upload</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>

<script src="resources/js/upload.js" type="text/javascript"></script>
<!-- JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- CORE PLUGINS -->
<script src="resources/vendor/jquery.min.js" type="text/javascript"></script>
<script src="resources/vendor/jquery-migrate.min.js" type="text/javascript"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<!-- PAGE LEVEL PLUGINS -->
<script src="resources/vendor/jquery.easing.js" type="text/javascript"></script>
<script src="resources/vendor/jquery.back-to-top.js" type="text/javascript"></script>
<script src="resources/vendor/jquery.smooth-scroll.js" type="text/javascript"></script>
<script src="resources/vendor/jquery.wow.min.js" type="text/javascript"></script>
<script src="resources/vendor/swiper/js/swiper.jquery.min.js" type="text/javascript"></script>
<script src="resources/vendor/masonry/jquery.masonry.pkgd.min.js" type="text/javascript"></script>
<script src="resources/vendor/masonry/imagesloaded.pkgd.min.js" type="text/javascript"></script>

<!-- PAGE LEVEL SCRIPTS -->
<script src="resources/js/layout.min.js" type="text/javascript"></script>
<script src="resources/js/components/wow.min.js" type="text/javascript"></script>
<script src="resources/js/components/swiper.min.js" type="text/javascript"></script>
<script src="resources/js/components/masonry.min.js" type="text/javascript"></script>
