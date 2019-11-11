<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      
        <h1>로그인</h1>
        
        <fieldset>
          <label for="id" style="text-align: left;">회원 ID:</label>
          <input type="text" id="mem_id" name="mem_id">
          <label for="password" class="w">비밀번호:</label>
          <input type="password" id="mem_pw" name="mem_pw">  
	   	
         
        <button id="login_btn" type="submit">로그인 </button>
       	<br></br>
       	
        <button  class="small-btn" type="button" onclick="location.href='#'">비밀번호 찾기</button>	
		<button  class="small-btn" type="button" onclick="location.href='#'">아이디 찾기</button>	   
        <button  class="small-btn" type="button" onclick="location.href='memberdivisionpage.do'">회원가입</button>
        <button  class="small-btn" type="button" onclick="location.href='#'">판매자등록</button>
        
        <br></br>
       	
        
        </fieldset>
      </form>
      <c:if test='${not empty message }'>
      <script>
	window.onload=function()
	{
  	result();
	}
	function result(){
		alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
	}
	</script>
	</c:if>
    </body>
</html>
