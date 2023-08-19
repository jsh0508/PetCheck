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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- 로그인 디자인 CSS -->
<link rel="stylesheet" href="resources/css/form.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head> <!-- END HEAD -->

<!-- BODY -->
<body>
   <!--========== HEADER ==========-->
   <header class="header" style="background-color: #FFFAF3;">
      <!-- Navbar -->
      <nav class="navbar" role="navigation">
        <div class="logo">
          <a class="logo-wrap" href="${cpath}/main.do"> 
          <img class="logo-img logo-img-main" src="resources/img/nocatlogo.png" alt="로고">
          </a>
        </div>
         <div class="menu-container">
            <!-- Brand and toggle get grouped for better mobile display -->
          <div class="menu-container">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                  data-target=".nav-collapse">
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
         <form action="${cpath}/login.do" method="post" name="form1" class="form1">
            <div class="failure-message hide" style="text-align: center;">아이디는 4~12자 사이로 입력해 주세요.</div>
            <input type="text" id="id" name="id" class="un" align="center"
               placeholder="아이디를 입력해주세요"> 
             <div class="strongpw-message hide" style="text-align: center;">비밀번호는 8~15자 사이로 입력해 주세요.</div> 
             <input type="password" id="pw"
               name="pw" class="pass" placeholder="비밀번호를 입력해주세요"> 
             <button id="login_submit" type="button" class="submit" align="center" onclick="loginChk();">로그인하기</button><br><br>
         </form>
      </div>
      <p class="intro-1" align="center">ㅡㅡㅡㅡㅡㅡ 간편로그인 / 회원가입 ㅡㅡㅡㅡㅡㅡ
      <p>
      <div class="kakaonaver">
            <a type="button" class="apiLogo" href="javascript:naver_Login();" align="center">
            	<img src="resources/img/naver0.png" alt="네이버 간편 로그인" class="naver"/>
            </a>
			<!-- 카카오 로그인 버튼 -->
			<a type="button" class="apiLogo" href="javascript:kakaoLogin();" align="center">
			<img src="resources/img/kakao0.png" alt="카카오 간편 로그인" class="kakao"/>
			</a>
      </div>
         <p class="intro-2" align="center">아직 PetCheck 회원이 아니신가요?
         <p>
         <div class="join">
            <a class="joinus" align="center"
               onclick="location.href='${cpath}/memberjoin.do'">회원가입하기</a>
         </div>

   </div>
   <form id="frm" action="${cpath}/snsJoin.do" method="post">
   	<input type="hidden" name="sns_id" id="sns_id">
   	<input type="hidden" name="nick" id="nick">
   	<input type="hidden" name="sns_type" id="sns_type">
   </form>
   <script>
		// 1. 아이디 입력창 정보 가져오기
		let elInputid = document.querySelector('#id'); // input#id
		// 3. 실패 메시지 정보 가져오기 (글자수 제한 4~12글자)
		let elFailureMessage = document.querySelector('.failure-message'); // div.failure-message.hide
		
		// 1. 비밀번호 입력창 정보 가져오기
		let elInputpw = document.querySelector('#pw'); // input#pw
		// 2. 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자, 특수문자 미사용)
		let elStrongpwMessage = document.querySelector('.strongpw-message'); // div.strongpw-message.hide
		
		function idLength(value) {
			return value.length >= 4 && value.length <= 12
		}
		
		function pwLength(value) {
			return value.length >= 8 && value.length <= 15
		}
		
		elInputid.onkeyup = function () {
			
			if (elInputid.value.length !== 0) {
				if (idLength(elInputid.value) === false) {
					elFailureMessage.classList.remove('hide'); // 아이디는 4~12글자이어야 합니다
					elFailureMessage.style.color = '#C90000'; // 빨간색 글씨로 변경
				} else {
					elFailureMessage.classList.add('hide');
				}
			} else {
				elFailureMessage.classList.add('hide');
			}
		}
		
		elInputpw.onkeyup = function () {
			
			if (elInputpw.value.length !== 0) {
				if (pwLength(elInputpw.value) === false) {
					elStrongpwMessage.classList.remove('hide'); // 비밀번호는 8~15글자이어야 합니다
					elStrongpwMessage.style.color = '#C90000'; // 빨간색 글씨로 변경
				} else {
					elStrongpwMessage.classList.add('hide');
				}
			} else {
				elStrongpwMessage.classList.add('hide');
			}
		}
		var form = document.form1;
		function loginChk() {
			form.submit();
		}
		
		    $(document).ready(function() {
		        let message = "${msg}";
		        if (message != "") {
		            alert(message);
		        }else {
		        }
		    })
		   
		
		window.Kakao.init("0cbbc520fc8aaa3c1adfb65f2f39c106");
		
		function kakaoLogin(){
			window.Kakao.Auth.login({
				scope: 'profile_nickname, account_email',
				success: function(authObj){
					window.Kakao.API.request({
						url: '/v2/user/me',
						success: res => {
							const sns_id = res.kakao_account.email;
							const nick = res.properties.nickname;
							const sns_type = 'kakao';
							
							console.log(sns_id);
							console.log(nick);
							console.log(sns_type);
							
							$('#sns_id').val(sns_id);
							$('#nick').val(nick);
							$('#sns_type').val(sns_type);
							$("#frm").submit();
							
						}
					});
				}
			});
		}
		function naver_Login() {
		var naverLogin;
			
			naverLogin = new naver.LoginWithNaverId(
					{
						clientId: "Eo_FUlEBW8bHSlohztQD",
				        callbackUrl: "http://localhost:8081/PetCheck/main.do",
						isPopup: false,
						callbackHandle: true
					}
				);	
	
			naverLogin.init();
	
				naverLogin.getLoginStatus(function (status) {
					if (status) {
						var id = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
						var nickname = naverLogin.user.getNickName(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
						var sns_type = 'naver';
						
						console.log(naverLogin.user); 
						console.log(sns_type); 
			    		
			            if( id == undefined || id == null) {
							alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
							naverLogin.reprompt();
							return;
						} else {
			                // AJAX 요청을 통해 컨트롤러에 정보 전송
							const sns_id = id;
							const nick = nickname;
							const sns_type = 'naver';
							
							console.log(sns_id);
							console.log(nick);
							console.log(sns_type);
							
							$('#sns_id').val(sns_id);
							$('#nick').val(nick);
							$('#sns_type').val(sns_type);
							$("#frm").submit();
			            }
					} else {
						console.log("callback 처리에 실패하였습니다.");
					}
				});
	
	
			var testPopUp;
			function openPopUp() {
			    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
			}
			function closePopUp(){
			    testPopUp.close();
			}
	
			function naverLogout() {
				openPopUp();
				setTimeout(function() {
					closePopUp();
					}, 1000);
				
				
			}
		
		}
		
		
		
		
		
/* 		function naverLogin() {
		    var naverLogin = new naver.LoginWithNaverId({
		    	clientId: "Eo_FUlEBW8bHSlohztQD",
		        callbackUrl: "http://localhost:8081/PetCheck/login.do",
		        isPopup: false,
		        callbackHandle: true
		    });

		    naverLogin.init();

		    naverLogin.getLoginStatus(function (status) {
		        if (status) {
		            naverLogin.getLoginStatus(function (status) {
		                if (status) {
		                    naverLogin.getUserProfile(function (userInfo) {
		                        var sns_id = userInfo.email;
		                        var sns_nick = userInfo.nickname;
		                        var sns_type = 'naver';

		                        // 로그인 성공 처리
		                        handleLoginSuccess(sns_id, sns_nick, sns_type);
		                    });
		                } else {
		                    // 로그인 실패 처리
		                    handleLoginFailure();
		                }
		            });
		        }
		    });
		}

		function handleLoginSuccess(sns_id, sns_nick, sns_type) {
		    var userInfo = {
		        sns_id: sns_id,
		        nick: sns_nick,
		        sns_type: sns_type
		    };
		    
		    $.ajax({
		        type: 'POST',
		        url: '${cpath}/snsJoin.do', // 서버 URL
		        contentType: 'application/json',
		        data: JSON.stringify(userInfo),
		        success: function(data) {
		            // 성공 처리 로직
		            console.log("로그인이 성공적으로 처리되었습니다.");
		            console.log(data); // 서버로부터 받은 응답 데이터
		            
		            // 추가적인 로직이나 화면 전환 등의 처리를 수행할 수 있습니다.
		        },
		        error: function(error) {
		            // 오류 처리 로직
		            console.log("로그인 처리 중 오류가 발생했습니다.");
		            console.log(error); // 에러 정보
		            
		            // 에러 메시지를 사용자에게 보여주거나 추가적인 처리를 수행할 수 있습니다.
		        }
		    });
		}

		function handleLoginFailure() {
		    console.log("네이버 로그인 실패");
		    // 로그인 실패 시에 수행할 동작을 여기에 구현
		    // 예를 들어, 실패 메시지를 사용자에게 보여주거나 다른 처리를 수행할 수 있습니다.
		} */
		
   /* var naverLogin = new naver.LoginWithNaverId({
       clientId: "Eo_FUlEBW8bHSlohztQD", // 내 애플리케이션 정보에 clientId를 입력
       callbackUrl: "http://localhost:8081/PetCheck/main.do", // 내 애플리케이션 API 설정의 Callback URL 입력
       isPopup: false,
       callbackHandle: true
   });

   naverLogin.init();

   function naverLogin() {
       naverLogin.getLoginStatus(function (status) {
           if (status) {
               var sns_id = naverLogin.user.getEmail();
               var sns_nick = naverLogin.user.getNick();
               console.log(sns_id);
               console.log(sns_nick);
               
               var userInfo = {
                   sns_id: sns_id,
                   nick: sns_nick,
                   sns_type: 'naver'
               };

               $.ajax({
                   type: 'POST',
                   url: '${cpath}/snsJoin.do', // 수정된 AJAX 요청 URL
                   contentType: 'application/json',
                   data: JSON.stringify(userInfo),
                   success: function(data) {
                       console.log(data);
                   },
                   error: function(error) {
                       console.log(error);
                   }
               });
           } else {
               console.log("네이버 로그인 실패");
           }
       });
   }

	
	var testPopUp;

	// 팝업 열기
	function openPopUp() {
	    testPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}

	// 팝업 닫기
	function closePopUp() {
	    testPopUp.close();
	} */
	
    </script>
 </body>
 </html> 
</body>
</html>