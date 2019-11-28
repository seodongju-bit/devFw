<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="stylesheet" type="text/css" href="resources/css/A_P001_D001.css?ver=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign In Form</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        
    </head>
    <body>
    
    
    
    
			
    	
      <form action="${contextPath}/login.do" method="post" accept-charset="UTF-8"> 
		<c:choose>
			<c:when test="${sessionId != null}">
				<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
				<h3>'${sessionId}' 님 환영합니다! </h3>
			<h3><a href="logout">로그아웃</a></h3>

			</c:when>
			<c:otherwise>
			
      
        <h1>로그인</h1>
        
        
          <label for="id" style="text-align: left;">회원 ID:</label>
          <input type="text" id="mem_id" name="mem_id" placeholder="ID">
          <label for="password" class="w">비밀번호:</label>
          <input type="password" id="mem_pw" name="mem_pw" placeholder="Password">  
         
          <input type="hidden" id="referrer" name="referrer">
        <button id="login_btn" type="submit">로그인 </button>
          <br></br>
          
          <div id="naver_id_login" style="text-align:center"><a href="${url}">
		<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
		<br>
		</c:otherwise>
		</c:choose>
			<!-- 네이버 로그인 창으로 이동 -->
		
		
		
        <button  class="small-btn" type="button" onclick = "javascript:idsearchpopup()">아이디 찾기</button>   
        <button  class="small-btn" type="button" onclick = "javascript:pwsearchpopup()">비밀번호 찾기</button>      
        <button  class="small-btn" type="button" onclick = "location.href='memberdivisionpage.do'">회원가입</button>
        <button  class="small-btn" type="button" onclick = "location.href='main.do'">홈페이지로</button>
        
        <br></br>
       
		
  		</form>
  		
  		
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	  <script type="text/javascript">  
	    var message = "<%=request.getParameter("message") %>" ;
	    
		
	 	window.onload=function()	
	 	{	
	 		var referrer =  document.referrer;
	 		document.getElementById('referrer').value = referrer;
	 		if(message!="" && message!="null"){
	 			alert(message);
	 		}
		}
	 	
	 	

        function idsearchpopup(){
            var url = "${contextPath}/searchidpage.do";
            var name = "idSearch";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        function pwsearchpopup(){
            var url = "${contextPath}/searchpwpage.do";
            var name = "pwSearch";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
		</script>
    </body>
</html>