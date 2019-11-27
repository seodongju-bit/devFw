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

#info{
min-height: 1200px;
}

#meminfo{
 max-width: 1600px;
  margin: 10px 20px 20px 10px;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1{
text-align:left;
font-size: 30px;
font-weight:bold;
}


form {
  
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

.meminfotitle{
font-weight: bold;
font-size: large;
}

</style>




<meta charset="UTF-8">
<title>회원 정보 수정</title>
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
</head>
<body>
<p id="f" style=" margin-right: 0px;">회원정보관리</p>

	<table class="table table-hover" >

		<tr>
			<th colspan="3" style="float:left;">
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a class="meminfotitle">회원정보수정</a></li>
						<li class="active"><a class="memsecessiontitle" href="membersecessionpage.do">회원탈퇴</a></li>
					</ul>
				</div>
			</th>
		</tr>
		</table>


	<h1>회원 정보 수정</h1>
    
    
    <div id="meminfo">
    <form  method="post" >	

	
	<table class="table table-hover">
	

			<tr class="dot_line">
					<td class="fixed_join">아이디</td>
					<td>
						<input name="mem_id" type="text" size="20" value="${memberInfo.member_id }"  disabled/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호</td>
					<td>
					  <input name="mem_pw" type="password" size="20" style="float:left;" value="${memberInfo.member_pw }" />&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="button" value="수정하기" onClick="fn_modify_member_info('member_pw')" />
					</td>
					<td></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td>
						<input name="mem_name" type="text" size="20" value="${memberInfo.member_name }"  disabled/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">닉네임</td>
					<td>
						<input name="mem_nick" type="text" size="20" value="${memberInfo.member_name }"  disabled/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이메일</td>
					<td>
						<input name="mem_email1" type="text" size="20" value="${memberInfo.member_name }"  disabled/>@
						<input name="mem_email2" type="text" size="20" value="${memberInfo.member_name }"  disabled/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">연락처</td>
					<td>
						<input name="mem_tel" type="text" size="20" value="${memberInfo.member_name }" />
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
						<input name="mem_zip" type="text"class="zipbox" size="20" value="${memberInfo.member_name }"  disabled/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="우편번호 찾기" onClick="fn_modify_member_info('member_pw')" />
						<br></br>
						<input name="mem_adddress1" type="text"class="addressbox1" size="20" value="${memberInfo.member_name }"  disabled/>
						<br></br>
						<input name="mem_adddress1" type="text"class="addressbox2" size="20" value="${memberInfo.member_name }"  />
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td>
					<td>
						<br></br>
							<input type="button" value="저장" onClick="fn_modify_member_info('member_pw')" style="float:right;"/>
					</td>
					 <td>
					</td>
				</tr>
					
	</table>
    </form>
		</div>		

</body>
</html>