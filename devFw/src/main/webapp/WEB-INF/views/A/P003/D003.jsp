<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>

<style>

.w{

font-size: 15px;
font-weight:bold;
}

#pwcheck{
  text-align:center;
  max-width: 700px;
  height: 300px;
  margin: 20px auto;
  padding: 30px 20px;
  background: #FFFFFF;
  border-radius: 8px;
  border-style: solid;
  border-color: #A9D0F5;
}

.secession-btn{
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 400px;
  border: 1px solid lightgray;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 gray inset;
  margin-bottom: 10px;
}
.pwdbox{
background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 400px;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

#info{
min-height: 1200px;
}

h1{
text-align:center;
font-size: 30px;
font-weight:bold;
}

h2{
text-align:center;
font-size: 15px;
}



#f {
	text-align: left;
	margin: 0px;
	padding: 0px;
}

#b {
	color: black;
	/* veritcal-align: middle;
text-align:center; */
}

#c {
	text-align: center;
}

#caution-box {
	border: 1px solid #bcbcbc;
	margin: 20px;
	width: 80%;
	margin-left: 140px;
	margin-right: 0px;
}

#box {
	padding: 20px;
}

#z {
	text-align: center;
	max-width: 100%;
	width: auto;
	height: auto;
	/* padding-left: 250px; */
}

#r {
	text-align: right;
	font-size: 13px;
}

check {
	background-color: #f3f3f3;
}



td

{
padding:0px 0px 0px 0px;
}



.zipbox{
	width: 10%;
}


.addressbox1,	
.addressbox2{
	width: 30%;
}

.memsecessiontitle{
font-weight: bold;
font-size: large;
}

table {
    border-spacing: 0;
    border-collapse: collapse;
}

table thead th {
    padding-top: 8px;
    border-top: 1px solid #d9d9d9;
    border-left: 1px solid #d9d9d9;
    padding-bottom: 7px;
    border-right: 1px solid #d9d9d9;
    font-size: 11px;
    font-weight: bold;
    color: #1c458e;
    background: #fafcfe url(http://image.gmarket.co.kr/common/helpdesk/2012/11/bg_dot_line03.gif) repeat-x left bottom;
}

table tbody td {
    padding-top: 8px;
    padding-bottom: 7px;
    text-align: center;
    font-size: 11px;
    border-top: 1px solid #d9d9d9;
    border-left: 1px solid #d9d9d9;
    border-bottom: 1px solid #d9d9d9;
    border-right: 1px solid #d9d9d9;
    color: #666;
}

</style>




<meta charset="UTF-8">
<title>비밀번호 확인</title>
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
</head>
<body>


	
	<h1>비밀번호 확인</h1>
	
	<div id="pwcheck">
	<p>
	<label for="password" class="w" style="float:center;">회원님의 정보를 보호하기 위해 비밀번호를 다시 확인합니다.</label>
    </p>
    <input type="password" class="pwdbox" id="mem_pw" name="mem_pw"maxlength="20" placeholder="비밀번호 입력">
    <button type="submit" class="secession-btn" id="memberFormButton" > 확인</button>
	</div>
</body>
</html>