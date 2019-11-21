<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!-- 최종 결제 금액 -->
<c:set var="order_totalmoney" value="0" />
<!-- 총 주문 금액 -->
<c:set var="order_money" value="0" />
<!-- 총 상품 수 -->
<c:set var="total_order_quantity" value="0" />
<!-- 총 할인 금액 -->
<c:set var="total_discount_price" value="0" />
<!-- 총 배송비 -->
<c:set var="total_transport_cost" value="0" />

<!DOCTYPE html>


<html>
<head>
<style>
h1{
	text-align:center;
}
#orderBox{
	position:relative;
	width:1140px;
	margin:0 0 0 28px;
	min-width:1000px;
	overflow:auto;
}
#orderListTable{
	width:100%;
	text-align:center;
	margin:0 0 0 -28px;
	position:relative;
	min-width:1000px;
	float:left;
	border-bottom:1px solid #CCCCCC;"
}
#option {
	border: 1px solid #CCCCCC;
	padding:5px;
	position:relative;
	margin:10% 0 0 20%;
	text-align:left;
	text-overflow:ellipsis;
}

#prod {	
	width:250px;
	margin: 30px 0 10px 0;
	float:left;
}


#transportInfo {
	position:relative;
	width:1140px;
	margin:0 0 0 28px;
	min-width:1000px;
	overflow:auto;

}

#transporttable {
	border-color:#CCCCCC !important;
}

#payment h4 {
	padding:15px;
}

#payment li{
	 list-style:none;
}
</style>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

    function execDaumPostcode() {
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
                document.getElementById('mem_zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mem_address1').value = fullRoadAddr;
                document.getElementById('mem_address2').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    
    window.onload=function()
    {
      init();
    }
    
	function init(){
		var orderForm = document.orderForm;
		var h_mem_email2 = orderForm.h_mem_email2;
		var mem_email2 = h_mem_email2.value;
		var select_mem_email2 = orderForm.mem_email2;
		select_mem_email2.value = mem_email2;
	}
	
	function reset_all() {
		var e_mem_name = document.getElementById("mem_name");
		var e_mem_tel = document.getElementById("mem_tel");
		var e_mem_email1 = document.getElementById("mem_email1");
		var e_mem_email2 = document.getElementById("mem_email2");
		var e_mem_zip = document.getElementById("mem_zip");
		var e_mem_address1 = document.getElementById("mem_address1");
		var e_mem_address2 = document.getElementById("mem_address2");
		
		
		e_mem_name.value = "";
		e_mem_tel.value = "";
		e_mem_email1.value = "";
		e_mem_email2.value = "";
		e_mem_zip.value = "";
		e_mem_address1.value="";
		e_mem_address2.value="";
		
	}
	
	function restore_all() {
		var e_mem_name = document.getElementById("mem_name");
		var e_mem_tel = document.getElementById("mem_tel");
		var e_mem_email1 = document.getElementById("mem_email1");
		var e_mem_email2 = document.getElementById("mem_email2");
		var e_mem_zip = document.getElementById("mem_zip");
		var e_mem_address1 = document.getElementById("mem_address1");
		var e_mem_address2 = document.getElementById("mem_address2");
		
		var h_mem_name = document.getElementById("h_mem_name");
		var h_mem_tel = document.getElementById("h_mem_tel");
		var h_mem_email1 = document.getElementById("h_mem_email1");
		var h_mem_email2 = document.getElementById("h_mem_email2");
		var h_mem_zip = document.getElementById("h_mem_zip");
		var h_mem_address1 = document.getElementById("h_mem_address1");
		var h_mem_address2 = document.getElementById("h_mem_address2");
		
		
		e_mem_name.value = h_mem_name.value;
		e_mem_tel.value = h_mem_tel.value;
		e_mem_email1.value = h_mem_email1.value;
		e_mem_email2.value = h_mem_email2.value;
		e_mem_zip.value = h_mem_zip.value;
		e_mem_address1.value = h_mem_address1.value;
		e_mem_address2.value = h_mem_address2.value;
			
	}

	//신용카드 선택
	function fn_pay_card() {
		//카드 결제 block
		document.getElementById('card').style.display = 'block';
		//개인 or 법인 카드 선택창 block
		document.getElementById('select_card').style.display = 'block';
		//실시간 계좌이체 지우기
		document.getElementById('cash_receipt').style.display = 'none';
	}
			//개인카드 선택시
			function fn_pay_card_select1() {
				//할부기간 선택창 활성화
				document.getElementById('monthly_period').style.display = 'block';
				document.getElementById('select_company').style.display = 'block';
				document.getElementById('card_com_name').style.display = 'block';
				document.getElementById('card_pay_month').style.display = 'block';
				document.getElementById('card_pay_month').style.display = 'block';
				//법인카드에서 개인카드로 넘어올 시 disabled 제거
				document.getElementById('card_pay_month').disabled = false;
				document.getElementById('card_pay_month').removeAttribute("disabled");
			}
			//법인카드 선택시
			function fn_pay_card_select2() {
				//할부기간 선택창 활성화
				document.getElementById('monthly_period').style.display = 'block';
				document.getElementById('select_company').style.display = 'block';
				document.getElementById('card_com_name').style.display = 'block';
				document.getElementById('card_pay_month').style.display = 'block';
				//value 일시불로 고정 후 disabled
				document.getElementById('card_pay_month').value = '일시불';
				document.getElementById('card_pay_month').disabled = true;
				document.getElementById('card_pay_month').disabled = 'disabled';
			}

</script>
   <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'KH Books 도서 결제',
            amount : 'order_totalMoney',
            buyer_email : 'mem_email1'',
            buyer_name : 'mem_name',
            buyer_tel : 'order_phone',
            buyer_addr : 'address1',
            buyer_postcode :'mem_zip'
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/order/payFail";
                alert(msg);
            }
        });
        
    });
    </script>
