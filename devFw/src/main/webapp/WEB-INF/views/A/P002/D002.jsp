<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
  <head>
  		<link rel="stylesheet" type="text/css" href="resources/css/A_P002_D002.css?ver=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Sign Up Form</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    </head>
    <body>

     <form action="${contextPath}/addMember.do" method="post" >	
        <h1>회원 분류</h1>
        
        <fieldset>
          <label for="id" class="w" >회원 ID:</label>
          <input type="text" class="idbox" id="_mem_id" name="_mem_id" maxlength="15" placeholder="ID" style="float:left;">
          <input type="hidden" class="idbox" id="mem_id" name="mem_id" maxlength="15" placeholder="ID" style="float:left;">
          <button type="button" id="btnOverlapped" class="overlapped-btn2" onClick="fn_overlapped();">중복 검사</button>
          <br></br>
          <label for="password" class="w">비밀번호:</label>
          <input type="password" class="pwdbox" id="mem_pw" name="mem_pw"maxlength="20" placeholder="PW">
          <label for="nick" class="w">닉네임:</label>
          <input type="text" class="nickbox" id="mem_nick" name="mem_nick"maxlength="10" placeholder="NICK NAME">
          <label for="name" class="w">이름:</label>
          <input type="text" class="namebox" id="mem_name" name="mem_name" maxlength="15" placeholder="NAME">
          <label for="mail" class="w">이메일:</label> 
          <input type="text" class="mail1" id="mem_email1"  name="mem_email1" maxlength="15" >@
          <input type="text" class="mail2" id="mem_email2"  name="mem_email2" disabled value="naver.com"> 
          <select class="mailselect" name="mem_email2" id="selectEmail"> 
          <option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> 
          <option value="hanmail.net">hanmail.net</option> 
          <option value="hotmail.com">hotmail.com</option> 
          <option value="nate.com">nate.com</option> 
          <option value="gmail.com">gmail.com</option> 
          </select>
          <label for="nick" class="w" >연락처:</label>
          <input type="text" class="telbox" id="mem_tel" name="mem_tel" maxlength="13" placeholder="TEL" >
          <label for="address" class="w" >주소:</label>
          <div class="form-group">                   
		  <input class="form-control" style="width: 40%; display: inline; float:left; " placeholder="우편번호" name="mem_zip" id="mem_zip" type="text" readonly="readonly" >
    	  <button type="button" class="btn-default" onclick="execPostCode();" style="float:center;"><i class="fa fa-search"></i> 우편번호 찾기</button>       
		  </div>
		  <div class="form-group">
    	  <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="mem_address1" id="mem_address1" type="text" readonly="readonly" />
	      </div>
		  <div class="form-group">
    	  <input class="form-control" placeholder="상세주소" name="mem_address2" id="mem_address2" type="text"  />
		  </div>
		  <input type="hidden" name="mem_division" value="0">
        
        </fieldset>
        <button type="submit" class="sign-upbtn" > 회원 가입</button>
      </form>
     	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript"> 
			$('#selectEmail').change(function(){
				$("#selectEmail option:selected").each(function () {
					
						if($(this).val()== '1'){
									$("#mem_email2").val(''); 
									$("#mem_email2").attr("disabled",false); 
						}else{
									$("#mem_email2").val($(this).text()); 
									$("#mem_email2").attr("disabled",true); 
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
		                
		                
		                $("[name=mem_zip]").val(data.zonecode);
		                $("[name=mem_address1]").val(fullRoadAddr);
		                
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


			var phoneNum = document.getElementById('mem_tel');

			phoneNum.onkeyup = function(){
			  console.log(this.value);
			  this.value = autoHypenPhone( this.value ) ;  
			}
			

			
			function fn_overlapped(){
			    var _id=$("#_mem_id").val();
			    if(_id==''){
			   	 alert("ID를 입력하세요");
			   	 return;
			    }
			    $.ajax({
			       type:"post",
			       async:false,  
			       url:"${contextPath}/overlapped.do",
			       dataType:"text",
			       data: {"id":_id},
			       success:function (data,textStatus){
			          if(data=='false'){
			       	    alert("사용할 수 있는 ID입니다.");
			       	    $('#btnOverlapped').prop("disabled", true);
			       	    $('#_signupsuccesspagemem_id').prop("disabled", true);
			       	    $('#mem_id').val(_id);
			          }else{
			        	  alert("사용할 수 없는 ID입니다.");
			          }
			       },
			       error:function(data,textStatus){
			          alert("에러가 발생했습니다.");ㅣ
			       },
			       complete:function(data,textStatus){
			          //alert("작업을완료 했습니다");
			       }
			    });  //end ajax	 
			 }	
			
			
		</script>
    </body>
</html>

