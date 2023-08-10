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
  <!-- 카카오 스크립트 -->
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <!-- 네이버 스크립트 -->
  <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</head>
<body>
	<form action="${cpath}/login.do" method="post">
		<label for="id">아이디 : </label>
		<input type="text" id="id" name="id" class="form-control">
		<hr>
		<label for="pw">비밀번호 : </label>
		<input type="password" id="pw" name="pw" class="form-control">
		<hr>
		<button type="submit" class="btn btn-primary btn-sm">로그인</button>
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${cpath}/memberjoin.do'">회원가입</button>
	</form>
	<ul>
	<li>
    <!-- 아래와같이 아이디를 꼭 써준다. -->
	    <a id="naverIdLogin_loginButton" href="javascript:void(0)">
	    	<img src="resources/img/naverLogin.png" alt="네이버 로그인" style="height: 45px; width: 183px;"/>
	    </a>
	</li>
	<li>
		<a href="javascript:kakaoLogin();">
	    	<img src="resources/img/kakaoLogin2.png" alt="카카오계정 로그인"/>
	    </a>
	</li>
</ul>

<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "Eo_FUlEBW8bHSlohztQD", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8181/main.do", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		var nick = naverLogin.user.getNick();
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

/* function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
} */
</script>

<script>
    window.Kakao.init('0cbbc520fc8aaa3c1adfb65f2f39c106');

    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
            success: function(response) {
                console.log(response) // 로그인 성공하면 받아오는 데이터
                window.Kakao.API.request({ // 사용자 정보 가져오기 
                    url: '/v2/user/me',
                    success: (res) => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account)
              		// window.location.href='/pc/main.do' //리다이렉트 되는 코드
                    }
                });
            },
            fail: function(error) {
                console.log(error);
            }
        });
    }
</script>
</script>
</body>
</html>