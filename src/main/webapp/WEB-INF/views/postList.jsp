<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
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
	.pagination>.active>a,
	.pagination>.active>a:hover {
		background-color: sandybrown;
	border-color : sandybrown;
	}
	.pagination>li>a{
	color : sandybrown;
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
<!-- 게시판 폼  -->
<div class="row" style="text-align:center";>
	<div class="col">
		<h1>게시판</h1>
		<p>게시판 설명 글</p>
	</div> 
</div>
<table class="table table-bordered table-hover" style="width : 80%; margin-left : 10%; margin-right : 10%">
	<thead>
			<tr>
				<th class = "th1" style = "width : 5%; text-align:center">번호</th>
				<th class = "th1" style = "width : 40%; text-align:center">제목</th>
				<th class = "th1" style = "width : 15%; text-align:center">작성자</th>
				<th class = "th1" style = "width : 20%; text-align:center">작성일</th>
				<th class = "th1" style = "width : 10%; text-align:center">조회수</th>
			</tr>
		</thead>
		<tbody>
			<%-- ${}: EL --%>
			<c:forEach var="pvo" items="${postlist}">
				<tr>
					<td>${pvo.post_idx}</td>
					<td>
					<a href="${cpath}/postDetail.do?post_idx=${pvo.post_idx}">${pvo.post_title} </a></td>
					<!-- 게시물에 달린 댓글 개수 표기 해주기 -->
					<td>${pvo.nick}</td> 
					<td><fmt:formatDate value="${pvo.created_at}" pattern="yyyy-MM-dd"/></td>
					<td>${pvo.post_views}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<div>

	<c:if test="${!empty mvo}">
		<button class="btn btn-primary btn-sm" onclick="location.href='${cpath}/postRegister.do<%-- ?id=${pvo.id} --%>'">글쓰기</button>
	</c:if>
</div>
				

	<!-- 페이징 처리 -->
	<div class="row" style="text-align:center">
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
				<li class="page-item"><a class="page-link" href="${pm.startPage-1}">Previous</a></li>
			</c:if>
			<c:forEach var="page" begin="${pm.startPage}" end="${pm.endPage}">
				<li class="page-item ${pm.cri.page==page ? 'active' : ''}"><a class="page-link" href="${page}">${page}</a></li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item"><a class="page-link" href="${pm.endPage+1}">Next</a></li>
			</c:if>
		</ul>
	</div>

	<form id="frm" action="${cpath}/postList.do" method="post">
		<input id="page" type="hidden" name="page" value="${pm.cri.page}"/>
		<input type="hidden" name="type" value="${pm.cri.type}"/>
		<input type="hidden" name="keyword" value="${pm.cri.keyword}"/>          
	</form>
	<script type="text/javascript">
      $(document).ready(function() {
         $(".page-link").click(function(e) {
            //preventDefault: 태그의 고유 동작(디폴트 값)을 막아주는 역할 
            e.preventDefault();
            var page = $(this).attr("href");
            $("#page").val(page);
            $("#frm").submit();
            //location.href="${cpath}/list.do?page="+page; // 너무 번거로움
         });
         
         /* 위에 있는 form을 직접 쓰기 위해서 변수에 담기 */
         var frm = $("#frm");
         $(".get").click(function(e) {
            e.preventDefault();
            var num = $(this).attr("href");
            var tag = "<input type='hidden' name='num' value='"+num+"'/>";

            // 클릭이 일어났을때만 input 태그를 추가 해준다.
            frm.append(tag);
            // 페이지 주소를 바꿔줘야 한다.
            frm.attr("action", "${cpath}/`.do");
            frm.attr("method", "get");
            frm.submit();
         });
      }); // JQuery 끝
      function goMsg() {
         $(".modal").modal("show");
      }
   </script>
   
   
   
   
   </body>
   </html>