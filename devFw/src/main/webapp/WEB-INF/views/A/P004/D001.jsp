<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>

<style>
#f {
	text-align: left;
	margin: 0px;
	padding: 0px;
}

#b {
	color: black;
	/* veritcal-align: middle;
text-align:center; */
}

#c {
	text-align: center;
}

#caution-box {
	border: 1px solid #bcbcbc;
	margin: 20px;
	width: 80%;
	margin-left: 140px;
	margin-right: 0px;
}

#box {
	padding: 20px;
}

#z {
	text-align: center;
	max-width: 100%;
	width: auto;
	height: auto;
	/* padding-left: 250px; */
}

#r {
	text-align: right;
	font-size: 13px;
}

check {
	background-color: #f3f3f3;
}

#side {
	position: fixed;
	right: 35px;
	top: 280px;
}

#side-tb {
	padding: 8px;
	line-height: 1.42857143;
	border-bottom: 1px solid #ddd;
	/*border-top: 1px solid #ddd;*/
}

}
/* Tooltip on left */
.info+.tooltip.left>.tooltip-arrow {
	border-left: 5px solid red;
}

.info+.tooltip>.tooltip-inner {
	background-color: white;
	color: black;
	border: 1px solid black;
	padding: 15px;
}

#orderTable{
	width:1150px;
	margin:0 auto;
	text-align:center;
}
.orderImg{
	display:inline;
	float:left;
	left:20px;
}
.tdMenu{
 	margin:2px auto;
	width:70px;
	border:1px solid lightgray;
	border-radius:5px;
	padding:2px;
	color:gray;
	font-size:10px;
}
.tdMenu:hover{
	cursor:pointer;
	background-color: white;
}

</style>




<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
</head>
<body>

	<h1 align="center" >마이페이지</h1>

	<table class="table table-hover" >

		<tr>
			<th id="My" >My</th>
			<th>미사용 티켓<br> <a href="#" style="">0장</a></th>
			<th>배송중<br> <a href="#" style="">${del_count}건</a></th>
			<th>할인쿠폰<br> <a href="coupon.do" style="">${coupon_count}장</a></th>
			<th>포인트<br> <a href="point.do" style="">${mem_point}P </a></th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		
	</table>
	
	
	<p id="f" style=" margin-right: 0px;">주문목록/배송조회</p>



	<table class="table table-hover">
		<tr>

			<th colspan="3">
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#">My</a></li>
						<li><a href="#">전체</a></li>
					</ul>
				</div>
			</th>
		</tr>
	</table>
	
	
	
	<table  id="orderTable" class="table table-striped" >
		<tr>
			<th width="150px" >날짜</th>
			<th width="600px" >상품정보</th>
			<th width="150px" >상태</th>
			<th width="250px" >확인/신청 </th>
		</tr>
		
		<c:forEach var="orderList" items="${orderList}" varStatus='index'>
			<tr>
				<td>
					<p>주문번호 : ${orderList.ORDER_NUMBER}</p>
					<fmt:formatDate value="${orderList.ORDER_DATE}" pattern="yyyy-MM-dd" /><br>
					<fmt:formatDate value="${orderList.ORDER_DATE}" pattern="HH:mm" /><br>
					<p class="tdMenu" >주문취소</p>
					<p class="tdMenu" >구매확정</p>
				</td>
				<td>
					<img class="orderImg" src="${orderList.SELL_THUMBNAIL}" width="80px" height="80px" >
					<a href="sellItems.do?sell_no=${orderList.SELL_NUMBER}" >${orderList.SELL_TITLE}</a>
					<br><fmt:formatNumber value="${orderList.SELL_PRICE}"  />원 
				</td>
				<td>
					<c:choose>
  						<c:when test="${orderList.OD_STATE=='F_0001'}">
							<p>결제준비중</p>
  						</c:when>
 						<c:when test="${orderList.OD_STATE=='F_0002'}">
							<p>결제완료</p>
  						</c:when>
  						<c:when test="${orderList.OD_STATE=='F_0003'}">
     						<p>배송중</p>
  						</c:when>
  						<c:when test="${orderList.OD_STATE=='F_0004'}">
   							<p>배송완료</p>
  						</c:when>
  						<c:when test="${orderList.OD_STATE=='F_0005'}">
   							<p>구매확정</p>
  						</c:when>
  						<c:when test="${orderList.OD_STATE=='F_0006'}">
   							<p>취소완료</p>
  						</c:when>
					</c:choose>
				</td>
				<td>
					<p class="tdMenu" onclick="reviewWrite('${orderList.SELL_NUMBER}','${orderList.SELL_TITLE}')">리뷰작성</p>
					<p class="tdMenu" >리뷰 수정</p>
					<p class="tdMenu" >교환신청</p>
				</td>
				
			</tr>
		</c:forEach>
		
		
	</table>



	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="../devFw/resources/js/bootstrap.min.js"></script>


	<div id="caution-box">
		<div id="all">
			<div id="box">
				<p4 id="x">
				<strong>배송상품 주문 안내</strong></p4>
				<p id="r">
					<a href="#" id="r">자세한 내용 더보기 ></a>
				</p>
				<div id="z">
					<img     
						src="resources/image/asdf.PNG">
				</div>
			</div>
			<div class="check" style="background-color: #f3f3f3;">
				<div id="box">
					<b><span style="color: red;">취소/반품/교환 신청</span> 전 확인해주세요!</b> <br>
					<br> <strong>취소</strong> <br>
					<li>여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며, 취소수수료를 확인하여 2일 이내(주말,공휴일
						제외)<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;처리결과를 문자로 안내해드립니다. (당일
						접수 기준, 마감시간 오후 4시)
					</li>
					<li>문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지않습니다.</li>
					<br> <strong>반품</strong>
					<li>상품 수령 후 7일 이내 신청하여 주세요.</li>
					<li>상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.</li>
					<li>설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이
						가능합니다.&nbsp;&nbsp;&nbsp; <a href="#">1:1문의하기> </a>
					</li> <br> <strong>교환</strong>
					<li>상품의 교환 신청은 고객센터로 문의하여 주세요.&nbsp;&nbsp;&nbsp; <a href="#">1:1문의하기>
					</a>
					</li>
				</div>
			</div>
		</div>
	</div>
