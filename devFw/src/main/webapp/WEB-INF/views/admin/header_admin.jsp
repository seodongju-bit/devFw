<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <a class="navbar-brand" href="${contextPath}/adminPage.do">관리자 페이지</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar"
       aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-between" id="navbar">
        <div class="navbar-nav">
          <a class="nav-item nav-link active" href="./index.html">대시보드</a>
          <a class="nav-item nav-link" href="./notice.html">공지사항</a>
          <a class="nav-item nav-link" href="./event.html">이벤트</a>
          <a class="nav-item nav-link" href="./user.html">회원관리</a>
        </div>
        <div class="navbar-nav mr-sm-2">
          <a class="nav-item nav-link" href="./userLogout.html">로그아웃</a>
          <a class="nav-item nav-link" href="./userEdit.html">관리자 정보 수정</a>
        </div>
      </div>
    </nav>

</body>
</html>