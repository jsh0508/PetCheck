<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html lang="en">


<!-- HEAD -->
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.btn-primary,
.btn-primary:hover {
	background-color: sandybrown;
	border-color : sandybrown;
	}

</style>

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
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="${cpath}/upload.do">자가진단</a></li>
							<c:if test="${empty mvo}">
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover" href="">다이어리</a></li>
							</c:if>
							<c:if test="${!empty mvo}">
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover"
									href="${cpath}/diary2.do?idx=${mvo.idx}&id=${mvo.id}">다이어리</a></li>
							</c:if>
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover"
								href="${cpath}/hospital.do">병원검색</a></li>
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="${cpath}/postList.do">게시판</a></li>
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
						</ul>
					</div>
				</div>
				<!-- End Navbar Collapse -->
			</div>
		</nav>
		<!-- Navbar -->
	</header>
	
	<div class="row" style="text-align:center";>
		<h1>게시물 수정하기</h1>
</div>

	<form action="${cpath}/postModify.do" method="post">
		<input type="hidden" name="post_idx" value="${pvo.post_idx}"/>
		<input type="hidden" name="page" value="${cri.page}"/>
		<input type="hidden" name="type" value="${cri.type}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"/>
		
		<label>제목</label>
		<input type="text" name="post_title" class="form-control" value="${pvo.post_title}"/>
		<label>작성자</label>
		<input type="text" name="nick" class="form-control" value="${pvo.nick}" readonly/>
		<label>내용</label>
		<textarea rows="10" name="post_content" class="form-control">${pvo.post_content}</textarea>  
		<br/>
 		<div class="row" style="text-align: center">
		<button type="submit" class="btn btn-primary btn-sm">수정하기 </button>
		<button type="reset" class="btn btn-warning btn-sm">재입력</button>
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${cpath}/postList.do'">목록</button>
		</div>
	</form>
</body>
</html>