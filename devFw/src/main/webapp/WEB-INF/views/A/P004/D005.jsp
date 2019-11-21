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
<h1 align="center">쿠폰 조회</h1>
<table class="table table-hover">
<tr>
<th>쿠폰번호</th>
<th>쿠폰이름</th>
<th>기간</th>
<th>할인가격</th>
</tr>

<c:forEach var="coupon" items="${couponsList}" varStatus='index' >
<tr align="center">
<td>${coupon.co_number}</td>
<td>${coupon.co_name}</td>
<td>${coupon.co_stdate}~${coupon.co_enddate}</td>
<td>${coupon.co_sale}${coupon.co_percent}</td>
</tr>
</c:forEach>

</table>

<script src="../devFw/resources/js/bootstrap.min.js"></script>
</body>
</html>