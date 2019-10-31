<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
			<th>배송중<br> <a href="#" style="">0건</a></th>
			<th>할인쿠폰<br> <a href="#" style="">0장</a></th>
			<th>포인트<br> <a href="#" style="">0 P </a></th>
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
			<!-- <th colspan="3"> <input type="button" class="btn btn-default" value="전체"> </th> -->
			<th colspan="3">
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#">My</a></li>
						<li><a href="#">전체</a></li>
					</ul>
				</div>
			</th>
		</tr>

		<tr>
			<th colspan="2" align=left>주문일 2019.08.20</th>
			<th id="c"><a href="#"><span style="color: blue;">주문상세
						보기></span></a>
		</tr>

		<tr>
			<td align="left"><img src="http://placehold.it/120x166"></td>
			<td align="center"><a href="#" id="b">에이수스 Vivobook
					X507UA-EJ504 (i5-8250U WIN미포함 4G SSD 256G)<br>570,000원 / 1개
			</a></td>


			<td align="center">배송상태<br>
			<br> <span style="color: green;">수요일 8/21 도착</span><br> 
			<input type="button" class="btn btn-link" value="배송조회"><br> 
		    <input type="button" class="btn btn-link" value="교환신청"><br> 
		    <input type="button" class="btn btn-link" value="반품신청"><br> 
			<p><a href="reviewwrite.do">리뷰 작성하기<br></a>
			</td>
		</tr>

		<tr>
			<td align="left"><img src="http://placehold.it/120x166"></td>
			<td align="center"><a href="#" id="b">에이수스 Vivobook
					X507UA-EJ504 (i5-8250U WIN미포함 4G SSD 256G)<br>570,000원 / 1개
			</a></td>


			<td align="center">배송상태<br>
			<br> <span style="color: green;">수요일 8/21 도착</span><br> <input
				type="button" class="btn btn-link" value="배송조회"><br> <input
				type="button" class="btn btn-link" value="교환신청"><br> <input
				type="button" class="btn btn-link" value="반품신청"><br> <input
				type="button" class="btn btn-link" value="리뷰작성"><br>
			</td>
		</tr>

		<tr>
			<td align="left"><img src="http://placehold.it/120x166"></td>
			<td align="center"><a href="#" id="b">에이수스 Vivobook
					X507UA-EJ504 (i5-8250U WIN미포함 4G SSD 256G)<br>570,000원 / 1개
			</a></td>


			<td align="center">배송상태<br>
			<br> <span style="color: green;">수요일 8/21 도착</span><br> <input
				type="button" class="btn btn-link" value="배송조회"><br> <input
				type="button" class="btn btn-link" value="교환신청"><br> <input
				type="button" class="btn btn-link" value="반품신청"><br> <input
				type="button" class="btn btn-link" value="리뷰작성"><br>
			</td>
		</tr>
	</table>

	<div class="container" align="center" style="max-width:92%;">
		<ul class="pagination">
			<li><a href="#"><</a></li>
			<li><a href="#">></a></li>
		</ul>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../pro27/resources/js/bootstrap.js"></script>
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
						style="color: white;">장바구니 ▶ 0개</strong></a></td>
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
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

</body>
</html>