<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
         <!--========== HEADER ==========-->
        <header class="header" style="background-color: #FFFAF3;">
            <!-- Navbar -->
            <nav class="navbar" role="navigation">
              <div class="logo">
                 <a class="logo-wrap" href="index.html">
                   <img class="logo-img logo-img-main" src="resources/img/nocatlogo.png" alt="">
                 </a>
              </div>
               <div class="menu-container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="menu-container">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
                          <span class="sr-only">Toggle navigation</span>
                          <span class="toggle-icon"></span>
                        </button>

                        <!-- 로고 -->
                       <!--  <div class="logo">
                          <a class="logo-wrap" href="index.html">
                            <img class="logo-img logo-img-main" src="resources/img/nocatlogo.png" alt="">
                          </a>
                        </div> -->
                    </div>

                    <!-- 네비게이션 -->
                    <div class="collapse navbar-collapse nav-collapse">
                        <div class="menu-container">
                            <ul class="navbar-nav navbar-nav-right">
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="pricing.html">자가진단</a></li>
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="about.html">다이어리</a></li>
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="products.html">병원검색</a></li>
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="faq.html">게시판</a></li>
                                <li class="nav-item"><a class="nav-item-child nav-item-hover">|</a></li>                   
                                <c:if test="${empty mvo}">
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="${cpath}/login.do">로그인</a></li>
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="${cpath}/memberjoin.do">회원가입</a></li>
                                </c:if>    
                                <c:if test="${!empty mvo}">
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="${cpath}/logout.do">로그아웃</a></li>
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="${cpath}/myPage.do?idx=${mvo.idx}">내 정보</a></li>
                                
                                </c:if>         
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="products.html"><i class="bi bi-person"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- End Navbar Collapse -->
                </div>
            </nav>
            <!-- Navbar -->
        </header>
        
	<form action="${cpath}/memberjoin.do" method="post">
		<label for="id">아이디 : </label>
		<input type="text" id="id" name="id" class="form-control">
		<hr>
		<label for="pw">비밀번호 : </label>
		<input type="password" id="pw" name="pw" class="form-control">
		<hr>
		<label for="nick">닉네임 : </label>
		<input type="text" id="nick" name="nick" class="form-control">
		<hr>
		<button type="submit" class="btn btn-primary btn-sm">완료</button>
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${cpath}/main.do'">돌아가기</button>
	</form>

</body>
</html>