<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>   
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/style.css"> 
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div>
		<h1>게시물</h1> 
	</div>
	<table class="table table-bordered">
 		<tr>
 			<td style="width: 100px">제목</td>
 			<td>${pvo.post_title}</td>
 		</tr>
 		<tr>
 			<td>내용</td>
            <td>${fn:replace(pvo.post_content,newLineChar,"<br/>")}</td>
 		</tr>
		<tr>
			<td>작성자</td>
			<td>${pvo.nick}</td>
		</tr>
		<tr>
 			<td>작성일</td>
			<td><fmt:formatDate value="${pvo.created_at}" pattern="yyyy-MM-dd"/></td>
 		</tr>
 		<tr>
 			<td>
 			<button data-btn="list" class="btn btn-primary btn-sm">목록</button>
 				<c:if test="${!empty mvo}">  
               		<c:if test="${mvo.id eq pvo.id}">
                	<button data-btn="modify" class="btn btn-primary btn-sm">수정</button>
                	<button data-btn="remove" class="btn btn-primary btn-sm">삭제</button>
				</c:if>
                </c:if>
			</td>
 		</tr>
 	</table>
	<form id="frm">
		<input type="hidden" name="post_idx" value="${pvo.post_idx}"/>
		<input type="hidden" name="page" value="${cri.page}"/>
		<input type="hidden" name="type" value="${cri.type}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"/>
	</form>
	
	
  <script type="text/javascript">
     // jQuery(자바스크립트 라이브러리:API(.js)) : http://jquery.com : $.ajax(), fetch(ajax)
     $(document).ready(function(){
    	 //버튼이 클릭되면 ~~~
    	 $("button").click(function(){ 
    		var frm=$("#frm"); 
    		var data=$(this).data("btn"); // data-btn="list"
    		if(data=="list"){
    			//location.href="${cpath}/list.do"; // get이동?key=value&key=value&key=value
    		    frm.attr("action","${cpath}/postList.do");	
    			frm.attr("method", "post");
    		}else if(data=="modify"){
    			frm.attr("action","${cpath}/postModify.do");	
    			frm.attr("method", "get");
    		}else if(data=="remove"){
    			frm.attr("action","${cpath}/postDelete.do");	
    			frm.attr("method", "get");    			
    		}	
    		frm.submit();
    	 });
     });
  </script>
 </body>
</html>
