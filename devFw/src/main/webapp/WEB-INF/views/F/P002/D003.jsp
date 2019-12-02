<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>


<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
<!DOCTYPE html>
<style>
	#contentsBody{
		width:1250px;
		background-color: #FAFAFA;
		margin:0 auto;
	}
</style>
<script>

	
</script>
</head>
<html>
<body>
    <div id="contentsBody">리뷰
    
    
    <p>전체 리뷰</p>
    <table class="table" id="totalReview">
    	<tr>
    		<th>날짜</th>
    		<th>제목</th>
    		<th>작성자</th>
    	</tr>
    	<c:forEach var="reviewList" items="${reviewList}">
    	
    	<tr>
    		<td> <fmt:formatDate value="${reviewList.REVIEW_STDATE }" pattern="yyyy-MM-dd" /> </td>
    		<td>${reviewList.REVIEW_TITLE }</td>
    		<td>${reviewList.MEM_ID }</td>
    	</tr>
    	
    	
    	</c:forEach>
    </table>
    </div>
</body>
</html>