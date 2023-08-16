<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Image Upload and Preview</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link rel="stylesheet" href="resources/css/upload.css">
<link rel="stylesheet" href="resources/css/form.css">
<link rel="stylesheet" href="resources/css/btn.css">
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

<body style="background-color: #FFFAF3;">
	<!--========== HEADER ==========-->
	<header class="header" style="background-color: #FFFAF3;">
		<!-- Navbar -->
		<nav class="navbar" role="navigation">
			<div class="logo">
				<a class="logo-wrap" href="${cpath}/main.do"> <img
					class="logo-img logo-img-main" src="resources/img/nocatlogo.png"
					alt="" style="width: 110px;">
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
								class="nav-item-child nav-item-hover" href="${cpath}/hospital.do">병원검색</a></li>
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
	<div class="uploadMain">
	<div id="root">
	   <h2 class="title">진단받고 싶은 아이의 사진을 올려주세요.</h2>
		 <div class="row" style="text-align:center">
		   <div class="col">
			<p> 업로드 가능한 파일 : JPG, JPEG, PNG </p><br>
			<p>업로드 된 사진과 결과는 저장되지 않아요.</p>
		   </div>
        </div>
		  <form action="http://172.30.1.65:5000/result" method="post"
			enctype="multipart/form-data" id="uploadForm">
	         <input name="image" class="form-control form-control-sm" id="image-input" type="file"
	                     onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
					       
			<div class="contents">
				<div class="upload-box">	
					<div id="drop-file" class="drag-file">
						<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png"
							alt="파일 아이콘" class="image">
						<p class="message">Drag files to upload</p>
						<img src="" alt="미리보기 이미지" class="preview">
					</div>
					 <div class="checkbtn" >
					  <button class="btn-hover color-10" type="button" onclick="uploadFile()">진단결과 확인하기</button>
                     </div>
                   <!--   <label class="file-label" for="image-input"></label>  -->
                    
                               <!--     <label class="file-label" for="image-input">파일을 선택해주세요.</label> 
               <input name="image" class="form-control form-control-sm" id="image-input" type="file"
                  onchange="dropFile.handleFiles(this.files)"
                  accept="image/png, image/jpeg, image/gif"> -->
                    
			  </div>
			</div>
		</form>
	</div>
	</div>
</body>
</html>

<script src="resources/js/upload.js" type="text/javascript"></script>
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
