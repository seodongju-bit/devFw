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
function fn_coupon(){
	
	var _isLogOn=document.getElementById("isLogOn");
	var isLogOn=_isLogOn.value;
	
	if(isLogOn=="false" || isLogOn=='') {
		alert("로그인 후 조회가 가능합니다.");
		location.href="${contextPath}/signinpage.do";
	}else{
		location.href="${contextPath}/coupon.do";
	}
}
</script>
</head>
<body>

<aside class="well span3 oc" id="a" role="navigation">
      <ul class="nav nav-list">
        <li class="nav-header">Q&A</li>
        <li><a href="#">자주묻는 질문</a></li>
        <li><a href="#">자주하는 답변</a></li>
        <li class="nav-header">문의글</li>
        <li><a href="#">문의글 등록</a></li>
        <li><a href="#">문의글 답변</a></li>    
        <li class="nav-header">신고글</li>
        <li><a href="#">신고글 작성</a></li>
        <li><a href="#">신고글 확인</a></li>
        <li class="nav-header">문의내역조회</li>
        <li><a href="#">문의내역 조회</a></li>
  
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