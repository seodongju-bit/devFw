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
<meta charset="UTF-8">
<style>   
body {
  margin: 0;
  padding: 0;
}

#topMenu{
	width:100%;
	height:20px;
	border-bottom:5px solid #7F7F7F;	
	margin: 0px;
	padding:2px;
	box-sizeing:border-box;
	background-color: #F3F3F3;
	font-size: 15px;
}
#toplogo{
	position:absolute;
	top:30px;
	left:50px;
	width:200px;
	
}

#topsearch{
	position:absolute;
	top:50px;
	left:350px;
	width:200px;
}


#header{
	position:relative;
	margin:0;
	padding:0;
	height:165px;
	background-color:#F3F3F3;
}
#headerBody{
	position:relative;
	margin:0;
	padding:0;
	height:134px;
}
#menuBar{
	margin:0 auto;
	width:1109px;
	height:30px;
	text-align:center;
}
#menuBar > .mainMenu{
	display:inline-block;
}

#menuBar > #dropMenu {
  display: inline-block;
}
.mainMenu >.menubtn {
  background-color:rgb(94, 94, 94);
  color:white;
  width:180px;
  height:30px;
  margin:0px;
  padding:0px;
  font-size:16px;
  border: none;
  cursor: pointer;
}

#dropMenu >.menubtn {
  background-color:#9E9E9E;
  color:white;
  width:180px;
  height:30px;
  margin:0px;
  padding:0px;
  font-size:16px;
  border: none;
  cursor: pointer;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: black;
  min-width: 180px;
  z-index: 1;
  opacity: 0.8;
}

.dropdown-content .menu1{
  color:white;
  padding: 12px 8px;
  text-decoration: none;
  display: block;
}
.dropdown-content2{
  display: none;
  position: absolute;
  top:0px;
  left:180px;
  background-color: black;
  width: 928px;
  height:224px;
  color:white;
  z-index: 1;
  text-align:left;
  opacity: 2;
}

.dropdown-content .menu1:hover{
	background-color: white;
	color:black;
}

#dropMenu:hover .dropdown-content {
  	display: block;
}
.menu1:hover  .dropdown-content2{
	display: block;
}

.dropdown-content2 a{
	color:black;
 	 padding: 12px 8px;
  	text-decoration: none;
  	display: block;
}

.menu2{color:black;}


</style>
<title>Insert title here</title>
</head>
<body>

<div id="topMenu">탑메뉴</div>     
<div id="header">
	<div id="headerBody">
		<a href="${contextPath}/main.do"><img id="toplogo" src="${contextPath}/resources/image/logo.png"  /></a>
		<input type="text" id="topsearch"/>
	
	</div>
	<div id="menuBar">
		<div id="dropMenu">
			<button class="menubtn">카테고리</button>
  			<div class="dropdown-content">
  				<div class="menu1">링크1
  					<div class="dropdown-content2">
						<a href="#">카테고리를 넣어주세요.</a>
					</div>
  				</div>
  				<div class="menu1">Link 2
  					<div class="dropdown-content2">
						<div class="menu2">메뉴2_2</div>
						<div class="menu2">메뉴2_2</div>
						<div class="menu2">메뉴2_2</div>
					</div>
  				</div>
  				<div class="menu1">Link 3
  					<div class="dropdown-content2">
					</div>
  				</div>
  				<div class="menu1">Link 4
  					<div class="dropdown-content2"></div>
  				</div>
  				<div class="menu1">Link 5
  					<div class="dropdown-content2"></div>
  				</div>
  			</div>
		</div>
		<div class="mainMenu"><button class="menubtn">베스트상품</button></div>
		<div class="mainMenu"><button class="menubtn">기획전</button></div>
		<div class="mainMenu"><button class="menubtn">리뷰랭킹</button></div>
		<div class="mainMenu"><button class="menubtn">쿠폰</button></div>
		<div class="mainMenu"><button class="menubtn">이벤트/공지사항</button></div>
	</div>
	
</div>


</body>
</html>