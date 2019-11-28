<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="item" value="${searchItem}" />
<head>
<!DOCTYPE html>
<style>
	#contentsBody{
		width:1250px;
		background-color: gray;
		margin:0 auto;
	}
</style>
<script>
$(document).ready(function(){
	var contents = document.getElementById("contentsBody");
	contents.innerHTML='${item.sell_contents}';
});
</script>
</head>
<html>
<body>
    <div id="contentsBody">123213</div>
</body>
</html>