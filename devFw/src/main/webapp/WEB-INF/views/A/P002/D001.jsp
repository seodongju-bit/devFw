﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>




<style>

.w { text-align: left; }
.x { text-align: right; }
.y { text-align: center; }
.z { text-align: justify; }
div
*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
}





.pwdbox,
.namebox,
.addressbox,
.nickbox,
.telbox,
.btn btn-default,
#addr2,
#addr3,
select{
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

.idbox{
background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 65%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

#addr1{
background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 50%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

.mail1{
	background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 29%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

.mail2{
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
.mailselect{
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 35%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}


.sign-upbtn{
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

.overlapped-btn{
  padding: 10px 10px 10px 10px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 40%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}
.overlapped-btn2{
  padding: 10px 10px 10px 10px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 30%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}
.email-btn{
  padding: 10px 10px 10px 10px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;  
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 40%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

.btn-default{
  padding: 10px 10px 10px 10px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 40%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}


fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #5fcf80;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}

@media screen and (min-width: 480px) {

  form {
    max-width: 480px;
  }

}
</style>

  <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>

      <form action="index.html" method="post">
      
        <h1>회원 가입</h1>
        
        <fieldset>
          <label for="id" class="w" >회원 ID:</label>
          <input type="text" class="idbox" id="id" name="mem_id"maxlength="15" placeholder="ID" style="float:left;">
          <button type="button" class="overlapped-btn2" onClick="fn_overlapped()">중복 검사</button>
          <br></br>
          <label for="password" class="w">비밀번호:</label>
          <input type="password" class="pwdbox" id="password" name="mem_pw"maxlength="20" placeholder="PW">
          <label for="nick" class="w">닉네임:</label>
          <input type="text" class="nickbox" id="nick" name="mem_nick"maxlength="10" placeholder="NICK NAME">
          <label for="name" class="w">이름:</label>
          <input type="text" class="namebox" id="name" name="mem_name" maxlength="15" placeholder="NAME">
          <label for="mail" class="w">이메일:</label> 
          <input type="text" class="mail1" name="str_email01" maxlength="15" id="str_email01" >@
          <input type="text" class="mail2" name="str_email02" id="str_email02"  disabled value="naver.com"> 
          <select class="mailselect" name="selectEmail" id="selectEmail"> 
          <option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> 
          <option value="hanmail.net">hanmail.net</option> 
          <option value="hotmail.com">hotmail.com</option> 
          <option value="nate.com">nate.com</option> 
          <option value="gmail.com">gmail.com</option> 
          </select>
          <label for="nick" class="w" >연락처:</label>
          <input type="text" class="telbox" id="tel" name="mem_tel" maxlength="13" placeholder="TEL" >
          <label for="address" class="w" >주소:</label>
          <div class="form-group">                   
		  <input class="form-control" style="width: 40%; display: inline; float:left; " placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
    	  <button type="button" class="btn-default" onclick="execPostCode();" style="float:center;"><i class="fa fa-search"></i> 우편번호 찾기</button>       
		  </div>
		  <div class="form-group">
    	  <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
	      </div>
		  <div class="form-group">
    	  <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
		  </div>
        
        </fieldset>
        <button type="submit" class="sign-upbtn" href="membersuccess.do"> 회원 가입</button>
      </form>
     	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript"> 
			$('#selectEmail').change(function(){
				$("#selectEmail option:selected").each(function () {
					
						if($(this).val()== '1'){
									$("#str_email02").val(''); 
									$("#str_email02").attr("disabled",false); 
						}else{
									$("#str_email02").val($(this).text()); 
									$("#str_email02").attr("disabled",true); 
						} 
					}); 
				}); 
			
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
		                
		                
		                $("[name=addr1]").val(data.zonecode);
		                $("[name=addr2]").val(fullRoadAddr);
		                
		                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
		                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
		            }
		         }).open();
		     }

			
			var autoHypenPhone = function(str){
			      str = str.replace(/[^0-9]/g, '');
			      var tmp = '';
			      if( str.length < 4){
			          return str;
			      }else if(str.length < 7){
			          tmp += str.substr(0, 3);
			          tmp += '-';
			          tmp += str.substr(3);
			          return tmp;
			      }else if(str.length < 11){
			          tmp += str.substr(0, 3);
			          tmp += '-';
			          tmp += str.substr(3, 3);
			          tmp += '-';
			          tmp += str.substr(6);
			          return tmp;
			      }else{              
			          tmp += str.substr(0, 3);
			          tmp += '-';
			          tmp += str.substr(3, 4);
			          tmp += '-';
			          tmp += str.substr(7);
			          return tmp;
			      }
			  
			      return str;
			}


			var phoneNum = document.getElementById('tel');

			phoneNum.onkeyup = function(){
			  console.log(this.value);
			  this.value = autoHypenPhone( this.value ) ;  
			}
			
			
			
			function ValidationCheck() {
				var validate = true;
				var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email 유효성검사
				var hanChecked = /^[가-힝a-zA-Z]{2,15}$/; // 한글 유효성검사(2자리 이상 15자리 이하)
				var idChecked = /^[0-9a-zA-Z]{5,15}$/; // 아이디 유효성검사(5자리 이상 15자리 이하)
				//var phoneChecked = /^[0-9-]{1,16}$/;
				var phoneChecked = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-([0-9]{3,4})-([0-9]{4})$/;
				if($("#${commandName} #userEmail").val()) {
				if(!regExp.test($("#${commandName} #userEmail").val())){
				alert("이메일 주소가 유효하지 않습니다");
				$("#${commandName} #userEmail").focus();
				return false;
				}
				}
				if($("#${commandName} #userPhone").val()) {
				if(!phoneChecked.test($("#${commandName} #userPhone").val())) {
				alert("전화번호가 잘못 되었습니다.");
				$("#${commandName} #userPhone").focus();
				return false;
				}
				}
				if(!$("#${commandName} #userId").val()) {
				alert("아이디를 입력 하세요.");
				$("#${commandName} #userId").focus();
				validate = false;
				return false;
				}else if(!idChecked.test($("#${commandName} #userId").val())){
				alert("아이디는 5자 ~ 15자리 사이로 만들어주세요.");
				return false;
				}else
				if(!$("#${commandName} #userNm").val()) {
				alert("이름을 입력 하세요.");
				$("#${commandName} #userNm").focus();
				return false;
				}else if(!hanChecked.test($("#${commandName} #userNm").val())){
				alert("이름이 잘못 되었습니다.");
				$("#${commandName} #userNm").focus();
				return false;
				}else if(!$("#${commandName} #userEmail").val()) {
				alert("이메일을 입력하세요.");
				$("#${commandName} #userEmail").focus();
				return false;
				}else if(!$("#emailAuth").val()){
				alert("이메일 인증을 완료해주세요.");
				$("#emailAuth").focus();
				return false;
				}else if($("#emailAuthBtn")[0].disabled == false){
				console.log($("#emailAuthBtn")[0].disabled);
				alert("이메일 인증을 완료해주세요.");
				$("#emailAuth").focus();
				return false;
				}else if(!$("#${commandName} #userPw").val()) {
				alert("비밀번호를 입력하세요.");
				$("#${commandName} #userPw").focus();
				return false;
				}else if($("#${commandName} #userPw").val().length > 16 || $("#${commandName} #userPw").val().length < 8) {
				alert("비밀번호는 8 ~ 16 자리로 입력해주세요.");
				return false;
				}else if(!$("#${commandName} #userPw2").val()) {
				alert("비밀번호 확인을 입력하세요.");
				$("#${commandName} #userPw2").focus();
				return false;
				}else if($("#${commandName} #userPw").val() != $("#${commandName} #userPw2").val()) {
				alert("비밀번호가 일치 하지 않습니다.");
				$("#${commandName} #userPw2").focus();
				return false;
				}else if(!$("#${commandName} #userFirstAddr").val()) {
				alert("주소를 클릭하여 선택해 주세요");
				$("#${commandName} #userZipCode").focus();
				return false;
				}else if(!$("#${commandName} #userSecondAddr").val()) {
				alert("나머지 주소를 입력 해 주세요");
				$("#${commandName} #userSecondAddr").focus();
				return false;
				}else{
				return true;
				}
				}

				
		</script>
    </body>
</html>

