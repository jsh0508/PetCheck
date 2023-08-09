<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
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
        <meta charset="utf-8"/>
        <title>PetCheck</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta content="" name="description"/>
        <meta content="" name="author"/>

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
    <!-- END HEAD -->

    <!-- BODY -->
    <body>
        <!--========== HEADER ==========-->
        <header class="header" style="background-color: #FFFAF3;">
            <!-- Navbar -->
            <nav class="navbar" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="menu-container">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="toggle-icon"></span>
                        </button>

                        <!-- Logo -->
                        <!-- <div class="logo">
                            <a class="logo-wrap" href="index.html">
                                <img class="logo-img logo-img-main" src="resources/img/logo1.png" alt="">
                                <img class="logo-img logo-img-active" src="resources/img/logo-dark.png" alt="Asentus Logo">
                            </a>
                        </div> -->
                        <!-- End Logo -->
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse nav-collapse">
                        <div class="menu-container"
                             style="text-align: center;"> <!-- 폰트 적용 다시 해보기 -->
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
        <!--========== END HEADER ==========-->

        <!--========== SLIDER ==========-->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- <div class="container">
                Indicators
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                </ol>
            </div> -->

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img class="img-responsive" src="resources/img/1920x1080/main03.png" alt="Slider Image">
                    <div class="container">
                        <div class="carousel-centered">
                            <!-- <div class="margin-b-40">
                                <h1 class="carousel-title"></h1>
                                <p>반려묘의 오버그루밍이 심하거나,<br>반려견의 피부질환이 의심되시나요?<br>지금 바로 직접 촬영하여 자가진단을 해보세요!</p>
                            </div>
                           <div class="buttons">
                          <button class="btn-hover color-10">진단하기</button>
                      </div> -->
                            
                           
                            
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <!--========== SLIDER ==========-->

        <!--========== PAGE LAYOUT ==========-->
        <!-- Service -->
        <div class="bg-color-sky-light" data-auto-height="true">
            <div class="content-lg container">
                <div class="row row-space-5" style="margin: 30px;">
                    <div class="col-sm-3 sm-margin-b-30">
                        <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".3s">
                            <div class="service" data-height="height">
                                <div class="service-element" style="margin-bottom: 15px;">
                                    <!-- <i class="service-icon icon-chemistry"></i> -->
                                    <i class="bi bi-journal-plus" style="font-size: 35px;"></i>
                                </div>
                                <div class="service-info">
                                    <h3>건강관리 다이어리</h3>
                                    <p class="margin-b-5">반려동물 건강을 관리해요.</p>
                                </div>
                                <a href="#" class="content-wrapper-link"></a>    
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 sm-margin-b-2">
                        <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".2s">
                            <div class="service" data-height="height">
                                <div class="service-element" style="margin-bottom: 15px;">
                                    <!-- <i class="service-icon icon-screen-tablet"></i> -->
                                    <i class="bi bi-people" style="font-size: 35px;"></i>
                                </div>
                                <div class="service-info">
                                    <h3>반려인 커뮤니티</h3>
                                    <p class="margin-b-5">반려인들과<br>정보를 공유해요.</p>
                                </div>
                                <a href="#" class="content-wrapper-link"></a>    
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 sm-margin-b-30">
                        <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".4s">
                            <div class="service" data-height="height">
                                <div class="service-element" style="margin-bottom: 15px;">
                                    <!-- <i class="service-icon icon-notebook"></i> -->
                                    <i class="bi bi-search-heart" style="font-size: 35px;"></i>
                                </div>
                                <div class="service-info">
                                    <h3>주변 동물 병원 검색</h3>
                                    <p class="margin-b-5">인근 동물 병원 정보를<br>확인할 수 있어요.</p>
                                </div>
                                <a href="#" class="content-wrapper-link"></a>    
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 sm-margin-b-2">
                        <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".5s">
                            <div class="service" data-height="height">
                                <div class="service-element" style="margin-bottom: 15px;">
                                    <!-- <i class="service-icon icon-speedometer"></i> -->
                                    <i class="bi bi-robot" style="font-size: 35px;"></i>
                                </div>
                                <div class="service-info">
                                    <h3>PetCheck 챗봇</h3>
                                    <p class="margin-b-5">궁금한 것을<br>챗봇에게 물어보세요!</p>
                                </div>
                                <a href="#" class="content-wrapper-link"></a>    
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                <!--// end row -->

                <!-- <div class="row row-space-3" style="margin: 30px;">
                    <div class="col-sm-6 sm-margin-b-30">
                        <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".4s">
                            <div class="service" data-height="height">
                                <div class="service-element" style="margin-bottom: 15px;">
                                    <i class="service-icon icon-notebook"></i>
                                    <i class="bi bi-search-heart" style="font-size: 35px;"></i>
                                </div>
                                <div class="service-info">
                                    <h3>주변 동물 병원 검색</h3>
                                    <p class="margin-b-5">병원 내원이 필요한 질환일 경우,<br>주변 동물 병원을 검색해보세요.<br>인근 동물 병원 정보를<br>확인할 수 있어요.</p>
                                </div>
                                <a href="#" class="content-wrapper-link"></a>    
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 sm-margin-b-2">
                        <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".5s">
                            <div class="service" data-height="height">
                                <div class="service-element" style="margin-bottom: 15px;">
                                    <i class="service-icon icon-speedometer"></i>
                                    <i class="bi bi-robot" style="font-size: 35px;"></i>
                                </div>
                                <div class="service-info">
                                    <h3>PetCheck 챗봇</h3>
                                    <p class="margin-b-5">반려동물의 피부 건강에 대해<br>궁금한 것을<br>챗봇에게 물어보세요!</p>
                                </div>
                                <a href="#" class="content-wrapper-link"></a>    
                            </div>
                        </div>
                    </div>
                    
                </div> -->
                <!--// end row -->
            </div>
        </div>
       
        <!--========== END PAGE LAYOUT ==========-->

        <!--========== FOOTER ==========-->
        
	<footer>
		<div class="inner">
			<div class="footer-contact">
			<a href="https://github.com/jsh0508/PetCheck" target="_blank">
			<i class="bi bi-github"></i>
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

    </body>
    <!-- END BODY -->
</html>