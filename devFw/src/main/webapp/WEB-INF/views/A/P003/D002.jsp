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


#memsecessioninfo{
  align:center;
  max-width: 900px;
  margin: 10px auto;
  padding: 30px 20px;
  background: #FFFFFF;
  border-radius: 8px;
  border-style: solid;
  border-color: #A9D0F5;
}

#memsecession{
  text-align:center;
  max-width: 900px;
  margin: 10px auto;
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
  width: 30%;
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
  width: 30%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

#info{
min-height: 1200px;
}

h1{
text-align:left;
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

#side {
	position: fixed;
	right: 35px;
	top: 280px;
	
}

td

{
padding:0px 0px 0px 0px;
}



#side-tb {
	padding: 8px;
	line-height: 1.42857143;
	border-bottom: 1px solid #ddd;
	/*border-top: 1px solid #ddd;*/
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
<title>회원 탈퇴</title>
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
</head>
<body>
<p id="f" style=" margin-right: 0px;">회원탈퇴</p>

	<table class="table table-hover" >

		<tr>
			<th colspan="3" style="float:left;">
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a class="meminfotitle" href="memberupdatepage.do">회원정보수정</a></li>
						<li class="active"><a class="memsecessiontitle" href="#">회원탈퇴</a></li>
					</ul>
				</div>
			</th>
		</tr>
		</table>

	
	<h1>회원 탈퇴</h1>
	<h2><strong>RE:com 회원 탈퇴신청전, 아래 사항을 반드시 읽어주세요.</strong></h2>
	<div id="info">
	<div id="memsecessioninfo">	
    <ol>
    <li>
    	<strong>기존아이디로는 재 가입이 불가능 합니다.</strong>
    <p>회원 탈퇴를 신청하시면 해당 아이디는 즉시 탈퇴 처리되며, 이후 영구적으로 사용이 중지되므로 새로운 아이디로만 재가입이 가능 합니다.</p>
    </li>
    <li>
    	<strong>일주일 동안 재가입이 불가능 합니다.</strong>
    <p>회원 탈퇴 후, 일주일 동안 RI:COM 회원으로 재가입이 불가능 합니다.</p>
    <li>
    	<strong>회원 정보 및 게시물 삭제</strong>
    	<table summary="회원정보 보관기간에 대한표">
    	<colgroup>
    	<col width="*;">
    	<col width="33%;">
    	</colgroup>
    	<thead>
    	<tr>
    	<th scope="col" style="text-align: center;">내용</th>
    	<th scope="col" style="text-align: center;">기간</th>
    	</tr>
    	</thead>
    	<tbody>
    	<tr>
    	<td>계약 또는 청약철회 등에 관한 기록</td>
    	<td>5년</td>
    	</tr>
    	<tr>
    	<td>대금결제 및 재화 등의 공급에 관한 기록</td>
    	<td>5년</td>
    	</tr>
    	<tr>
    	<td>소비자의 불만 또는 분쟁처리에 관한 기록</td>
    	<td>3년</td>
    	</tr>
    	</tbody>
    	</table>
    </li>
    <li>
    <strong>탈퇴신청 불가 사유</strong>
    <p>-거래진행 중인 건이 있는 경우</p>
    <p>-취소/교환/반품중인 거래건이 있는경우</p>
    </li>
    </ol>
	</div>
	<br></br>
	<br></br>
	<h2><strong>회원탈퇴를 위해 회원 정보를 입력해주세요</strong></h2>
	
	<div id="memsecession">
	<p>
	<label for="password" class="w" style="float:center;">위 탈퇴 정책을 확인하였으며, 내용에 동의합니다.</label>
    </p>
    <input type="password" class="pwdbox" id="mem_pw" name="mem_pw"maxlength="20" placeholder="비밀번호 입력">
    <br></br>
    <button type="submit" class="secession-btn" id="memberFormButton"> 탈퇴 신청</button>
	</div>
	</div>
</body>
</html>