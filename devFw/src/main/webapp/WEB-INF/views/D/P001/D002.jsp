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

p.inset {
border-style: inset;
position:relative;
height:150px;                             
}                              
</style>




<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../pro27/resources/css/bootstrap.min.css" rel="stylesheet">
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


	<p id="f" style=" margin-right: 0px;">내가 작성한 리뷰 목록</p>

	<table class="table table-hover">

		<tr>
			<!-- <th colspan="3"> <input type="button" class="btn btn-default" value="전체"> </th> -->
			<th colspan="3">
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a href="review.do">My</a></li>

					</ul>
				</div>
			</th>
		</tr>

		<tr>
			<th colspan="1" align=left>주문상품</th>
		
			<th id="c"><a href="#"><span style="color: blue;">주문상세
						보기></span></a>
		</tr>

		<tr>                    
			<td align="left"><img src="http://placehold.it/120x166"></td>
			
            <td align="left"><p class="inset">An inset border.</p></td>

			<td align="center">분류<br>
			<button type="button" onclick="location.href='mypage.do' ">리뷰상세</button><br>
			<input type="button" class="btn btn-link" value="리뷰내용조회"><br> 
			<input type="button" class="btn btn-link" value="월별 추천수"><br> 
			<input type="button" class="btn btn-link" value="total추천수"><br> 
			<input type="button" class="btn btn-link" value="수익"><br> 

			</td>
			
			
		</tr>

		<tr>     
			<td align="left"><img src="http://placehold.it/120x166"></td>
			
            <td align="left"><p class="inset">An inset border.</p></td>

			<td align="center">분류<br>
			<button type="button" onclick="location.href='mypage.do' ">리뷰상세</button><br>
			<input type="button" class="btn btn-link" value="리뷰내용조회"><br>
			<input type="button" class="btn btn-link" value="월별 추천수"><br> 
			<input type="button" class="btn btn-link" value="total추천수"><br> 
			<input type="button" class="btn btn-link" value="수익"><br> 

			</td>
			
			
		</tr>
     
		<tr>
			<td align="left"><img src="http://placehold.it/120x166"></td>
			
            <td align="left"><p class="inset">An inset border.</p></td>

			<td align="center">분류<br>
			<button type="button" onclick="location.href='mypage.do' ">리뷰상세</button><br>
			<input type="button" class="btn btn-link" value="리뷰내용조회"><br>
			<input type="button" class="btn btn-link" value="월별 추천수"><br> 
			<input type="button" class="btn btn-link" value="total추천수"><br> 
			<input type="button" class="btn btn-link" value="수익"><br> 

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
	<script src="../pro27/resources/js/bootstrap.min.js"></script>

            
	<div id="side">

		<table class="table table-hover" id="side-tb">
			<tr>
				<td align="center">My</td>
			</tr>
			<tr>
				<td style="background-color: #000000;"><a href="#"><strong
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