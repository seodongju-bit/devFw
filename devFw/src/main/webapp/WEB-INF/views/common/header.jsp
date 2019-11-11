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
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">                           
<style>   

/*---------------------------------------------상단 로고 및 검색바 ------------------------------------------------*/
	/*header*/
	#header {
		border-bottom: 1px solid black;
		height:200px;
	}
	/*header container*/
	#header .container {
		width:1120px;
		max-width:none !important;
		position:relative;
	}
	/*로고*/
	#toplogo {
		width: 250px;
		height: 95px;
		float:left;
		margin: 30px 0 0 0;
		position:relative;
		clear:both;
	}
	/*검색창 박스*/
	.form-inline {
		height:40px;
		position:relative;
		min-width:360px;
		margin: 60px 0 0 35%;
		max-width:none !important;
	}
	
	.form-inline .btn {
		width:50px;
		max-width:none !important;
		float:right;
	}
	/*네비게이션 바*/
	#navbar {
		background-color:#DDDDDD; 
		width:100%;
		min-width:1000px;
	}
	#navleft a {
	   text-decoration: none;
	   color: #666;
	}

	#navleft a:hover {
	   color: #1bc1a3;
	}
	
	#navright a {
	   text-decoration: none;
	   color: #666;
	}

	#navright a:hover {
	   color: #1bc1a3;
	}
	
	
	/*검색어 자동완성창*/
	#suggest {
		display:none; position: absolute; left: 830px; top:80px; border: 0.1px  solid #87cb42; z-index:3;font-weight: bold;background-color:#ffffff; 	
	}
	
	
	
/*---------------------------------------------------------- ------------------------------------------------*/

/*-------------------------------------------------상품 카테고리 ------------------------------------------------*/




	#menuBar{
	width:1124px;
	text-align:center;
	position:absolute;
	float:left;
	margin: 40px 0 0 -12px;
	padding: 0;
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
</style>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var loopSearch=true;			//제시된 키워드를 클릭하면 keywordSearch() 함수의 실행을 중지시킴
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/predictive.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);		//전송된 데이터를 JSON으로 파싱
				displayResult(jsonInfo);		//전송된 JSON 데이터를 표시
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;		//JSON 데이터 개수를 구함
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){			//JSON 데이터를 차례대로 <a> 태그를 이용해 키워드 목록을 만듬
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    //<a>태그로 만든 키워드 목록을 <div> 태그에 차례대로 표시
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}

</script>
<body>
	<div class="header" id="header">
	  <div class="collapse navbar-collapse justify-content-between" id="navbar" >
        <div class="navbar-nav" id="navleft"style="font-size:0.9em; float:left; margin: 6px 0 6px 0; color:#BBBBBB;">
          <a class="nav-item nav-link" href="./main.do">홈으로 이동</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a class="nav-item nav-link" href="./event.html">이 사이트를 시작 페이지로</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a class="nav-item nav-link" href="./blog.html">즐겨찾기</a>
        </div>
        <div class="navbar-nav mr-sm-2" id="navright" style="font-size:0.9em; float:right; margin: 6px 0 0 0; color:#BBBBBB;">
          <a class="nav-item nav-link" href="${contextPath}/login.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a class="nav-item nav-link" href="./userLogout.html">장바구니</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a class="nav-item nav-link" href="./userEdit.html">고객센터</a>
        </div>
      </div>
		<div class="container">
  	<div class="logo">
	<a href="${contextPath}/main.do"><img id="toplogo" src="${contextPath}/resources/image/logo.png"/></a>
	</div>
      <form class="form-inline" name="frmSearch" action="${contextPath}/searchProd.do" style="width:360px;">
          <input class="form-control" type="text"    
          placeholder="상품을 검색해보세요"aria-label="Search" style=width:300px name="searchWord" onKeyUp="keywordSearch()">
          <button class="btn btn-outline-secondary" type="submit" name="search">검색</button>
      </form>
    <div id="suggest">
      <div id="suggestList"></div>
    </div>
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
		<div class="mainMenu"><button class="menubtn"onclick="location.href='bestProduct.do'">베스트상품</button></div>
		<div class="mainMenu"><button class="menubtn"onclick="location.href='eventProduct.do'">이벤트상품</button></div>
		<div class="mainMenu"><button class="menubtn"onclick="location.href='reviewRanking.do'">리뷰랭킹</button></div>
		<div class="mainMenu"><button class="menubtn">쿠폰</button></div>
		<div class="mainMenu"><button class="menubtn"onclick="location.href='event.do'">이벤트/공지사항</button></div>
	</div>
	</div>
		
	</div>  
</body>
</html>                    