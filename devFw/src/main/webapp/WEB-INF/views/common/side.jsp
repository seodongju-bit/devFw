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
   .no-underline{
      text-decoration:none;
   }      
   #side ul{
   font-size:15px;
   list-style:none;
   }  
   
   #side ul li{
   background-color:#F3F3F3;
   width:150px;
   border:1px solid white;
   border-radius:0px;
   height:50px;                   
   line-height:50px;
   text-align:center;
   float:left;
   color:white;
   font-size:19px;
   }
   
   #side ul li:hover{             
   background-color:#9E9E9E;
   }
   
   #side ul 
   
   
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
	
	<!-- 
	<h1>
		<a href="#"  class="no-underline">회원관리</a><br>
	    <a href="#"  class="no-underline">게시판관리</a><br>
	    <a href="#"  class="no-underline">상품관리</a><br>
    </h1>
     -->
     <div id="side"> 
	<ul>
<li>브랜드패션      
<ul>                                  
<li>남성의류</li>
<li>여성의류</li>
<li>악세서리</li>
<li>화장품</li>
</ul>
</li>
<li>의류/잡화</li>
<li>식품</li>
<li>생활</li>
</ul>
</li>
	</ul>
	</div>
</body>
</html>