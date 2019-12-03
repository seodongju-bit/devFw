<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
#content{
width: 75%;
height:1000px;
padding: 5px;
margin-left: 290px;
border: 0px solid #bcbcbc;   
}
.btn{
float:right;
}
#container{
height:1000px;
}
container.a{
float:right;
}

a:visited {
  color: black;
}

/* mouse over link */
a:hover {
  color: gray;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시판 목록</title>
 
<!-- 공통 CSS -->
<!--  <link rel="stylesheet" type="text/css" href="/css/common/common.css"/>-->

<!-- 공통 JavaScript -->
<!--  <script type="text/javascript" src="/js/common/jquery.js"></script>-->

                     
</head>
<body>
<div id="wrap">
	<div id="container">
	<!-- <button type="button" class="btn black mr5" onclick="javascript:goBoardWrite();">1:1문의하기</button>-->
	      <a href="${contextPath}/questions1.do" target="_blank">더 보기</a>
		<div class="inner">		
			<h2>신고사항</h2>			     
			<form id="boardForm" name="boardForm">
				<input type="hidden" id="function_name" name="function_name" value="getBoardList" />
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
	
			
			                                
				<table class="table table-hover" id="evnet_td">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="20%" />
						<col width="20%" />
					
					</colgroup>
					<thead>		
						<tr>
							<th>신고번호</th>       
							<th>신고내용</th>
							<th>신고분류</th>
							<th>신고자</th>
							<th>신고일자</th>
							
						</tr>
					</thead>
					
					<c:forEach var="notice" items="${List}" varStatus='index' >					
					<thead>
					<tr align="center" onclick="location.href='${contextPath}/noticeDetail.do?de_number=${notice.de_number}'">            
					<td>${notice.de_number}</td>
					<td>${notice.de_contents}</td>
					<td>${notice.de_division}</td>
					<td>${notice.mem_no}님</td>
					<td>${notice.de_date}</td>
					</tr>
					</thead>
					
					</c:forEach>
			
				</table>
				
		
				             
			</form>			
			<!-- <div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardWrite();">작성하기</button>
			</div>-->
		</div>                   
		<br>
		<br>
		<br>
		<br>
		<br>
		 <a href="${contextPath}/questions.do" target="_blank">더 보기</a>
		<div class="inner2">		
			<h2>문의사항</h2>			
			<form id="boardForm" name="boardForm">
				<input type="hidden" id="function_name" name="function_name" value="getBoardList" />
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
				
			
		    	 
				<table class="table table-hover" id="evnet_td">              
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="40%" />
						<col width="10%" />
					
					</colgroup>
					<thead>		
						<tr>
							<th>문의번호</th>
							<th>문의내용</th>
							<th>문의답변</th>
							<th>문의회원</th>
						</tr>                      
					</thead>
					<c:forEach var="notice2" items="${List2}" varStatus='index' >					
					<thead>
					<tr align="center" onclick="location.href='${contextPath}/noticeDetail2.do?qu_number=${notice2.qu_number}'">            
					<td>${notice2.qu_number}</td>
					<td>${notice2.qu_contents}</td>
					<td>${notice2.qu_answer}</td>
					<td>${notice2.mem_no}</td>
				
					</tr>
					</thead>
					
					</c:forEach>

				
				</table>            
			</form>			
			
		</div>
 
</div>

</body>
</html>