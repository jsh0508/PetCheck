<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
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

<link href='resources/calendar/main.css' rel='stylesheet' />
<script src='resources/calendar/main.js'></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    	document.addEventListener('DOMContentLoaded', function() {
        	var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
                headerToolbar: {
                    left: 'prevYear,prev,next,nextYear today',
                    center: 'title',
                    right: 'dayGridMonth,dayGridWeek,dayGridDay'
                },

                selectable: true,
                selectMirror: true,

                navLinks: true, // can click day/week names to navigate views
                editable: true,
                
                dayMaxEvents: true, // allow "more" link when too many events
                
                // 이벤트 생성
                select: function(arg) { // 일정 생성
      				var title = prompt('Event Title:');
      	
				        if (title) {
				          calendar.addEvent({
				            title: title,
				            start: arg.start,
				            end: arg.end,
				            allDay: arg.allDay
				          })
				          
				          $.ajax({
				              url: "calendarInsertService",
				              data: {
				            	'title':title,  
				            	'start':arg.start,
				            	'end':arg.end,
				              },
				              success: function(data) {
				                 console.log("success");
				              },
				              error: function(xhr, status) {
				                 console.log("Failed");
				              },
				              complete: function(xhr, status) {
				                 console.log("Complete");
				              }
				          });
				          
				        }
				        calendar.unselect()
				      },
                
                
                
                
                
                // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
                events: [
                	<c:forEach var="vo" items="${list}">
                	{
                		title: '${vo.title}',
                		start: '${vo.start_at}',
                		end: '${vo.end_at}'
                	},
                	</c:forEach>
                	
                ]
            });

            calendar.render();
        });

    </script>
</head>

<body>
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
                        <div class="logo">
                            <a class="logo-wrap" href="index.html">
                               <!--  <img class="logo-img logo-img-active" src="resources/img/logo-dark.png" alt="Asentus Logo"> -->
                            </a>
                        </div>
                        <!-- End Logo -->
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse nav-collapse">
                        <div class="menu-container"
                             style="text-align: center;"> <!-- 폰트 적용 다시 해보기 -->
                            <ul class="navbar-nav navbar-nav-right">
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="${cpath}/upload.do">자가진단</a></li>
                                <li class="nav-item"><a class="nav-item-child nav-item-hover" href="${cpath}/diary.do?idx=${mvo.idx}">다이어리</a></li>
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
        
        
    <!-- calendar -->
    
	<div id='calendar' style="background-color: #FFFAF3;"></div>
	
	
	<!-- footer -->
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
</html>