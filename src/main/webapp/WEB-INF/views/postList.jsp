<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
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
 
<h1>게시판</h1>
 <table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		</thead>
		<tbody>
			<%-- ${}: EL --%>
			<c:forEach var="pvo" items="${postlist}">
				<tr>
					<td>${pvo.post_idx}</td>
					<td>
					<a href="${cpath}/postDetail.do?post_idx=${pvo.post_idx}">${pvo.post_title} </a></td>
					<!-- 게시물에 달린 댓글 개수 표기 해주기 -->
					<td>${pvo.nick}</td> 
					<td><fmt:formatDate value="${pvo.created_at}" pattern="yyyy-MM-dd"/></td>
					<td>${pvo.post_views}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
               
					<!-- 검색기능 추가 -->
					<form action="${cpath}/postList.do" method="post">
						<select name="type" class="form-control">
							<option value="id" ${pm.cri.type=='id' ? 'selected' : ''}>작성자</option> 
							<option value="post_title" ${pm.cri.type=='post_title' ? 'selected' : ''}>제목</option>
							<option value="post_content" ${pm.cri.type=='post_content' ? 'selected' : ''}>내용</option>
						</select>
						<input type="text" name="keyword" class="form-control" placeholder="Search" value="${pm.cri.keyword}">
						<button class="btn btn-success" type="submit">검색</button>
					</form>					
					<!-- 페이징 처리 -->
					<ul class="pagination justify-content-center">
					  <c:if test="${pm.prev}">
					   <li class="page-item"><a class="page-link" href="${pm.startPage-1}">Previous</a></li>
			          </c:if>
			          <c:forEach var="page" begin="${pm.startPage}" end="${pm.endPage}">
					   <li class="page-item ${pm.cri.page==page ? 'active' : ''}"><a class="page-link" href="${page}">${page}</a></li>
			          </c:forEach>
			          <c:if test="${pm.next}">
					   <li class="page-item"><a class="page-link" href="${pm.endPage+1}">Next</a></li>
					  </c:if>
					</ul>
					
				<c:if test="${!empty mvo}">
				<button class="btn btn-primary btn-sm" onclick="location.href='${cpath}/postRegister.do<%-- ?id=${pvo.id} --%>'">글쓰기</button>
				</c:if>

  
  
  

    <!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">메세지</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body" style="color: red">
        삭제된 게시물 입니다.
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
  <form id="frm" action="${cpath}/postList.do" method="post">
     <input id="page" type="hidden" name="page" value="${pm.cri.page}"/>
     <input type="hidden" name="type" value="${pm.cri.type}"/>
     <input type="hidden" name="keyword" value="${pm.cri.keyword}"/>          
  </form>
  
  
  
<script type="text/javascript">
      $(document).ready(function() {
         $(".page-link").click(function(e) {
            //preventDefault: 태그의 고유 동작(디폴트 값)을 막아주는 역할 
            e.preventDefault();
            var page = $(this).attr("href");
            $("#page").val(page);
            $("#frm").submit();
            //location.href="${cpath}/list.do?page="+page; // 너무 번거로움
         
         });

         /* 위에 있는 form을 직접 쓰기 위해서 변수에 담기 */
         var frm = $("#frm");
         $(".postDetail").click(function(e) {
            e.preventDefault();
            var num = $(this).attr("href");
            var tag = "<input type='hidden' name='post_idx' value='"+post_idx+"'/>";

            // 클릭이 일어났을때만 input 태그를 추가 해준다.
            frm.append(tag);
            // 페이지 주소를 바꿔줘야 한다.
            frm.attr("action", "${cpath}/postDetail.do");
            frm.attr("method", "get");
            frm.submit();
         }
         });
         
   </script>
   </body>
   </html>