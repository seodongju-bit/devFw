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
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='../devFw/resources/css/event.css'/>" />

</head>
<body>


	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
		<c:set var="detail" value="${resultMap}" />
			<tr>
				<th scope="row">글 번호</th>
				<td>${detail.NO_NUMBER }</td>
				<th scope="row">조회수</th>
				<td>${detail.VIEW_CNT}</td>
			</tr>
			<tr>
				<th scope="row">종류</th>
				<td>${detail.NO_DIVISION }</td>
				<th scope="row">작성시간</th>
				<td>${detail.WRITEDATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${detail.NO_TITLE}</td>
			</tr>
			<tr>
				<td colspan="4">${detail.NO_CONTENTS}</td>
			</tr>
			<button class="btn btn-default"  onclick="location.href='${contextPath}/event.do'">목록</button>
			<tr></tr>
			
			
		</tbody>
		
	</table>


</body>
</html>