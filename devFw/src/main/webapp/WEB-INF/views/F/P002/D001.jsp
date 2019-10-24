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
<link rel="stylesheet" type="text/css" href="resources/CSS/F_P002_D001.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	$('#itemsImg').attr('src','resources/image/itemsDetailView/001.jpg');
	$('.miniImg').attr('src','resources/image/itemsDetailView/001.jpg');
})
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="category" >
	<div id="categoryK">
		<a href="#"> 분류 </a> > 
		<a href="#"> 1차 분류 </a> > 
		<a href="#"> 2차 분류 </a>
	</div>
</div>

<div id="sellBox" >
	<div id="imgBox">
		<img id="itemsImg" src="" width="400px" height="400px" />
		<div id="imgList">
			<img class="miniImg" src="" width="60px" height="60px" />
		</div>
	</div>
	<div id="selectBox"> 
		<div id="sellerInfo" class="sellInfo">
			<h2>[공식] 리얼베리어 익스트림/모이스처/시카/엑티브브이 크림 외+증정</h2>
		</div>
		<div class="sellInfo">
			<p id="addInfo">혜택/이벤트 정보를 넣어주세요</p>
		</div>
		<div  class="sellInfo">
			<p id="itemPrice">가격정보를 넣어주세요</p>
		</div>
		<div  class="sellInfo">
			<p id="itemDelivery">배송정보를 넣어주세요</p>
		</div>
		<div id="orderOption" class="sellInfo">옵션선택
			<select id="oprion1" class="form-control">
				<option>옵션1</option>
	 			<option>옵션2</option>
	  			<option>옵션3</option>
	  			<option>옵션4</option>
	  			<option>옵션5</option>
			</select>
		</div>
		<div id="selectItem" class="sellInfo">선택상품
			<div id="item_1" name="pro_number" >상품1  수량<input type="number" name="detail_quantity" class="quantity" value="1" min="0" max="99" ></div>
			<div id="item_2" name="item_2"> 상품2  수량<input type="number" class="quantity" value="1" min="0" max="99" ></div>
		</div>
		<div id="sellButton">
			<button class="btn btn-light">장바구니</button>
			<button class="btn btn-primary">바로구매</button>
		</div>
	</div>
</div>
<div id="itemsInfoSelect">
	<button id="itemsInfo" class="btn btn-primary">상품정보</button>
	<button id="itemsReview" class="btn btn-primary">리뷰</button>
	<button id="itemsQna" class="btn btn-primary">QnA</button>
	<button id="itemsSaller" class="btn btn-primary">판매자정보</button>
</div>

</body>
</html>