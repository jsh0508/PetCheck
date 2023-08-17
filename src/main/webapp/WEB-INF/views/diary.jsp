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

                initialDate: new Date(), // 초기 로딩 날짜
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                editable: true,
                dayMaxEvents: true, // allow "more" link when too many events
                // 일정 생성
                select: function(arg) {
                	
      				var title = prompt('Event Title:');
				        if (title) {
				        	var uniqueKey = Date.now();
				            calendar.addEvent({
				            id: uniqueKey,
				            title: title,
				            start: arg.start,
				            end: arg.end,
				            allDay: arg.allDay
				          })
				          
				         /* window.localStorage.setItem('publicId', arg.event._def.publicId); */
				         // 값을 가져옴
				         /* var storedPublicId = localStorage.getItem('publicId');
				         console.log("hi");
				         console.log(storedPublicId); */
				          $.ajax({
				              url: "${cpath}/ajaxInsert.do",
				              data: {
				            	'cal_key':calendar.getEventById(uniqueKey)._def.publicId,
				            	'idx':"${param.idx}",
				            	'title':title,  
				            	'start_at':arg.startStr,
				            	'end_at':arg.endStr
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
				      
				   // 일정 삭제
				      eventClick: function(arg) {
				    	  console.log(arg);
				        if (confirm('일정을 삭제하시겠습니까?')) {
				        	
				          arg.event.remove()
					        $.ajax({
					            url: "${cpath}/ajaxDelete.do",
					            data: {'cal_key' :arg.event._def.publicId},
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
				        
				      },
                
                
                
                
                
                // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
                events: [
                	<c:forEach var="vo" items="${list}">
                	{
                		id: '${vo.cal_key}',
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


	<!-- calendar -->

	<div class="card" style="background-color: #FFFAF3; ">
		<div class="row">
			<div class="col-lg-6">
				<div id='calendar'></div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							MEMO
						</h4>
						<div id="board" style="display: block"></div>
					</div>
				</div>
				<div id="write" class="card" style="display: none;">
					<div class="card-body">
						<div class="container">
							<p class="card-text">글등록하기</p>
							<form id="frm" enctype="multipart/form-data">
								<label>제목 :</label> <input type="text" name="title"
									class="form-control" /> <label>내용 :</label>
								<textarea rows="10" name="content" class="form-control"></textarea>
								<label>이미지 파일 첨부</label> <input type="file" name="img_file"
									multiple class="form-control" /> <img id="preview" src="#"
									width=200 height=150 alt="선택된 이미지가 없습니다"
									style="align-content: flex-end;"> <br /> <label>작성자
									:</label> <input type="text" name="username" class="form-control" /> <br />
								<button type="button" class="btn btn-primary btn-sm"
									onclick="insert()">등록</button>
								<button id="reset" type="reset" class="btn btn-warning btn-sm">취소</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 오른쪽에 tab을 만듬 -->
	<div class="tab-container ">
		<div style="display:flex">
			<input id="diaryname" style="width:80px;" type="text" name="search" placeholder="제목입력">
			<button onclick="addDiary()" style="width: 40px; background: #09df09; color: white; margin-top: 5px; border-radius: 5px;">add</button>
		</div>
		
		<div id="my">
		</div>

        <div id="shared" style="margin-top: 10px;">
        </div>
    </div>
	
	
	<script>
		$(document).ready(function() {
	    	ajaxLoadTabList();
	    });
		
	
		function addDiary() {
			const ele = document.getElementById("diaryname");
			const name = ele.value;
			const key = Date.now();
			// add 버튼 누르고 인풋 안에 내용 없애기
			ele.value = "";
			$.ajax({
				url: "${cpath}/ajaxDiaryInsert.do?id=${param.id}&diary_key="+key+"&name="+name, //key name 추가
				type: "post",
				success: ajaxLoadTabList,
				error: function() {alert("error");}
			});		
		}
		
		function ajaxLoadTabList(){
			ajaxLoadMyDiaryList();
			ajaxLoadSharedDiaryList();
		}
		
		function ajaxLoadMyDiaryList() {
			$.ajax({
				url: "${cpath}/ajaxMyDiaryList.do?id=${param.id}",
				type: "get",
				dataType: "json",
				success: ajaxMakeMyDairyList,
				error: function() {alert("error");}
			});
		}
		function ajaxMakeMyDairyList(data) {
			console.log(data);
			var blist = "<div class= 'MyDiaryList'>";
			blist += "<h5 style='text-align: center; margin-top: 10px;' >내 다이어리</h5>";
			$.each(data, function(index, obj) {
				blist += "<button id=" + obj.diary_key +" class='tab-button' onclick='openDiary(event)'>"+obj.name+"</button>";
			})
			
			blist += '</div>';
			$("#my").html(blist);
		}
		
		function ajaxLoadSharedDiaryList() {
			$.ajax({
				url: "${cpath}/ajaxSharedDiaryList.do?id=${param.id}",
				type: "get",
				dataType: "json",
				success: ajaxMakeSharedDairyList,
				error: function() {alert("error");}
			});
		}
		
		function ajaxMakeSharedDairyList(data) {
			console.log(data);
			var blist = "<div class= 'SharedDiaryList'>";
			blist += "<h5 style='text-align: center'>공유된 다이어리</h5>";
			$.each(data, function(index, obj) {
				blist += "<button id=" + obj.diary_key+" class='tab-button' onclick='openDiary(event)'>"+obj.name+"</button>";
			})
			
			blist += '</div>';
			$("#shared").html(blist);
		}
		
        function openDiary(evt) {
            var i, tabButton;

            tabButton = document.getElementsByClassName("tab-button");
            for (i = 0; i < tabButton.length; i++) {
                tabButton[i].className = tabButton[i].className.replace(" active", "");
            }
            evt.currentTarget.className += " active";
            
            const key = evt.currentTarget.id;
            loadList(key);
        }
	</script>
    
	<!-- 탭 컨테이너 스타일  -->
	<style>
        .tab-container {
            position: fixed;
            top: 100px;
            right: 0;
            width: 120px; /* 탭의 너비 조정 */
            height: 100%; /* 탭의 높이 조정 */
            z-index: 100;
            background : #f5f5f5;
        }

        /* 탭 버튼 스타일 */
        .tab-button {
            display: block;
            padding: 5px;
            text-align: center;
            color: #333;
            border-bottom: 1px solid #ccc;
            text-decoration: none;
            cursor: pointer;
            width: 120px;
            margin-top: 10px;
        }

        /* 선택된 탭 버튼 스타일 */
        .tab-button.active {
            background-color: #fff6d5;
            border-right: 3px solid #3788d8;
        }

        /* 탭 컨텐츠 스타일 */
        .tab-content {
            display: none;
            padding: 20px;
        }

        /* 선택된 탭 컨텐츠 스타일 */
        .tab-content.active {
            display: block;
        }
    </style>
	

	<!-- footer -->
	<footer>
		<div class="inner">
			<div class="footer-contact">
				<a href="https://github.com/jsh0508/PetCheck" target="_blank"> <i
					class="bi bi-github"></i>
				</a>
			</div>
			<div class="footer-copyright">독하고묘한팀</div>
		</div>
	</footer>

	<script type="text/javascript">
	
	function insert() {
	      // 폼의 데이터를 가지고오기(title,content,writer)
	      var fData=$("#frm").serialize();   // 직렬화 : title=111&content=111&writer=111
	      console.log(fData);
	      
	      // 현재 탭에 선택된 diary의 key 값을 가져오는 방법
	      const div = document.getElementsByClassName("tab-button active");
	      const key = div[0].id;
	      $.ajax({
	         url : "${cpath}/ajaxMemoInsert.do?diary_key="+key,
	         /* processData: false,
	         contentType: false, */
	         type : "post",
	         data : fData,  // 직렬화 된 데이터는 바로 써주면 된다.
	         success : function() {
	        	 loadList(key);
	         },
	         error : function() {alert("error");}
	      });
	   }
	
	function loadList(key) {
	      $.ajax({
	         url : "${cpath}/ajaxMemoList.do?id="+key,
	         type : "get",
	         dataType : "json",
	         success : ajaxMemoList,
	         error : function() {alert("error");}
	      }); // ajax
	   }
	
	function insertMemo() {
		const content = document.getElementById("write");
		if (content.style.display == "none") {
			content.style.display = "block";
		} else {
			content.style.display = "none";
		}
			
	}
	
	function ajaxMemoList(data){
		console.log(data);
		var blist = "<div>"
		blist += "<button id='register' style='background: #09df09; color: white; padding: 3px; border-radius: 5px;' onclick='insertMemo()'>글쓰기</button>";
		blist += "<button id='invite' style='background: #09df09; margin-left: 25px; padding: 3px; color: white; border-radius: 5px;'>초대</button>";
		blist += "</div>";
		blist += "<div class='container-fluid'>";
		blist += "<div class='row'>"
		
		$.each(data, function(index,obj) {
			
			blist += "<div class='col-lg-6'>"
			blist += "<div class='card-body'>"
			blist += "<img></img>";
			blist += "<h5 class='card-title'>"+obj.title+"</h5>";
			blist += "<p class='card-text'>"+obj.content+"</p>";
			blist += "<h5 class='card-text'>"+obj.username+"</h5>";
			blist += "</div>";
			blist += "</div>";
		})
		
		blist += "</div>";
		blist += "</div>";
		
		$("#board").html(blist);
		$("#write").css("display","none");
	    $("#reset").trigger("click");
		
	}	
	
	</script>


	<a href="javascript:void(0);" class="js-back-to-top back-to-top">Top</a>

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


</body>
</html>