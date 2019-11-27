<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/A_P003_D001.css?ver=1.0">
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
    
    <div id="info">
    <div id="meminfo">
    <form name="frm_mod_member" method="post" >	

	
	<table class="table table-hover">
	

			<tr class="dot_line">
					<td class="fixed_join">아이디</td>
					<td>
						<input name="mem_id" type="text" size="20" value="${memberInfo.mem_id }"  disabled/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호</td>
					<td>
					  <input name="mem_pw" type="password" size="20" style="float:left;" value="${memberInfo.mem_pw }" />&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="button" value="수정하기" onClick="fn_modify_member_info('pw')" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td>
						<input name="mem_name" type="text" size="20" value="${memberInfo.mem_name }"  disabled/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">닉네임</td>
					<td>
						<input name="mem_nick" type="text" size="20" value="${memberInfo.mem_nick }"  disabled/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이메일</td>
					<td>
						<input name="mem_email1" type="text" size="20" value="${memberInfo.mem_email1 }"  disabled/>@
						<input name="mem_email2" type="text" size="20" value="${memberInfo.mem_email2 }"  disabled/>
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">연락처</td>
					<td>
						<input name="mem_tel" type="text" size="20" value="${memberInfo.mem_tel }" />
					  <input type="button" value="수정하기" onClick="fn_modify_member_info('tel')" />
					</td>
					 <td>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					<br><input type="text" class="zipbox" id="zip"  name="mem_zip" size="50" value="${memberInfo.mem_zip }" disabled> <a href="javascript:execPostCode()">우편번호검색</a>
					  <br>
					  <br>
					<p> 
					<input type="text" class="addressbox1" id="address1" name="mem_address1" size="50" value="${memberInfo.mem_address1 }" disabled><br><br>
					<input type="text" class="addressbox2" id="address2" name="mem_address2" size="50" value="${memberInfo.mem_address1 }" /><br><br>
					<input type="button" value="수정하기" onClick="fn_modify_member_info('address')" />
					   </p>
					</td>
					<td>
				</td>
				</tr>
		</tbody>
	</table>
    </form>
		</div>
		</div>		
		
		
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript"> 
 function execPostCode() {
     new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);
            
            
            $("[name=mem_zip]").val(data.zonecode);
            $("[name=mem_address1]").val(fullRoadAddr);
            
            /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
            document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
        }
     }).open();
 }
 
 
 
function fn_modify_member_info(attribute){
	var value;
	// alert(member_id);
	// alert("mod_type:"+mod_type);
		var frm_mod_member=document.frm_mod_member;
		if(attribute=='pw'){
			value=frm_mod_member.mem_pw.value;
			//alert("member_pw:"+value);
		}else if(attribute=='tel'){
			var mem_tel=frm_mod_member.mem_tel;
			value_mem_tel=mem_tel.value;
		}else if(attribute=='email'){
			var mem_email1=frm_mod_member.mem_email1;
			var mem_email2=frm_mod_member.mem_email2;

			
			value_mem_email1=mem_email1.value;
			value_mem_email2=mem_email2.value;
			value=value_mem_email1+","+value_mem_email2;
			//alert(value);
		}else if(attribute=='address'){
			var mem_zip=frm_mod_member.mem_zip;
			var mem_address1=frm_mod_member.mem_address1;
			var mem_address2=frm_mod_member.mem_address2;
			
			value_mem_zip=mem_zip.value;
			value_mem_address1=mem_address1.value;
			value_mem_address2=mem_address2.value;
			value=value_mem_zip+","+value_mem_address1+","+value_mem_address2;
		}
		console.log(attribute);
	 
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/modifyMyInfo.do",
			data : {
				attribute:attribute,
				value:value,
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("회원 정보를 수정했습니다.");
				}else if(data.trim()=='failed'){
					alert("다시 시도해 주세요.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax
}
</script>
</body>
</html>