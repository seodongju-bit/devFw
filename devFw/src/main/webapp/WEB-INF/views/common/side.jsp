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

* {
  box-sizing: border-box;
}

/* Create a column layout with Flexbox */
.row {
  display: flex;
}

/* Left column (menu) */
.left {
  flex: 35%;
  padding: 15px 0;
}

.left h2 {
  padding-left: 8px;
}

/* Right column (page content) */
.right {
  flex: 65%;
  padding: 15px;
}

/* Style the search box */
#mySearch {
  width: 100%;
  font-size: 18px;
  padding: 11px;
  border: 1px solid #ddd;
}

/* Style the navigation menu inside the left column */
#myMenu {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

#myMenu li a {
  padding: 12px;
  text-decoration: none;
  color: black;
  display: block
}

#myMenu li a:hover {
  background-color: #eee;
}     

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
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
    <input type="text" id="mySearch" onkeyup="myFunction()" placeholder="Search.." title="Type in a category">
    <ul id="myMenu">
      <li><a href="#">브랜드패션</a>
      <ul>
      <li><a href="#">남성용패션</a></li>
       <li><a href="#">여성용패션</a></li>
      </ul>
      </li>
        <li><a href="#">의류/잡화</a>
      <ul>
      <li><a href="#">남성용</a></li>
       <li><a href="#">여성용</a></li>
      </ul>
      </li>
       <li><a href="#">식품</a>
      <ul>
      <li><a href="#">남성용</a></li>
       <li><a href="#">여성용</a></li>
      </ul>
      </li>
       <li><a href="#">생활</a>
      <ul>
      <li><a href="#">남성용</a></li>
       <li><a href="#">여성용</a></li>
      </ul>
      </li>
       <li><a href="#">디지털/가전</a>
      <ul>
      <li><a href="#">남성용</a></li>
       <li><a href="#">여성용</a></li>
      </ul>
      </li>
       <li><a href="#">도서/취미</a>
      <ul>
      <li><a href="#">남성용</a></li>
       <li><a href="#">여성용</a></li>
      </ul>
      </li>
       <li><a href="#">육아/출산</a>
      <ul>
      <li><a href="#">남성용</a></li>
       <li><a href="#">여성용</a></li>
      </ul>
      </li>
       <li><a href="#">화장품</a>
      <ul>
      <li><a href="#">남성용</a></li>
       <li><a href="#">여성용</a></li>
      </ul>
      </li>
       <li><a href="#">가방</a>
      <ul>
      <li><a href="#">남성용</a></li>
       <li><a href="#">여성용</a></li>
      </ul>
      </li>
    </ul>
  </div>
  
  <div class="right" style="background-color:#ddd;">
    dddddd
  </div>
</div>

<script>
function myFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("mySearch");
  filter = input.value.toUpperCase();
  ul = document.getElementById("myMenu");
  li = ul.getElementsByTagName("li");
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}
</script>



</body>
</html>