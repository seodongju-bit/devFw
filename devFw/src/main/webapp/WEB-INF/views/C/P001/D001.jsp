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
width: 1300px;
margin-left: auto;
margin-right: auto;
}

#evnet_td{
margin-top: 50px;
}


</style>

<title>Insert title here</title>

<script>

</script>

</head>
<body>
<form name="frm" method="post" encType="UTF-8">
<h1 align="center">이벤트-공지사항</h1>
<div class="event">
<table class="table table-hover" id="evnet_td">
<tr>
<th>번호</th>
<th>제목</th>
<th>게시자</th>
<th>조회수</th>
<th>종류</th>
<th>게시날자</th>
</tr>

<c:forEach var="event" items="${eventList}" varStatus='index' >
<tr align="center" onclick="location.href='${contextPath}/eventDetail.do?no_number=${event.no_number}'">
<td>${event.no_number}</td>
<td>${event.no_title}</td>
<td>${event.mem_no}</td>
<td>${event.view_cnt}</td>
<td>${event.no_division}</td>
<td>${event.writedate}</td>
</tr>
</c:forEach>
</table>
</div>
</form>
</body>
</html>