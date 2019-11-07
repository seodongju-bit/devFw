<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>


<html>
<head>
<style>
h1{
	text-align:center;
}
#orderBox{
	position:relative;
	width:800px;
	margin:10px auto;
	background-color:lightblue;
}
#orderListTable{
	width:100%;
	text-align:center;
	margin:0 auto;
	
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 id="id">주문페이지</h1>
<div id="orderBox">
	<form name="orderForm">
		<table border=1 id="orderListTable">
			<tr>
				<td>번호</td>
				<td>판매번호</td>
				<td>사이즈</td>
				<td>색상</td>
				<td>가격</td>
				<td>수량</td>
				<td>판매자</td>
			</tr>
				<c:forEach var="item" items="${orderList }">
			<tr>
				<td>1</td>
				<td><c:out value="${item.sell_number }" /></td>
				<td><c:out value="${item.order_size }" /></td>
				<td><c:out value="${item.order_color }" /></td>
				<td><c:out value="${item.sell_price }" /></td>
				<td><c:out value="${item.detail_quantity }" /></td>
				<td><c:out value="${item.mem_ID }" /></td>
			</tr>
		</c:forEach>
		</table>
	</form>
</div>

</body>
</html>