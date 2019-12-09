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
<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />

  <style>

#a{
width:250px;
height:800px;
background-color: white;
border: 1px solid #bcbcbc;
text-align:left;
}
   
   #cc{
   width:200px;
   border: 1px solid #bcbcbc;
   font-color: black;
   }
   
   
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
<script>
function fn_coupon1(){
	
	var _isLogOn=document.getElementById("isLogOn");
	var isLogOn=_isLogOn.value;
	
	if(isLogOn=="false" || isLogOn=='') {
		alert("로그인 후 조회가 가능합니다.");
		location.href="${contextPath}/signinpage.do";
	}else{
		location.href="${contextPath}/coupon.do";
	}
}

function withdraw(){
	   var popupX = (window.screen.width/2) - (400);
	   var popupY = (window.screen.height/2) - (500);
	   window.open("initWithdraw.do", "창", "width=400, height=250, left="+popupX+", top="+popupY);
	}
</script>
</head>
<body>

<aside class="well span3 oc" id="a" role="navigation">
      <ul class="nav nav-list">
        <li class="nav-header">My 쇼핑</li>
        <li align=left><a href="#">주문목록/배송조회</a></li>
        <li><a href="#">취소/반품/교환/환불 내역</a></li>
        <li><a href="#">배송관리</a></li>
        <li class="nav-header">My 혜택</li>
        <li><a onclick="fn_coupon1()">할인 쿠폰</a></li>
        <li><a onclick="withdraw()">출금 신청</a></li>
        <li class="nav-header">My 활동</li>
        <li><a href="myReview.do">내가 작성한 리뷰</a></li>
        <li><a href="#">문의 하기</a></li>
        <li><a href="alert.do">신고내역</a></li>
        <li><a href="#">구매 리뷰</a></li>
        <li><a href="#">찜 리스트</a></li>
        <li><a href="point.do">포인트 사용 내역</a></li>
        <li class="nav-header">My 정보</li>
        <li><a href="#">개인정보확인/수정</a></li>
        <li><a href="#">결제수단-쿠페이 관리</a></li>
        <li><a href="#">배송지 관리</a></li>
      </ul>
</aside>
	 <br>
	 <br>
	 <table class="table table-hover" id="cc">
	 <tr align=center>
	 <th><a href="#" style="color:black;">리컴문의</a></th>
	 </tr>
	 <tr>
	 <th><a href="#" style="color:black;">고객의 소리<br>
	 제안-칭찬-페이 관리</a>
	 </th>
	 </tr>
	 <tr>
	 <th>
	 <a href="#" style="color:black;">취소/반품 안내</a>
	 </th>
	 </tr>
	 </table>
	 
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../devFw/resources/js/bootstrap.js"></script>
	<script src="../devFw/resources/js/bootstrap.min.js"></script>

</body>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
</html>