<title>Insert title here</title>
</head>
<body>
<div class="container" style="min-width:1000px !important;">
<h1 style="width:1096px;">주문페이지</h1>
<hr style="border: 2px solid black; width: 100%; min-width:1000px">
<div id="orderBox">
	<h4 style="float:left">1. 주문 상품 확인</h4>
	<form name="orderForm">
		<table id="orderListTable">
			<col width="100px"/>
			<col width="500px"/>
			<col width="150px"/>
			<col width="150px"/>
			<col width="100px"/>
			<col width="150px"/>
			<tr style="background-color:purple; color:white; border-top:2px solid black;">
				<td>번호</td>
				<td>상품정보</td>
				<td>상품가격</td>
				<td>할인적용금액(할인률)</td>
				<td>판매자</td>
				<td>배송비 지급방법</td>
			</tr>
				<!-- 주문상품 리스트 합계 -->
				<c:set var = "order_Total" value="0"/>
				<c:forEach var="item" items="${orderList}" varStatus="list_num">
			<tr>
				<td id="list_num">
					<c:out value="${list_num.count}"/>
				</td>
				<td>
					<img src="${item.sell_thumbnail}" style="width:75px; height:100px; float:left;"/>
					<div id="prod">
						<a style="color:black; margin: 50% 0 0 0;" href="${contextPath}/sellItems.do?sell_no=${item.sell_number}">
						[${item.sell_number}]&nbsp;${item.sell_title}</a></div>
					<div id="option">
						${item.order_size }&nbsp;&nbsp;&nbsp;
						${item.order_color }&nbsp;&nbsp;&nbsp;${item.detail_quantity }개
					</div>
				</td>
				<td>
					<del><fmt:formatNumber value="${item.pro_price}" pattern="###,###,###"/></del>원
				</td>
				<td>
					<fmt:formatNumber value="${item.sell_price}" pattern="###,###,###"/>원(할인률)
				</td>
				<td>
					<c:out value="${item.mem_ID }" />
				</td>
				<td>
					착불 or 결제
				</td>
			</tr>
		</c:forEach>
		</table>
		<br><br>
	<br><br><br><br>
	<br><br><br><br><br>
	<h4> 2. 배송 정보</h4>
		<table id="transporttable" class="table table-striped table-bordered">
			<tr>
				<td>배송방법</td>
				<td>
					<input type="radio" id="delivery_method" name="delivery_method" value="택배" checked>&nbsp;택배&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="delivery_method" name="delivery_method" value="퀵 서비스">&nbsp;퀵 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="delivery_method" name="delivery_method" value="해외배송">&nbsp;해외배송&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>배송지 선택</td>
				<td>
					<input type="radio" name="delivery_place" onClick="restore_all()" value="기본배송지" checked>&nbsp;기본배송지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="delivery_place" onClick="reset_all()" value="새로 입력">&nbsp;새로 입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="delivery_place" value="최근배송지">&nbsp;최근배송지
				</td>
			</tr>
			<tr>
				<td>받으실 분</td>
				<td>
					<input id="mem_name" name="mem_name" type="text" size="40" value="${orderer.mem_name}"/>
					<input type="hidden" id="h_mem_name" name="h_mem_name" value="${orderer.mem_name}"/>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input size="40px" type="text" id="mem_tel" name="mem_tel" value="${orderer.mem_tel}">
					<input type="hidden" id="h_mem_tel" name="h_mem_tel" value="${orderer.mem_tel}"/>
					<c:set var="mem_tel" value="${orderer.mem_tel}"/>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input size="40px" type="text" id="mem_email1" name="mem_email1" value="${orderer.mem_email1}">&nbsp;@
					<input size="40px" type="text" id="mem_email2" name="mem_email2" value="${orderer.mem_email2}">
				<select id="mem_email2" name="mem_email2">
					<option>직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hotmail.com">hotmail.com</option>
				</select>
				<input type="hidden" id="h_mem_email1" name="h_mem_email1" value="${orderer.mem_email1}"/>
				<input type="hidden" id="h_mem_email2" name="h_mem_email2" value="${orderer.mem_email2}"/>
			<tr>
				<td>주소</td>
				<td>우편번호:<input type="text" id="mem_zip" name="mem_zip" size="5" value="${orderer.mem_zip}">
					<a href="javascript:execDaumPostcode()">우편번호 검색</a> <br>
					<p>
						<br> 도로명 주소:
							<input type="text" id="mem_address1" name="mem_address1" size="50" value="${orderer.mem_address1}"/>
						<br> 상세 주소:
							<input type="text" id="mem_address2" name="mem_address2" size="50" value="${orderer.mem_address2}"/>
					</p>
					<input type="hidden" id="h_mem_zip" name="h_mem_zip" value="${orderer.mem_zip}"/>
					<input type="hidden" id="h_mem_address1" name="h_mem_address1" value="${orderer.mem_address1}"/>
					<input type="hidden" id="h_mem_address2" name="h_mem_address2" value="${orderer.mem_address2}"/>
				</td>
			</tr>
			<tr>
				<td>배송 메시지</td>
				<td><input id="delivery_message" name="order_request" type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요."/>
				</td>
			</tr>
		</table>
		
		<br><br>
		<h4>3. 결제정보 및 결제금액</h4>
		<table id="payment" class="table-bordered">
		  <colgroup>
		  	<col style="width:220px">
		  	<col style="width:648px">
		  	<col style="width:302px">
		  </colgroup>
		  <tbody>
		   	<tr>
		   		<td height="100%" class="paymentTab">
		   		  <h4>01. 결제방법</h4>
		   		  <ul>
		   		    <li><label><input name="pay_method" type="radio" id="pay_method" value="신용카드" onClick="fn_pay_card()">신용카드</label></li>
		   			<li><label><input name="pay_method" type="radio" id="pay_method" value="무통장 입금">무통장 입금</label></li>
		   			<li><label><input name="pay_method" type="radio" id="pay_method" value="카카오페이"><img src="${contextPath}/resources/image/payment/payIco_kakaopay.png"></label></li>
		   			<li><label><input name="pay_method" type="radio" id="pay_method" value="페이나우"><img src="${contextPath}/resources/image/payment/payIco_paynow.png"></label></li>
		   			<li><label><input name="pay_method" type="radio" id="pay_method" value="페이코"><img src="${contextPath}/resources/image/payment/payIco_Payco.png"></label></li>
		   		  </ul>
		   		</td>
		<!----------------------------------신용카드 선택 시 노출----------------------------------------->
		   		<td id="payment_view">
		   		  <div id="card" style="display:none;">
		   		   <div id="select_card" style="display:none;">
		   		   	 <ul>
		   		   	   <li><label><input type="radio" name="card" id="personal" value="개인카드" onclick="fn_pay_card_select1()">개인카드</label></li>
		   		   	   <li><label><input type="radio" name="card" id="corp" value="법인카드" onclick="fn_pay_card_select2()">법인카드</label></li>
		   		     </ul>
		   		   </div>
		   		   <div id="select_company" style="display:none;">
		   			  <strong>카드 선택</strong>
		   			  <select id="card_com_name" name="card_com_name">
		   			  	<option value="삼성" selected>삼성</option>
		   			  	<option value="하나SK" selected>하나SK</option>
		   			  	<option value="신한" selected>신한</option>
		   			  	<option value="NH농협" selected>NH농협</option>
		   			  	<option value="현대" selected>현대</option>
		   			  	<option value="롯데" selected>롯데</option>
		   			  	<option value="BC" selected>BC</option>
		   			  	<option value="KB국민" selected>KB국민</option>
		   			  	<option value="시티" selected>시티</option>
		   			  </select>
		   		   </div>
		   		   <br>
		   		   <div id="monthly_period" style="display:none;">
		   		   	  <strong>할부기간</strong>
		   		   	  <select id="card_pay_month" name="card_pay_month" style="display:none;">
		   		   		<option value="일시불" selected>일시불</option>
		   		   		<option value="2개월" selected>2개월</option>
		   		   		<option value="3개월" selected>3개월</option>
		   		   		<option value="4개월" selected>4개월</option>
		   		   		<option value="5개월" selected>5개월</option>
		   		   		<option value="6개월" selected>6개월</option>
		   		   	  </select>
		   		   </div>
		   		  </div>
		<!---------------------------------------------------------------------------------->
		   	<tr>
		   		<td>
		   		</td>
		   		<td id="paymentDiscountContents" style="height:205px;"></td>
		   	</tr>
		   	<tr>
		   		<td><h4>03. 기타서류</h4></td>
		   		<td></td>
		   	</tr>
		   </tbody>
		</table>
	</form>
	</div>
</div>
</body>
</html>