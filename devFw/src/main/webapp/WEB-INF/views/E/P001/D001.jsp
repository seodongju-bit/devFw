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
	width:1140px;
	margin:0 0 0 28px;
	min-width:1000px;
}
#orderListTable{
	width:100%;
	text-align:center;
	margin:0 0 0 -28px;
	position:relative;
	min-width:1000px;
	float:left;
	border-bottom:1px solid #CCCCCC;"
}
#option {
	border: 1px solid #CCCCCC;
	padding:5px;
	position:relative;
	margin:10% 0 0 30%;
	text-align:left;
	text-overflow:ellipsis;
}

#prod {	
	width:300px;
	margin: 30px 0 10px 0;
	float:left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" style="min-width:1000px !important;">
<h1 style="width:1096px;">주문페이지</h1>
<hr style="border: 2px solid black; width: 100%; min-width:1000px">
<h4 style="float:left">1. 주문 상품 확인</h4>
<br>
<br>
<div id="orderBox">
	<form name="orderForm">
		<table id="orderListTable">
			<col width="30px"/>
			<col width="500px"/>
			<col width="150px"/>
			<col width="150px"/>
			<col width="100px"/>
			<col width="150px"/>
			<tr style="background-color:purple; color:white; border-top:2px solid black;">
				<td>번호</td>
				<td>상품정보</td>
				<td>상품가격</td>
				<td>할인적용금액(할인률)</td>
				<td>판매자</td>
				<td>배송비 지급방법</td>
			</tr>
				<c:set var = "total" value="0"/>
				<c:forEach var="item" items="${orderList }" varStatus="list_num">
			<tr>
				<td>${list_num.count}</td>
				<td><img src="${item.sell_thumbnail}" style="width:75px; height:100px; float:left;"/>
				<div id="prod"><a style="color:black; margin: 50% 0 0 0;" href="${contextPath}/sellItems.do?sell_no=${item.sell_number}">[${item.sell_number}]&nbsp;${item.sell_title}</a></div>
				<div id="option">${item.order_size }&nbsp;&nbsp;&nbsp;
				${item.order_color }&nbsp;&nbsp;&nbsp;${item.detail_quantity }개</div></td>
				<td>item.prod_price</td>
				<td><fmt:formatNumber value="${item.sell_price}" pattern="#,###"/>원(할인률)</td>
				<td><c:out value="${item.mem_ID }" /></td>
				<td>착불 or 결제</td>
			</tr>
			<fmt:formatNumber var="total" value="${total+item.sell_price}" pattern="#,###"/>
		</c:forEach>
		</table>
		<br><br>
		<h3 style="float:right;">최종 주문 금액:&nbsp;&nbsp; <c:out value="${total}"/>원</h3>
		<h4 style="float:left">2. 배송 정보</h4>
			<table>
				<tr>
					<td>배송방법</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>받으실 분</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>배송지 주소</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>배송메시지</td>
					<td><input type="text"></td>
				</tr>
			</table>
	</form>
</div>


</div>

</body>
</html>