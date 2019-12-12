<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
  <head>

        <link rel="stylesheet" type="text/css" href="resources/css/A_P001_D002.css?ver=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Search ID FORM</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>

        
    </head>
    <body>
        <h3>아이디/비밀번호 찾기</h3>
        <div id="selectbox1" class="custom-radio" style="float: center; margin-right:10px;">
					<input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label for="search_1">아이디 찾기</label>
				</div>
				<div id="selectbox2" class="custom-radio" style="float: center;" >
					<input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label for="search_2">비밀번호 찾기</label>
				</div>     
			<br></br>
        <div id="searchI">
					<div class="form-group">
							<label for="mail" style="float: left;">이메일:</label>
							<br></br>
          				<input type="text" class="mail1" id="mem_email1"  name="mem_email1" maxlength="15" >@
          				<input type="text" class="mail2" id="mem_email2"  name="mem_email2" disabled value="naver.com"> 
          				<select class="mailselect" name="mem_email2" id="selectEmail"> 
          				<option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> 
          				<option value="hanmail.net">hanmail.net</option> 
          				<option value="hotmail.com">hotmail.com</option> 
          				<option value="nate.com">nate.com</option> 
          				<option value="gmail.com">gmail.com</option> 
          				</select>
						</div>
						<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="w" for="inputId" style="float: left;">아이디</label>
						<div>
							<input type="text" class="idbox" id="mem_id" name="mem_id" placeholder="ID">
						</div>
					</div>
					<div class="form-group">
						<label for="mail" class="w" style="float: left;">이메일:</label>
						<br></br>
          				<input type="text" class="mail1" id="mem_email1"  name="mem_email1" maxlength="15" >@
          				<input type="text" class="mail2" id="mem_email2"  name="mem_email2" disabled value="naver.com"> 
          				<select class="mailselect" name="mem_email2" id="selectEmail"> 
          				<option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> 
          				<option value="hanmail.net">hanmail.net</option> 
          				<option value="hotmail.com">hotmail.com</option> 
          				<option value="nate.com">nate.com</option> 
          				<option value="gmail.com">gmail.com</option> 
          				</select>
          				
						</div>
						<div class="form-group">
						<button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
					
				</div>
					</div>
					

				

					


  	
  
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	  <script type="text/javascript">  
	  
	  
	  function search_check(num) {
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";	
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}
	
	    var message = "<%=request.getParameter("message") %>" ;
	    
	 	
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
	 	
	 	$(document).ready(function() {
			/////////모///달///기///능///////////
			// 1. 모달창 히든 불러오기
			$('#searchBtn').click(function() {
				console.log("modal1");
				$('#background_modal').show();
			});
			// 2. 모달창 닫기 버튼
			$('.close').on('click', function() {
				console.log("modal2");
				$('#background_modal').hide();
			});
			// 3. 모달창 위도우 클릭 시 닫기
			$(window).on('click', function() {
				console.log("modal3");
				if (event.target == $('#background_modal').get(0)) {
		            $('#background_modal').hide();
		           
		         }
			});
			
		});
		
		// 아이디 & 스토어 값 저장하기 위한 변수
		var idV = "";
		/* var storeV = ""; */
		// 아이디 값 받고 출력하는 ajax
		var idSearch_click = function(){
			console.log($('#mem_email1').val());
			console.log($('#mem_email2').val());
			
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/idSearch.do?mem_email1="
						+$('#mem_email1').val()+"&mem_email2="+$('#mem_email2').val(),
				success:function(data){
					console.log(data);
					
					if(data == 0){
						$('#id_value').text("회원 정보를 확인해주세요!");
						
					} else {
						$('#id_value').text(data);
						// 아이디값 별도로 저장
						idV = data;
						/* storeV = $("#store_id1 option:selected").val(); */
					}
				}
			});
		}
		
		// 비밀번호 찾기 이메일로 보내기
		$('#searchBtn2').click(function(){
			console.log("패스워드 찾기 : ajax 들어가기 전");
			console.log($('#mem_id').val());
			console.log($('#inputEmail_2').val());
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/user/searchPassword?userId="
						+ $('#inputId').val() + "&userEmail=" + $('#inputEmail_2').val(),
				success : function(data){
						
							alert("해당 이메일로 임시 비밀번호를 발송하였습니다.");
				}
				
			});
			
		});
		
		// 비밀번호 찾기 눌렀을 때
		// 1 패스워드 찾기 창으로 이어진 후 2 패스워드 창에 아이디가 적힘
		// 3 모달창 종료
		$('#pwSearch_btn').click(function(){		
			
			/* var idV = $('#id_value').val(); // 오류 뜸 */
			console.log(idV);
			/* console.log(storeV); */
			
			// 1. 패스워드 찾기 창으로 이어지고
			$('#search_2').prop("checked", true);
			
			// 메서드 호출
			search_check(2);
			
			// 2.아이디 & 매장 자동 저장
			$('#inputId').attr("value", idV);
			/* $('#store_id2').val(storeV).prop("selected", true); */
			
			// 마지막으로 모달창 종료
			$('#background_modal').hide();
		});
	 	
		</script>
    </body>
</html>