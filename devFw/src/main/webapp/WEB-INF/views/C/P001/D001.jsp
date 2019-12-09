<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>

.event{
max-width: 1300px;
margin-left: auto;
margin-right: auto;
}

#evnet_td{
margin-top: 50px;
}
  .hit {
      animation-name: blink;
      animation-duration: 1s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
     
    /* 애니메이션 지점 설정하기 */
    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
      from {color: white;font-weight: bold;}
      30% {color: yellow; font-weight: bold;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }

</style>

<title>Insert title here</title>

<script>
function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href="${contextPath}/event.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
}
</script>

</head>
<body>
<form name="frm" method="post" encType="UTF-8">
<h1 align="center">이벤트-공지사항</h1>
<div class="event">

<div style="float: right;">
	<c:choose>
		<c:when test="${memberInfo.mem_division==2 }" >
       		 <a href='eventWrite.do' class="btn btn-default" >글쓰기</a>
       	</c:when>
    </c:choose>
		
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
<table class="table table-hover" id="evnet_td">
<tr>
<th width="10%">번호</th>
<th width="10%">제목</th>
<th width="10%">게시자</th>
<th width="10%">조회수</th>
<th width="10%">종류</th>
<th width="10%">게시날자</th>
</tr>

<c:forEach var="event" items="${eventList}" varStatus='index' >
<tr align="center" onclick="location.href='${contextPath}/eventDetail.do?no_number=${event.no_number}'">
<td>${event.no_number}</td>
<td>${event.no_title}
 <c:if test="${event.view_cnt >= 10}">
                           <span class="hit">Hot!</span>
                        </c:if></td>
<td>${event.mem_id}</td>
<td>${event.view_cnt}</td>
<td>${event.no_division}</td>
<td>${event.writedate}</td>
</tr>
</c:forEach>
</table>

<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="${contextPath}/event.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="${contextPath}/event.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="${contextPath}/event.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>



</div>
</form>
</body>
</html>