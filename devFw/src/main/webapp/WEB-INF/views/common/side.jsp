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
body {
  font-family: Arial, Helvetica, sans-serif;    

     
}



/* Create a column layout with Flexbox */
.row {
  display: flex;
}

/* Left column (menu) */
.left {
  flex: 35%;    
  padding: 15px 0;
   font-size:20px;
                      
                        
  }

.left h2 {
  padding-left: 8px;                    
}

                             
/* 왼쪽 메뉴 스타일 */
#myMenu {         
  list-style-type: none;
  padding: 0;          
  margin: 0;
  width:200px;       
 
}

#myMenu li{
font-size:20px;
}                  
      
#myMenu li a {
  padding: 12px;
  font-size:15px;
  text-decoration: none;
  color: black;
  display: block
}

#myMenu li a:hover {
  background-color: #eee;
}     

.main {
  margin-left: 160px;
  font-size: 28px; 
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav ul {font-size: 18px;}
}
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
    
<div class="row">
  <div class="left" style="background-color:#bbb;">
    <h2>카테고리</h2>
    
    <ul id="myMenu">
      <li><a href="#">브랜드패션</a>
      <ul>
      <li><a href="#">브랜드여성의류</a></li>
       <li><a href="#">브랜드남성의류</a></li>
       <li><a href="#">브랜드진/캐쥬얼</a></li>
       <li><a href="#">브랜드아동패션</a></li>
      </ul>
      </li>
        <li><a href="#">의류/잡화</a>
      <ul>
      <li><a href="#">여성의류</a></li>
       <li><a href="#">남성의류</a></li>
        <li><a href="#">언더웨어</a></li>
       <li><a href="#">유아동의류</a></li>
      </ul>
      </li>
       <li><a href="#">식품/생필품</a>
      <ul>
      <li><a href="#">신선식품</a></li>
       <li><a href="#">가공식품</a></li>
       <li><a href="#">건강식품</a></li>
       <li><a href="#">커피/음료</a></li>
      </ul>
      </li>
       <li><a href="#">홈데코</a>
      <ul>
      <li><a href="#">침구/커튼</a></li>
       <li><a href="#">조명/인테리어</a></li>
          <li><a href="#">생활용품</a></li>
       <li><a href="#">주방용품</a></li>
      </ul>
      </li>
       <li><a href="#">디지털/가전</a>
      <ul>
      <li><a href="#">노트북</a></li>
       <li><a href="#">대형가전</a></li>
       <li><a href="#">계절가전</a></li>
       <li><a href="#">음향가전</a></li>
      </ul>
      </li>
       <li><a href="#">스포츠/건강</a>
      <ul>
      <li><a href="#">스포츠의류</a></li>
       <li><a href="#">건강/의료용품</a></li>
        <li><a href="#">스포츠용품</a></li>
       <li><a href="#">건강식품</a></li>
      </ul>
      </li>
       <li><a href="#">자동차</a>
      <ul>
      <li><a href="#">자동차용품</a></li>
       <li><a href="#">타이어/부품</a></li>
      </ul>
      </li>
       <li><a href="#">화장품</a>
      <ul>
      <li><a href="#">기초스킨케어</a></li>
       <li><a href="#">남성용</a></li>
         <li><a href="#">여성용</a></li>
      </ul>
      </li>
       <li><a href="#">티켓</a>
      <ul>
      <li><a href="#">콘서트</a></li>    
       <li><a href="#">방송</a></li>
      </ul>
      </li>
    </ul>
  </div>
  

</div>





</body>
</html>