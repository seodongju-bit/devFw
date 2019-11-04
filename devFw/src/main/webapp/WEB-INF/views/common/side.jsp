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
      <li><a href="#">패션의류</a>
      <ul>
      <li><a href="#">여성_상의</a></li>
       <li><a href="#">여성_바지</a></li>
       <li><a href="#">여성_스커트</a></li>
       <li><a href="#">여성_원피스</a></li>
       <li><a href="#">여성_아우터</a></li>
       <li><a href="#">남성_상의</a></li>
       <li><a href="#">남성_하의</a></li>
        <li><a href="#">남성_아우터</a></li>   
        <li><a href="#">양말</a></li>
         <li><a href="#">운동화</a></li>
          <li><a href="#">남성구두</a></li>
           <li><a href="#">여성구두</a></li>
            <li><a href="#">가방</a></li>     
             <li><a href="#">악세사리</a></li>            
              <li><a href="#">아동의류</a></li>
               <li><a href="#">아동신발</a></li>
               <li><a href="#">내의/잠옷</a></li>
               <li><a href="#">속옷</a></li>
               <li><a href="#">명품관</a></li>
               
      </ul>
      </li>
        <li><a href="#">가구</a>
      <ul>
      <li><a href="#">침대</a></li>
       <li><a href="#">조명</a></li>
        <li><a href="#">커튼</a></li>
       <li><a href="#">책상</a></li>
        <li><a href="#">의자</a></li>
         <li><a href="#">쇼파</a></li>
       <li><a href="#">수납장</a></li>
       <li><a href="#">옷장/장롱</a></li>
    
      </ul>
      </li>
       <li><a href="#">식품</a>
      <ul>
      <li><a href="#">신선식품</a></li>
       <li><a href="#">가공식품</a></li>
       <li><a href="#">건강식품</a></li>
       <li><a href="#">음료</a></li>
      </ul>
      </li>
       <li><a href="#">가전</a>
      <ul>
      <li><a href="#">컴퓨터</a></li>
       <li><a href="#">노트북</a></li>
          <li><a href="#">프린터</a></li>
       <li><a href="#">pc주변기기</a></li>
       <li><a href="#">휴대폰</a></li>
       <li><a href="#">카메라</a></li>
       <li><a href="#">태블릿</a></li>
       <li><a href="#">게임</a></li>
       <li><a href="#">음향기기</a></li>
       <li><a href="#">대형가전</a></li>
       <li><a href="#">주방가전</a></li>
       <li><a href="#">생활가전</a></li>
      </ul>
      </li>
       <li><a href="#">도서</a>
      <ul>
      <li><a href="#">교육서적</a></li>
       <li><a href="#">자기개발</a></li>
       <li><a href="#">만화</a></li>
       <li><a href="#">소설</a></li>
       <li><a href="#">인물</a></li>
       <li><a href="#">대학교재</a></li>
       <li><a href="#">취미</a></li>
       <li><a href="#">참고서</a></li>
       <li><a href="#">예술</a></li>
       <li><a href="#">자격증</a></li>
       
       
      </ul>
      </li>
       <li><a href="#">생필품</a>
      <ul>
      <li><a href="#">생활용품</a></li>
       <li><a href="#">주방용품</a></li>
        <li><a href="#">문구</a></li>
       <li><a href="#">공구</a></li>
       <li><a href="#">자재</a></li>
       <li><a href="#">반려동물</a></li>
       <li><a href="#">장난감</a></li>
       <li><a href="#">자동차</a></li>

      </ul>
      </li>
       <li><a href="#">스포츠</a>
      <ul>
      <li><a href="#">스포츠의류</a></li>
       <li><a href="#">구기/라켓</a></li>
       <li><a href="#">자전거</a></li>
       <li><a href="#">골프</a></li>
       <li><a href="#">캠핑</a></li>
       <li><a href="#">등산</a></li>
    
      </ul>
      </li>
       <li><a href="#">뷰티</a>
      <ul>
      <li><a href="#">스킨케어</a></li>
       <li><a href="#">선케어/메이크업</a></li>
         <li><a href="#">클렌징/마스크팩</a></li>
            <li><a href="#">바디케어</a></li>
               <li><a href="#">남성화장품</a></li>
      </ul>
      </li>
    
    </ul>
  </div>
  

</div>





</body>
</html>