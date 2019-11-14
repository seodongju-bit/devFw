<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<!DOCTYPE html>
<html>
<head>
<style>


#page_wrap {
	margin: 10px auto 50px; padding: 0px; width: 400px;
}
#page_control {
	list-style: none; padding: 0px; font-size: 11px;
}
#page_control li {
	padding: 0px 5px; float: left;
}
#page_control li a {
	padding: 2px 5px; border: 1px solid rgb(204, 204, 204); border-image: none; display: block;
}
#page_control li a:hover {
	border: 1px solid rgb(255, 0, 0); border-image: none; color: rgb(255, 0, 0);
}
#page_control li a.no_border {
	border: currentColor; border-image: none; padding-top: 3px;
}
.active {
	color: rgb(255, 0, 0); font-weight: bold;font-size: 0.8em;
}
#page_control li .page_contrl_active {
	background: rgb(255, 255, 255); border: 1px solid rgb(255, 0, 0); border-image: none; color: rgb(255, 0, 0);
}
#sorting {
	margin: 10px 0px 5px; width: auto; font-size: 0.75em; float: right;
}
#sorting ul {
	list-style: none;
}
#sorting ul li {
	float: left;
}
#sorting ul li a {
	padding: 0px 8px; border-right-color: rgb(153, 153, 153); border-right-width: 1px; border-right-style: solid; display: block;
}
#list_view {
	width: 100%; color: rgb(51, 51, 51); font-size: 0.75em; margin-top: 20px; border-top-color: rgb(51, 51, 51); border-top-width: 2px; border-top-style: solid; border-collapse: collapse;
}
#list_view td {
	margin: 0px; padding: 10px 0px; border-bottom-color: rgb(153, 153, 153); border-bottom-width: 1px; border-bottom-style: dotted;
}
#list_view h2 {
	padding: 0px 0px 2px; font-size: 1.2em; font-weight: bold;
}
#list_view td.goods_image {
	width: 80px;
}
#list_view td.goods_description {
	width: 500px; padding-left: 5px;
}
#list_view td.goods_description .writer_press {
	padding: 2px 5px; color: rgb(51, 102, 255);
}
#list_view td.goods_description p {
	line-height: 1.2em;
}
#list_view td.price {
	padding: 0px 0px 0px 10px; width: 70px;
}
#list_view td.price span {
	text-decoration: line-through;
}
#list_view td.price strong {
	color: rgb(255, 0, 0); font-weight: bold;
}
#list_view td.buy_btns {
	width: 80px; padding-left: 5px;
}
#list_view td.buy_btns ul {
	list-style: none;
}
#list_view td.buy_btns ul li {
	margin: 5px 0px;
}
#list_view td.buy_btns ul li a {
	padding: 5px 12px; border-radius: 3px; border: 1px solid rgb(153, 153, 153); border-image: none; text-align: center; display: block;
}
#list_view td.buy_btns ul li a:hover {
	color: rgb(255, 255, 255); background-color: rgb(0, 51, 102);
}

</style>
<meta charset="UTF-8">
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">     
<title>검색 결과</title>
</head>
<body>
<div class="container">
	<table id="list_view">
	  <tbody>
		<c:set var = "sum" value="${0}"/>
		<c:forEach var="search" items="${searchList}" varStatus="status"> 
	      <tr>
	      	<!-- 썸네일 -->
		    <td class="prod_image">
			   <a href="${contextPath}/sellItems.do?sell_no=${search.sell_number}">
			   <img style="width:100px; height:100px; overflow:hidden; margin: 0; padding:0;" src="${contextPath}/${search.sell_thumbnail}">
			   </a>
			</td>
			
			<!-- 게시글 제목 -->
			<td class="prod_title">
				<a href="${contextPath}/sellItems.do?sell_no=${search.sell_number}">${search.sell_title}</a>
			</td>
			<!-- 판매자 아이디  -->
			<td class="prod_description" style="margin:0; padding:0;">
				<div class="seller" style="margin:0; padding:0;"  >
						${search.mem_ID}
				</div>
			</td>
			<!-- 제품 가격 -->
			<td class="prod_price" style="margin:0; padding:0;"><span>${search.sell_price }원</span><br>
				<strong>
					<fmt:formatNumber  value="${search.sell_price*0.9}" type="number" var="discounted_price" />
			        ${discounted_price}원
				</strong>
			</td>
			<td class="buy_btns" style="margin:0; padding:0;">
				<ul style="display:inline; margin:0; padding:0;">
					<li><a href="#">장바구니로</a></li>
					<li><a href="#">구매하기</a></li>
				</ul>
			</td>
			</tr>
		</c:forEach>
		<br>
		<div id="sorting">
			<ul>
				<li><a class="active" href="#">등록일 순</a></li>
				<li><a href="#">인기 순</a></li>
				<li><a style="border: currentColor; border-image: none;" href="#">상품평 순</a></li>
			</ul>
		</div>
		<h4>총 건의 상품이 검색되었습니다</h4>
		</tbody>
	</table>
	<div class="clear"></div>
	<div>
		<ul class="btn-group pagination">
			<c:if test="${searchPageMaker.prev}">
				<li><a href='<c:url value="/searchProd.do${searchPageMaker.makeSearch(pageMaker.startPage - 1)}"/>'><i class="fa fa-chevron-left"></i></a></li>
			</c:if>
			
			<c:forEach begin="${searchPageMaker.startPage}" end="${searchPageMaker.endPage}" var="idx">
				<li>
				<a href='<c:url value="/searchProd.do${searchPageMaker.makeSearch(idx)}"/>'><i class="fa">${idx}</i></a>
				</li>
			</c:forEach>
			
			<c:if test="${searchPageMaker.next && searchPageMaker.endPage > 0}">
				<li><a href='<c:url value="/searchPord.do${searchPageMaker.makeSearch(searchPageMaker.endPage + 1)}"/>'><i class="fa fa-chevron-right"></i></a></li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>