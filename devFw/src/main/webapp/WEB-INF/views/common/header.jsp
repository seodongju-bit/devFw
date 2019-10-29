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
<link rel="stylesheet" href="${contextPath}/resources/css4/bootstrap.min.css">                            
<style>   

/*--------------------------------------------네비게이션 바----------------------------------------------*/
	.navbar a:hover {
    color:#CCCCCC
	}
	
	.navbar {
		background:#DDDDDD;
		margin: 0 0px 0 0px;
		padding: 0;
		height:20px;
		position:relative;
		width:100%;       
		min-width:800px;                        
		max-width:4000px;
	}
/*----------------------------------------------------------------------------------------------------*/

/*---------------------------------------------상단 로고 및 검색바 ------------------------------------------------*/

	#toplogo {
	width: 250px;
	height: 100px;
	float:left;
	margin: 20px 0 20px 0;
	min-width:250px;
	min-height:100px;
}

	.search {
	width:100%;
	height:20%;
	margin: 150px 0 0 50px;
	position:absolute;
	min-width:600px;
	max-width:1000px;
}


/*---------------------------------------------------------- ------------------------------------------------*/

/*-------------------------------------------------상품 카테고리 ------------------------------------------------*/

	#menuBar{
	margin:145px 0 0 auto;
	width:1109px;
	height:30px;
	text-align:center;
	position:absolute;
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
	.menu2{
		color:black;
}

/*---------------------------------------------------------------------------------------------------------*/


.container{
	width:1120px;
	max-width:none !important;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="header" id="header">
		<nav class="navbar navbar-expand navbar-light">
		<div class="collapse navbar-collapse justify-content-between" id="navbar">
        <div class="navbar-nav" id="navleft"style="font-size:0.7em">
          <a class="nav-item nav-link" href="./main.do">홈으로 이동</a>
          <a class="nav-item nav-link" href="./event.html">이 사이트를 시작 페이지로</a>
          <a class="nav-item nav-link" href="./blog.html">즐겨찾기</a>
        </div>
        <div class="navbar-nav mr-sm-2" id="navright" style="font-size:0.7em">
          <a class="nav-item nav-link" href="${contextPath}/member/loginForm.do">로그인</a>
          <a class="nav-item nav-link" href="./userLogout.html">장바구니</a>
          <a class="nav-item nav-link" href="./userEdit.html">고객센터</a>
        </div>
      </div>
		</nav>
		<div class="container">
  	<div class="logo">
	<a href="${contextPath}/main.do"><img id="toplogo" src="${contextPath}/resources/image/logo.png"/></a>
	</div>
      <form class="form-inline">
        <div class="search">
          <input class="form-control" type="search"    
          placeholder="상품을 검색해보세요"aria-label="Search" style=width:300px>
          <button class="btn btn-outline-secondary" type="submit">검색</button>
        </div>
      </form>
      <div id="menuBar">
		<div id="dropMenu">
			<button class="menubtn">전체 카테고리</button>
  			<div class="dropdown-content">
  				<div class="menu1">브랜드패션
  					<div class="dropdown-content2">
						<a href="#">카테고리를 넣어주세요.</a>
					</div>
  				</div>
  				<div class="menu1">패션의류·잡화·뷰티
  					<div class="dropdown-content2">
						<div class="menu2">메뉴2_2</div>
						<div class="menu2">메뉴2_2</div>
						<div class="menu2">메뉴2_2</div>
					</div>
  				</div>
  				<div class="menu1">유아동
  					<div class="dropdown-content2">
					</div>
  				</div>
  				<div class="menu1">식품·생필품
  					<div class="dropdown-content2"></div>
  				</div>
  				<div class="menu1">홈데코·문구·취미·반려
  					<div class="dropdown-content2"></div>
  				</div>
  				<div class="menu1">컴퓨터·디지털·가전
  					<div class="dropdown-content2"></div>
  				</div>
  				<div class="menu1">스포츠·건강·렌탈
  					<div class="dropdown-content2"></div>
  				</div>
  				<div class="menu1">자동차·공구
  					<div class="dropdown-content2"></div>
  				</div>
  				<div class="menu1">여행·도서·티켓·e쿠폰
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
		
	</div>
</body>
</html>