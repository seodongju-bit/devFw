<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet">



</head>
<body>
<h1 align="center">쿠폰 사용내역 조회</h1>
<table class="table table-hover">
<tr>
<th>쿠폰번호</th>
<th>쿠폰이름</th>
<th>할인가격</th>
<th>사용날짜</th>
</tr>

<c:forEach var="usecoupon" items="${usecoupon}" varStatus='index' >
<tr align="center">
<td>${usecoupon.co_number}</td>
<td>${usecoupon.co_name}</td>
<td>${usecoupon.co_percent}</td>
<td>${usecoupon.co_usedate}</td>
</tr>
</c:forEach>

</table>

<script src="../devFw/resources/js/bootstrap.min.js"></script>
</body>
</html>