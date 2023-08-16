<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
        
        <link rel="stylesheet" href="resources/css/chatbot.css">
    </head>
    <!-- END HEAD -->

	<!-- BODY -->
	<body>
		<!--========== HEADER ==========-->
		<header class="header" style="background-color: #FFFAF3;">
			<!-- Navbar -->
			<nav class="navbar" role="navigation">
				<div class="logo">
					<a class="logo-wrap" href="${cpath}/main.do" style="margin-top:10px"> 
						<img class="logo-img logo-img-main" src="resources/img/nocatlogo.png" alt="">
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
							<li class="nav-item"><a	class="nav-item-child nav-item-hover" href="${cpath}/upload.do">자가진단</a></li>
							<c:if test="${empty mvo}">
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover" href="">다이어리</a></li>
							</c:if>
							<c:if test="${!empty mvo}">
								<li class="nav-item"><a
									class="nav-item-child nav-item-hover"
									href="${cpath}/diary.do?idx=${mvo.idx}">다이어리</a></li>
							</c:if>
							<li class="nav-item"><a	class="nav-item-child nav-item-hover" href="${cpath}/hospital.do">병원검색</a></li>
							<li class="nav-item"><a	class="nav-item-child nav-item-hover" href="faq.html">게시판</a></li>
							<li class="nav-item"><a	class="nav-item-child nav-item-hover">|</a></li>
							<c:if test="${empty mvo}">
								<li class="nav-item"><a	class="nav-item-child nav-item-hover" href="${cpath}/login.do">로그인</a></li>
								<li class="nav-item"><a	class="nav-item-child nav-item-hover" href="${cpath}/memberjoin.do">회원가입</a></li>
							</c:if>
							<c:if test="${!empty mvo}">
								<li class="nav-item"><a	class="nav-item-child nav-item-hover" href="${cpath}/logout.do">로그아웃</a></li>
								<li class="nav-item"><a class="nav-item-child nav-item-hover" href="${cpath}/myPage.do?idx=${mvo.idx}">내 정보</a></li>

							</c:if>
							<li class="nav-item"><a	class="nav-item-child nav-item-hover" href="products.html"><i class="bi bi-person"></i></a></li>
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
	 	<div class="carousel-inner" role="listbox">
	     	<div class="item active">
	         	<img class="img-responsive" src="resources/img/1920x1080/mmain.png" alt="Slider Image">
	                <div class="container">
	<div class="row">
			<div class="carousel-centered">
	                      	<p>습한 여름철,<br>땀샘이 없는 고양이와 개는 피부질환에 노출되기 쉽습니다.<br><br>
	                      나의 소중한 반려동물의 피부가 걱정되시나요?<br>
	                      지금 바로 촬영하여 자가진단해보세요!<p>
	                    </div>
	</div>
	                   <div class="row buttons">
	                     <button class="btn-hover color-10">자가진단 시작하기</button>
	                   </div>
	                </div>
	         </div>   
	    </div>
	 </div>
	 
	 <!-- chatbot 버튼과 채팅창 -->
	 <div class="fixed-button" id="chat-toggle">
        <button id="scroll-top-button" style="background: none;"><i class="bi bi-robot" style="font-size: 50px;"></i></button>
    </div>
    
    <div id="chat-container">
    	<button id="close-chat-button" onclick="closeChat();">X</button>
		<div id="chat-messages"></div>
		<div id="user-input">
			<input type="text" placeholder="메시지를 입력하세요..." />
			<button>전송</button>
		</div>
	</div>
    
	<!--========== PAGE LAYOUT ==========-->
	<!-- 서비스 소개 -->
	<div class="bg-color-sky-light" data-auto-height="true">
	    <div class="content-lg container">
	            <div class="col-sm-3 sm-margin-b-30">
	                <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".3s">
	                    <div class="service" data-height="height">
	                        <div class="flex" style="margin-bottom: 15px;">
	                            <i class="bi bi-journal-plus" style="font-size: 35px;"></i>
	                        </div>
	                          <div class="service-info">
	                            <h3>건강관리<br>다이어리</h3>
	                            <p class="intro">반려동물<br>건강관리를<br>가족과 함께<br>할 수 있어요</p>
	                          </div>
	                        <a href="#" class="content-wrapper-link"></a>    
	                    </div>
	                </div>
	            </div>
	            <div class="col-sm-3 sm-margin-b-2">
	                <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".2s">
	                    <div class="service" data-height="height">
	                        <div class="flex" style="margin-bottom: 15px;">
	                            <i class="bi bi-people" style="font-size: 35px;"></i>
	                        </div>
	                          <div class="service-info">
	                            <h3>반려인<br>커뮤니티</h3>
	                            <p class="intro">반려인들과<br>양육 꿀팁을<br> 나누고<br> 소통해요</p>
	                          </div>
	                        <a href="#" class="content-wrapper-link"></a>    
	                    </div>
	                </div>
	            </div>
	            <div class="col-sm-3 sm-margin-b-30">
	                <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".4s">
	                    <div class="service" data-height="height">
	                        <div class="flex" style="margin-bottom: 15px;">
	                            <i class="bi bi-search-heart" style="font-size: 35px;"></i>
	                        </div>
	                          <div class="service-info">
	                            <h3>주변 동물<br>병원 검색</h3>
	                            <p class="intro">내 주변<br>동물 병원 정보를<br>확인해보세요.</p>
	                          </div>
	                        <a href="#" class="content-wrapper-link"></a>    
	                    </div>
	                </div>
	            </div>
	            <div class="col-sm-3 sm-margin-b-2">
	                <div class="wow fadeInLeft" data-wow-duration=".3" data-wow-delay=".5s">
	                    <div class="service" data-height="height">
	                        <div class="flex" style="margin-bottom: 15px;">
	                            <i class="bi bi-robot" style="font-size: 35px;"></i>
	                        </div>
	                          <div class="service-info">
	                            <h3>PetCheck<br>챗봇</h3>
	                            <p class="intro">멍냥이에 대한 <br>A to Z !<br> 챗봇이 궁금증을 해결해줄게요.</p>
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
			<a href="https://github.com/jsh0508/PetCheck" target="_blank">
			<i class="bi bi-github"></i>
			</a>
			</div>
			<div class="footer-copyright">독하고묘한팀</div>
		</div>
	</footer>
        
        <!--========== END FOOTER ==========-->


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
		
		
		<script>
			// 채팅 메시지를 표시할 DOM
			const chatMessages = document.querySelector('#chat-messages');
			// 사용자 입력 필드
			const userInput = document.querySelector('#user-input input');
			// 전송 버튼
			const sendButton = document.querySelector('#user-input button');
			// 발급받은 OpenAI API 키를 변수로 저장 (하드코딩 불가 github에 올릴 때 문제가 생김)
			const apiKey = '<%=System.getenv("apikey")%>';
			// OpenAI API 엔드포인트 주소를 변수로 저장
			const apiEndpoint = 'https://api.openai.com/v1/chat/completions';
			function addMyMessage(sender, message) {
				// 새로운 div 생성
				const messageElement = document.createElement('div');
				// 생성된 요소에 클래스 추가
				messageElement.className = 'mymessage';
				// 채팅 메시지 목록에 새로운 메시지 추가
				messageElement.textContent = sender + ": " + message;
				chatMessages.prepend(messageElement);
			}

			function addChatbotMessage(sender, message) {
				// 새로운 div 생성
				const messageElement = document.createElement('div');
				// 생성된 요소에 클래스 추가
				messageElement.className = 'chatbotmessage';
				// 채팅 메시지 목록에 새로운 메시지 추가
				messageElement.textContent = sender + ": " + message;
				chatMessages.prepend(messageElement);
			}

			// ChatGPT API 요청
			async function fetchAIResponse(prompt) {
				// API 요청에 사용할 옵션을 정의
				const requestOptions = {
					method: 'POST',
					// API 요청의 헤더를 설정
					headers: {
						'Content-Type': 'application/json',
						'Authorization': "Bearer " + apiKey
					},
					body: JSON.stringify({
						model: "gpt-3.5-turbo",  // 사용할 AI 모델
						messages: [{
							role: "user", // 메시지 역할을 user로 설정
							content: prompt // 사용자가 입력한 메시지
						},],
						temperature: 0.8, // 모델의 출력 다양성
						max_tokens: 1024, // 응답받을 메시지 최대 토큰(단어) 수 설정
						top_p: 1, // 토큰 샘플링 확률을 설정
						frequency_penalty: 0.5, // 일반적으로 나오지 않는 단어를 억제하는 정도
						presence_penalty: 0.5, // 동일한 단어나 구문이 반복되는 것을 억제하는 정도
						stop: ["Human"], // 생성된 텍스트에서 종료 구문을 설정
					}),
				};
				// API 요청후 응답 처리
				try {
					const response = await fetch(apiEndpoint, requestOptions);
					const data = await response.json();
					const aiResponse = data.choices[0].message.content;
					return aiResponse;
				} catch (error) {
					console.error('OpenAI API 호출 중 오류 발생:', error);
					return 'OpenAI API 호출 중 오류 발생';
				}
			}
			// 전송 버튼 클릭 이벤트 처리
			sendButton.addEventListener('click', async () => {
				// 사용자가 입력한 메시지
				const message = userInput.value.trim();
				// 메시지가 비어있으면 리턴
				if (message.length === 0) return;
				// 사용자 메시지 화면에 추가
				addMyMessage('나', message);
				userInput.value = '';
				//ChatGPT API 요청후 답변을 화면에 추가
				const aiResponse = await fetchAIResponse(message);
				addChatbotMessage('반려도우미', aiResponse);
			});
			// 사용자 입력 필드에서 Enter 키 이벤트를 처리
			userInput.addEventListener('keydown', (event) => {
				if (event.key === 'Enter') {
					sendButton.click();
				}
			});

			// 챗봇 버튼 누르면 채팅창 슬라이딩 기능
			document.addEventListener("DOMContentLoaded", function() {
				const chatToggle = document.getElementById("chat-toggle");
				const chatContainer = document.getElementById("chat-container");
				chatToggle.addEventListener("click", function() {
					chatContainer.classList.toggle("open");
				});
			});

			// 채팅창 안에 닫기 버튼 함수
			function closeChat() {
				const chatContainer = document.getElementById("chat-container");
				chatContainer.classList.toggle("open");
			}

		</script>
    </body>
    <!-- END BODY -->
</html>