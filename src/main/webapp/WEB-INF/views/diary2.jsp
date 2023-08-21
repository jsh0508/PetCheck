<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<title>다이어리</title>

        

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="resources/diary/font.css">
<link rel="stylesheet" href="resources/diary/layout.css">
<link rel="stylesheet" href="resources/diary/home.css">
<link rel="stylesheet" href="resources/diary/guest.css">
<script src="https://kit.fontawesome.com/862f1afc4c.js"
	crossorigin="anonymous"></script>
	
	
<link href='resources/calendar/main.css' rel='stylesheet' />
<script src='resources/calendar/main.js'></script>
	
	
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta content="" name="description"/>
        <meta content="" name="author"/>
		<link rel="stylesheet" href="resources/css/index.css">
        <link rel="stylesheet" href="resources/css/form.css">
        
        GLOBAL MANDATORY STYLES
        <link href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet" type="text/css">
        <link href="resources/vendor/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        PAGE LEVEL PLUGIN STYLES
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css"/>

        THEME STYLES
        <link href="resources/css/layout.min.css" rel="stylesheet" type="text/css"/>

        Favicon
        <link rel="shortcut icon" href="favicon.ico"/>
        <link rel="stylesheet" href="resources/css/btn.css">
        
        bootstrap icon
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
        
        <link rel="stylesheet" href="resources/css/chatbot.css">
        
        
        <script src="resources/vendor/jquery.min.js" type="text/javascript"></script>
        <script src="resources/vendor/jquery-migrate.min.js" type="text/javascript"></script>
        <script src="resources/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        PAGE LEVEL PLUGINS
        <script src="resources/vendor/jquery.easing.js" type="text/javascript"></script>
        <script src="resources/vendor/jquery.back-to-top.js" type="text/javascript"></script>
        <script src="resources/vendor/jquery.smooth-scroll.js" type="text/javascript"></script>
        <script src="resources/vendor/jquery.wow.min.js" type="text/javascript"></script>
        <script src="resources/vendor/swiper/js/swiper.jquery.min.js" type="text/javascript"></script>
        <script src="resources/vendor/masonry/jquery.masonry.pkgd.min.js" type="text/javascript"></script>
        <script src="resources/vendor/masonry/imagesloaded.pkgd.min.js" type="text/javascript"></script>

        PAGE LEVEL SCRIPTS
        <script src="resources/js/layout.min.js" type="text/javascript"></script>
        <script src="resources/js/components/wow.min.js" type="text/javascript"></script>
        <script src="resources/js/components/swiper.min.js" type="text/javascript"></script>
        <script src="resources/js/components/masonry.min.js" type="text/javascript"></script>
 -->


	
	