</div>


	<div id="side">

		<table class="table table-hover" id="side-tb">
			<tr>
				<td align="center">My</td>
			</tr>
			<tr>
				<td style="background-color: #000000;"><a href="basket.do"><strong
						style="color: white;">장바구니 ▶${basket_count}개</strong></a></td>
			</tr>
			<tr>
				<td style="background-color: #000000;"><a href="#"><strong
						style="color: white;">최근상품 ▶ 0개</strong></a></td>
			</tr>
			<tr>
				<td><img class="info" data-toggle="tooltip"
					data-placement="left" title="삼성전자 라이언 미니 스마트빔 프로젝터 SSB-12DLWA10"
					src="http://placehold.it/120x166"></td>
			</tr>
			<tr>
				<td><img class="info" data-toggle="tooltip"
					data-placement="left" title="ipTIME 유무선공유기 A2004MU"
					src="http://placehold.it/120x166"></td>
			</tr>
		</table>
	</div>
	
	<script>
	$(document).ready(function aa(){
		$('#orderTable').rowspan(0);
	});
	
	$.fn.rowspan = function(colIdx, isStats) {       
	    return this.each(function(){      
	        var that;     
	        $('tr', this).each(function(row) {      
	            $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
	                 
	                if ($(this).html() == $(that).html() && (!isStats || isStats && $(this).prev().html() == $(that).prev().html()
	                            )
	                    ) {            
	                    rowspan = $(that).attr("rowspan") || 1;
	                    rowspan = Number(rowspan)+1;
	                    $(that).attr("rowspan",rowspan);
	                    // do your action for the colspan cell here            
	                    //$(this).hide();
	                    $(this).remove(); 
	                    // do your action for the old cell here    
	                } else {            
	                    that = this;         
	                }          
	                // set the that if not already set
	                that = (that == null) ? this : that;      
	            });     
	        });    
	    });  
	}; 

	function reviewWrite(sell_number, title){
		window.open("reviewwrite.do?sell_number="+sell_number+"&sell_title="+title, "제품번호 검색", "width=850, height=800, left=600, top400", "resizable=no");
	}
	
	
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

</body>
</html>