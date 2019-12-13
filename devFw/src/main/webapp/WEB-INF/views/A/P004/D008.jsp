<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet">
<style>
#content{
height:1000px;
}

</style>
<script>
function takecoupon(co_number, stdate, enddate){
	
	var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1
    var day = date.getDate();
    if(month < 10){
        month = "0"+month;
    }
    if(day < 10){
        day = "0"+day;
    }
    var today = year+"-"+month+"-"+day;
    


	 if(stdate <= today && enddate >= today){
		 $.ajax({
				type : "POST",
				url : "${contextPath}/devFw/takecoupon.do",
				data : {	
					"co_number" : co_number
				},
				success : function(data) {
					if(data.cnt>0){
					alert('이미 발급 받은 쿠폰입니다.');
					return false;
					}else{
						alert("쿠폰이 발급 되었습니다.");
					}
				},
				error : function() {
					alert('등록 실패');
				}
			});
	}else{
	alert("발급기간이 종료된 쿠폰 입니다.");
	return false;
	}
	
}
</script>


</head>
<body>
<h1 align="center">쿠폰 발급기</h1>
<table class="table table-hover">
<tr>
<th>쿠폰이름</th>
<th>기간</th>
<th>할인가격</th>
<th>발급</th>
</tr>

<c:forEach var="coupon" items="${couponsList}" varStatus='index' >
<tr align="center">
<td>${coupon.co_name}</td>
<td>${coupon.co_stdate}&nbsp;~&nbsp;${coupon.co_enddate}</td>
<td>${coupon.co_percent}</td>
<td><input type="button" class="btn btn-default" value="발급" onclick="takecoupon('${coupon.co_number}','${coupon.co_stdate}','${coupon.co_enddate}')"></td>
</tr>
</c:forEach>

</table>

<script src="../devFw/resources/js/bootstrap.min.js"></script>
</body>
</html>