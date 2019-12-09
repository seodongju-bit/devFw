<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<!DOCTYPE html>
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">    
<style>
body{
	background-color: #f2f2f2;
}
.reviewId{
	display: inline;
	width: 200px;
	background-color: white;
	float:right;
}
#reviewBox{
	background-color: lightblue;
	width: 300px;
	height: 45px;
	border-radius: 5px;
	padding: 5px;
	margin:0 auto;
}
#reviewer{
	position: relative;
	top: 7px;
	font-weight: bold;
}
#textArea{
	width: 800px;
	background-color: white;
	margin: 10px auto;
	min-height: 300px;
	max-height: 500px;
	border-radius: 5px;
	overflow: scroll;
}}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function recomMove(){
	var url = "sellItems.do?sell_no=${reviewInfo.SELL_NUMBER }&recom=${reviewInfo.REVIEW_NUMBER }";
	opener.document.location.href = url;
	window.close();
}
</script>
</head>
<html>
<body>
   <h2>리뷰보기</h2>
   <div id="reviewBox"><span id="reviewer">리뷰어</span>
   		<div class="reviewId form-control" >${reviewInfo.MEM_ID }</div>
   </div>
   <div id="reviewBox"><span id="reviewer">리뷰어추천수</span>
   		<div class="reviewId form-control" >${reviewInfo.MEM_TOTALRC }</div>
   </div>
   	<div id="textArea">${reviewInfo.REVIEW_CONTENT }</div>
   <button class="btn btn-default" onclick="recomMove()">선택</button>
   <button class="btn btn-default" onclick="window.close()">닫기</button>
   
</body>
</html>