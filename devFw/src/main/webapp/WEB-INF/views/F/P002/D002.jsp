<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<!DOCTYPE html>
<style>
	#contentsBody{
		max-width:1250px;
		background-color: #FAFAFA;
		margin:0 auto;
	}
</style>
<script>
$(document).ready(function(){
	var contents = document.getElementById("contentsBody");
 	contents.innerHTML ='${content}';
	


});
</script>
</head>
<html>
<body>
    <div id="contentsBody">123213</div>
</body>
</html>