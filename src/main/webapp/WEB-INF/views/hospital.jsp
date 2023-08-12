<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kakao Map Template</title>

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
<body style="background-color: #fffaf3">
	<!--========== HEADER ==========-->
	<header class="header" style="background-color: #FFFAF3;">
		<!-- Navbar -->
		<nav class="navbar" role="navigation">
			<div class="logo">
				<a class="logo-wrap" href="${cpath}/main.do"
					style="margin-top: 10px"> <img class="logo-img logo-img-main"
					src="resources/img/nocatlogo.png" alt="">
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
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover" href="about.html">다이어리</a></li>
							<li class="nav-item"><a
								class="nav-item-child nav-item-hover"
								href="${cpath}/hospital.do">병원검색</a></li>
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
	<center>
		<div id="map" style="width: 80%; height: 600px;"></div>
	</center>
</body>
</html>
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=82eb2884ec23385f208fce7b0afc917e&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	// 공공데이터 open api 사용
	var url = "https://api.odcloud.kr/api/3083315/v1/uddi:2076b2e7-328a-476d-b246-ca1e4f4b716b?page=1&perPage=200";
	var key = "&"
			+ "serviceKey=v1Xr6qgEB3tuPucG0vWfFH%2B7Hoxjng6hdFmyaUlM7mlfs6xbwGgjRiw3g%2FFz4QDjzxM0KXklGIBQNv6PLZTqGQ%3D%3D";
	var urlkey = url + key;
	var data;
	$(document).ready(function() {
		$.ajax({
			url : urlkey,
			type : 'GET',
			success : function(result) {
				ProcessData(result);
			}
		})
	});
	
	
	function makeContent(data){
		var content = document.createElement('div');
		content.className = 'wrap';
		
		var content_info = document.createElement('div');
		content_info.className = 'info';
		
		//-------------------------//
		var content_title = document.createElement('div');
		content_title.className = 'title';
		content_title.innerHTML = data.업체명;
		
		var button_close = document.createElement('button');
		button_close.onclick = closeOverlay;
		button_close.className = "close";
		
		content_title.appendChild(button_close);
		//-------------------------//
		
		// **************************//
		var content_body = document.createElement('div');
		content_body.className = "body";
		
		//-------------------------//
		var content_desc = document.createElement('div');
		content_desc.className = 'desc';
		
		var ellipsis = document.createElement('div');
		ellipsis.className = 'ellipsis';
		ellipsis.innerHTML = data.소재지;
		
		var address = document.createElement('address');
		address.className = 'address';
		address.innerHTML = `(\${data.전화번호})`;
		
		content_desc.appendChild(ellipsis);
		content_desc.appendChild(address);
		//-------------------------//
		
		content_body.appendChild(content_desc);
		// **************************//

		content_info.appendChild(content_title);
		content_info.appendChild(content_body);
		
		content.appendChild(content_info);
		
		function closeOverlay(){
			
		}
		return content;
	}
	
	function geocodeAddress(address) {
	    return new Promise((resolve, reject) => {
	    	// 주소-좌표 변환 객체 생성
	        var geocoder = new kakao.maps.services.Geocoder();
	        geocoder.addressSearch(address, function(result, status) {
	            if (status === kakao.maps.services.Status.OK) {
	                resolve(result);
	            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	                resolve(null); // ZERO_RESULT 오류 상황을 표시하기 위한 처리
	            }
	            else {
	                reject(status);
	            }
	        });
	    });
	}
	
	async function ProcessData(data) {
		var markers = [];
		var contents = [];
		for (var i=0; i<data.data.length; i++){
			
			const result = await geocodeAddress(data.data[i].소재지);
			
			// 가끔씩 주소가 위도 경도로 변환이 안되는 경우도 있음 예외처리하기
			if (result == null) {
				continue;
			}
			
			var coords = new kakao.maps.LatLng(result[0].y,
					result[0].x);

			var marker = new kakao.maps.Marker({
				map : map,
				position : coords
			});
			
			markers.push(marker);
			contents.push(makeContent(data.data[i]));
		}
		
		var overlays = []
		for (var i = 0; i < markers.length; i++) {
            
			var overlay = new kakao.maps.CustomOverlay({
				content : contents[i],
				position : markers[i].getPosition(),
			});
			overlays.push(overlay);
		}
		
		for (var i = 0; i < markers.length; i++) {
			(function(index) { // 클로저를 생성하여 현재의 i 값을 유지
		        kakao.maps.event.addListener(markers[index], 'click', function() {
		            overlays[index].setMap(map);
		        });
		    })(i); // 클로저에 i 값을 전달
		    
			buttonElement = contents[i].querySelector('button');
			(function(index) {
		        buttonElement.addEventListener("click", function() {
		            console.log("here");
		            overlays[index].setMap(null);
		        });
		    })(i);
		}
		
	}

	// 카카오맵 불러오기
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(35.152, 126.888),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);
</script>

<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 100px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 15px 0 0 0px;
	height: 75px;
	text-align: center;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>