<!-- calendar -->
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
                	
      				var title = prompt('제목을 입력해주세요 :');
				        if (title) {
				        	var uniqueKey = Date.now();
				            calendar.addEvent({
				            id: uniqueKey,
				            title: title,
				            start: arg.start,
				            end: arg.end,
				            allDay: arg.allDay
				          })
				          
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
<%-- <!-- Navbar -->
		<nav class="navbar" role="navigation">
			<div class="logo">
				<a class="logo-wrap" href="${cpath}/main.do"> 
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
 --%>
<body style="background-color: #FFFAF3;">
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
				<div class="column1">
					<div class="visit">
						<span id="basic-text">TODAY <span id="red">28</span> |
							TOTAL 24562
						</span>
					</div>
					<div class="profile">
						<img class="profile-image" src="resources/diary/images/team1.jpg">
						<div class="profile-text" id="basic-text">
							@myeong_heon<br>실패는 잊어라<br>하지만 그것이 주는 교훈은<br>절대 잊으면 안 된다
						</div>
						<div class="profile-dropdown">
							<div id="basic-text">다이어리 추가하기</div>
							<div>
								<input id="diaryname" style="width: 80px;" type="text"
									name="search" placeholder="제목입력">
								<button class="custom-diary-btn" onclick="addDiary()">
									<i class="bi bi-plus-lg"></i>
								</button>
							</div>
						</div>
						<div class="profile-dropdown">
							<div id="basic-text">공유멤버 추가하기
								<button class='custom-invite-btn' id='invite' onclick='invitationListShowUp()'><i class="bi bi-person-plus"></i></button>
							</div>
						</div>
					</div>
				</div>
				<div class="column2">
					<div class="top-text-box">
						<div class="title" id="basic-text">명헌의 미니홈피</div>
					</div>
					<!--home-->
					<div class="main-content scrollable-container">

						<div id='calendar'></div>

						<div id='diary'>
							<div id="memo"></div>
							<div id="write" class="card" style="display: none;">
								<div class='guest-box-container'>
									<div class='guest-box basic-text'>
										<form id="frm" enctype="multipart/form-data">
											<div class='guest-box-title'>
												<label><span id='blue'>제목</span></label> <input type="text"
													name="title" />
											</div>
											<div class='guest-box-content'>
												<!-- <div>
													<img id="preview" src="#" width=80 height=80 alt="" >
													<input type="file" name="img_file" />
												</div> -->
												<div class='guest-text'>
													<textarea rows="8" name="content" class="custom-textarea"></textarea>
												</div>
											</div>
											<div class='guest-text'>
												<label>작성자 :</label> <input type="text" name="username"
													class="form-control" />
											</div>
											<button type="button" class="btn btn-primary btn-sm"
												onclick="insert()">등록</button>
											<button id="reset" type="reset"
												class="btn btn-warning btn-sm">취소</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="menu">
					<button class="menubtn" onclick="open_calendar()">
						<div class="menu-box">캘린더</div>
					</button>
					<%-- <a href="${cpath}/diary2.do?idx=${param.idx}&id=${param.id}"><div class="menu-box">캘린더</div></a> --%>
					<div>
						<button class="menubtn" onclick="open_my_diary()">
							<div class="menu-box">내 다이어리</div>
						</button>

						<div id="my"></div>

						<button class="menubtn" onclick="open_shared_diary()">
							<div class="menu-box">공유 다이어리</div>
						</button>

						<div id="shared"></div>
					</div>
				</div>
			</div>
		</div>

		<div id="notification-modal" class="modal fade" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">회원 목록</div>
						<button type="button" class="close"
							data-dismiss="modal" aria-label="닫기">X</button>
					</div>
					<div class="modal-body">
						<!-- 알림 목록을 보여주는 내용 -->
						<ul id="notification-list">
							<!-- 알림 항목들을 동적으로 추가 -->
							<c:if test="${empty memList}">
								<li>현재 알림이 없습니다.</li>
							</c:if>
							<c:forEach var="member" items="${memList}">
								<c:if test="${not (member.id eq param.id)}">
									<li style="padding: 5px;">${member.id} 를초대하시겠습니까?
										<button id="${member.id}" onclick="addInvitationDB(event)"
											style="border: none; background: none; color: black;">
											<i class="bi bi-check-circle-fill"></i>
										</button>

									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 캘린더 눌렀을 때 나타나게 하기 -->
		<script>
		function open_calendar() {
			const content = document.getElementById("calendar");
			if (content.style.display == "none") {
				content.style.display = "block";
			} else {
				content.style.display = "none";
			}
			
		}
		
		function open_my_diary() {
			const my_diary_list = document.getElementById("my_diary_list");
			if (my_diary_list.style.display == "none") {
				my_diary_list.style.display = "block";
			} else {
				my_diary_list.style.display = "none";
			}
			
		}
		
		function open_shared_diary() {
			const shared_diary_list = document.getElementById("shared_diary_list");
			if (shared_diary_list.style.display == "none") {
				shared_diary_list.style.display = "block";
			} else {
				shared_diary_list.style.display = "none";
			}
			
		}
		
		function insertMemo() {
			const content = document.getElementById("write");
			if (content.style.display == "none") {
				content.style.display = "block";
			} else {
				content.style.display = "none";
			}
				
		}
		
		/* 초대 */
		function invitationListShowUp(){
			console.log("안녕");
		const ele = document.getElementById("invite");
		$("#notification-modal").modal("show");
		}
		
		function addInvitationDB(evt) {
			console.log("hihihiii");
			// 현재 탭에 선택된 diary의 key 값을 가져오는 방법
	      	const div = document.getElementsByClassName("tab-button active");
	      	const key = div[0].id;
			const receiver = evt.currentTarget.id;
			const name = div[0].firstChild.innerHTML;
			
			$.ajax({
				url: "${cpath}/ajaxIsInvitation.do?sender=${param.id}&receiver="+receiver+"&diary_key="+key+"&name="+name,
				type: "post",
				success: function(data) {
					if (data) {
						$.ajax({
							url : "${cpath}/ajaxInvitationInsert.do?sender=${param.id}&receiver="+receiver+"&diary_key="+key+"&name="+name,
							type : "post",
							success: closeModal,
							error : function() {alert("error");}
						});
					} else {
						alert("이미 초대를 보낸 상태입니다.");
					}
				},
				error: function() {alert("error");}
			});
		}
		
		function closeModal(){
			$("#notification-modal").modal("hide");
		}
		
		
		/* 다이어리 */
		$(document).ready(function() {
	    	ajaxLoadTabList();
	    });
		
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
		
		/* 다이어리 내용 가져오기 */
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
			var blist = "<div class= 'MyDiaryList' id='my_diary_list' style='display: none;'>";
			$.each(data, function(index, obj) {
				blist += "<button id=" + obj.diary_key +" class='tab-button menubtn' onclick='openDiary(event)'><div class='menu-box submenu-box'>"+obj.name+"</div></button>";
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
			var blist = "<div class= 'SharedDiaryList' id='shared_diary_list' style='display: none;'>";
			$.each(data, function(index, obj) {
				blist += "<button id=" + obj.diary_key+" class='tab-button menubtn' onclick='openDiary(event)'><div class='menu-box submenu-box'>"+obj.name+"</div></button>";
			})
			
			blist += '</div>';
			$("#shared").html(blist);
		}
		
		/* 메모삭제 */
		function memoDelete(evt){
		var title = evt.currentTarget.id
		const div = document.getElementsByClassName("tab-button active");
      	const key = div[0].id;
		
		$.ajax({
			url: "${cpath}/ajaxMemoDelete.do",
			type: "get",
			data : {"title" : title},
			success : function() {
	        	 loadList(key);
	         },
			error : function(){alert("error");}
		});
	}
		
		/*  */
		function insert() {
		      // 폼의 데이터를 가지고오기(title,content,writer)
		      var fData=$("#frm").serialize();   // 직렬화 : title=111&content=111&writer=111
		      
		      // 현재 탭에 선택된 diary의 key 값을 가져오는 방법
		      const div = document.getElementsByClassName("tab-button active");
		      console.log(div);
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
				  url: "${cpath}/ajaxIsShared.do?diary_key="+key+"&id=${param.id}",
				  success: function(data){
					  if (data) {
						  $.ajax({
							  url: "${cpath}/ajaxMemoList.do?id="+key,
							  type: "get",
							  dataType: "json",
							  success : ajaxSharedMemoList,
							  error: function() {alert("error");}
						  });
					  } else {
						  $.ajax({
							  url: "${cpath}/ajaxMemoList.do?id="+key,
							  type: "get",
							  dataType: "json",
							  success : ajaxMyMemoList,
							  error: function() {alert("error");}
						  });
					  }
				  } ,
				  error: function() {alert("error");}
			  });		
		   }
		
		
		
		function ajaxMyMemoList(data){
			console.log(data);
			
			var blist = "<div>"
			blist += "</div>";
			blist += "<div class='main-content'>";
			
			$.each(data, function(index,obj) {
				console.log(index);
				console.log(obj);
				
				
				blist += "<div class='guest-box-container'>";
				blist += "<div class='guest-box basic-text'>";
				blist += "<div class='guest-box-title'><span id='blue'>"+obj.title+"</span>("+obj.username+")<button id='"+obj.title+"' onclick='memoDelete(event)'>X</button>";
				blist += "</div>";
				blist += "<div class='guest-box-content'>";
				blist += "<div class='guestbook-image background-"+index+"'>";
				blist += "</div>";
				blist += "<div class='guest-text'>"+obj.content+"</div>";
				blist += "</div>";
				blist += "</div>";
				blist += "</div>";
			})
			
			blist += "<div class='add-button'><button class='fas fa-plus-circle icon' id='register' onclick='insertMemo()'>글 작성하기</button></div>";
			blist += "</div>";
			
			$("#memo").html(blist);
			$("#write").css("display","none");
		    $("#reset").trigger("click");
			
		}
		
		function ajaxSharedMemoList(data){
			var blist = "<div>"
				blist += "</div>";
				blist += "<div class='main-content'>";
				
				$.each(data, function(index,obj) {
					
					blist += "<div class='guest-box-container'>";
					blist += "<div class='guest-box basic-text'>";
					blist += "<div class='guest-box-title'><span id='blue'>"+obj.title+"</span>("+obj.username+")<button id='"+obj.title+"' onclick='memoDelete(event)'>X</button>";
					blist += "</div>";
					blist += "<div class='guest-box-content'>";
					blist += "<div class='guestbook-image background-1'>";
					blist += "</div>";
					blist += "<div class='guest-text'>"+obj.content+"</div>";
					blist += "</div>";
					blist += "</div>";
					blist += "</div>";
				})
				
				blist += "<div class='add-button'><button class='fas fa-plus-circle icon' id='register' onclick='insertMemo()'>글 작성하기</button></div>";
				blist += "</div>";
				
				$("#memo").html(blist);
				$("#write").css("display","none");
			    $("#reset").trigger("click");
			
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
		
		function addDiary() {
			const ele = document.getElementById("diaryname");
			const name = ele.value;
			const key = Date.now();
			if (name == "") {
				alert("다이어리 제목을 입력해 주세요. ")
				return;
			}
			// add 버튼 누르고 인풋 안에 내용 없애기
			ele.value = "";
			$.ajax({
				url: "${cpath}/ajaxDiaryInsert.do?id=${param.id}&diary_key="+key+"&name="+name, //key name 추가
				type: "post",
				success: ajaxLoadTabList,
				error: function() {alert("error");}
			});		
		}
	</script>

		<style>
/* 추가된 CSS 스타일 */
.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.modal-close {
	display: flex;
	align-items: center;
}

.custom-textarea{
	width: 700px;
}

.custom-invite-btn{
	background: none;
	border: none;
	padding: 0;
	
}

.custom-diary-btn{
	background: none;
	border: none;
	padding: 0;
}
</style>
</body>
</html>