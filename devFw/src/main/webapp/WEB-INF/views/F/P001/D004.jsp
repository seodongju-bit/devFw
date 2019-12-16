<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<style>

	.container {
			width:1120px;
	max-width:none !important;
	}
	
	body, html {
	height:100%;
	}
    #banner{
    /* margin-left: auto;
    margin-right: auto; */
    width: 1095px;
    height: 100%;
    margin-right: 0; 
    
    }                               

  div.gallery:hover {         
  border: 1px solid #777;
}   

div.gallery{                       
    border: 1px solid #ccc;     
    }
#imgBox{
	width:1095px;
	height: 160px;
	overflow:hidden;
	
}

#imgBox:hover{
	overflow: visible;
	z-index: 1;

}
#eventContent{
	widht:100%;
	height: 80px;
	background-color: #2E2E2E;
	color: white;
}
</style>
<script>

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
<div class="container">
	<div class="banner" id="banner">
	<h2>이벤트 목록</h2>
	<c:forEach var="banner" items="${eventbanner}">
		<div class="gallery" style=" margin-top: 35px;">
			<div id="imgBox">
				<a href="eventSell.do?event=${banner.no_number }" style="align: center;">
    				<img src="${banner.NO_BANNER}" alt="" width="1095" height="400" >
    			</a>
			</div>
			<div id="eventContent">
				<p align="center" style="font-size: 30px; font-style: italic; font-weight: bolder;">${banner.NO_TITLE}</p>
				<p align="center" style="font-style: italic; font-weight: bolder;">이벤트 기간: ${banner.NO_STDATE}&nbsp; ~ &nbsp;${banner.NO_ENDDATE}</p>
			</div>
		</div>
	</c:forEach>
	</div>
</div>
</body>
</html>        