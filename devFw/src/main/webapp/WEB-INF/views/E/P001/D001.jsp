<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!-- 각 상품당 할인률 -->
<c:set var="order_sale_price" value="0"/>
<!-- 각 주문당 최종 결제가격 -->
<c:set var="order_total_price" value="0"/>
<c:set var="final_order_total_pro_price" value="0"/>
<c:set var="final_order_total_price" value="0"/>
<c:set var="order_total_sale_price" value="0"/>
<c:set var="pointuse" value="0"/>
<c:set var="point_save" value="0"/>
<c:set var="point_save_total" value="0"/>
<!DOCTYPE html>


<html>
<head>
<style>
h1{
	text-align:center;
}
.order_Box{
	width:1140px;
	margin:0 0 0 28px;
	min-width:1000px;
	overflow:auto;
}
#orderListTable{
	width:100%;
	text-align:center;
	margin:0 0 0 0px;
	position:relative;
	min-width:1000px;
}

.payment ul li {
    list-style-type:none;
}

.orderListTable tr, td {
	border: 1px solid #DDDDDD;
}
#option {
	border: 1px solid #CCCCCC;
	margin:0 0 0 0;
	text-overflow:ellipsis;
}

#prod {	
	width:250px;
	margin: 30px 0 10px 0;
	float:left;
}


.sale {

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
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
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
		  	var orderForm=document.orderForm;
		  	var h_mem_email2=orderForm.h_mem_email2;
		  	var mem_email2=h_mem_email2.value;
		  	var select_email2=orderForm.mem_email2;
		  	select_email2.value=mem_email2;
	
	 }
	
	function selectEmail(ele) {
		var $ele = $(ele);
		var $mem_email2 = $('input[name=mem_email2]');
		
		if($ele.val() == "1") {
			$mem_email2.attr('readonly', false);
			$mem_email2.val('');
		}else {
			$mem_email2.attr('readonly', true);
			$mem_email2.val($ele.val());
		}
	}
	
	function select_delivery_payment(ele2) {
		var $ele2 = $(ele2);
		var $delivery_payment = $('input[name=delivery_payment]');
		
		if($ele2.val() == 'now') {
			$delivery_payment.attr('readonly', false);
			$delivery_payment.val('');
		}else {
			$delivery_payment.attr('readonly', true);
			$delivery_payment.val($ele2.val());
		}
	}
	
	function reset_all() {
		var e_mem_name = document.getElementById("mem_name");
		var e_mem_tel = document.getElementById("mem_tel");
		var e_mem_email1 = document.getElementById("mem_email1");
		var e_mem_email2 = document.getElementById("mem_email2");
		var e_order_zip = document.getElementById("order_zip");
		var e_order_address1 = document.getElementById("order_address1");
		var e_order_address2 = document.getElementById("order_address2");
		
		e_mem_name.value = "";
		e_mem_tel.value = "";
		e_mem_email1.value = "";
		e_mem_email2.value = "";
		e_order_zip.value = "";
		e_order_address1.value="";
		e_order_address2.value="";
	}
	
	
	function restore_all() {
		var e_mem_name = document.getElementById("mem_name");
		var e_mem_tel = document.getElementById("mem_tel");
		var e_mem_email1 = document.getElementById("mem_email1");
		var e_mem_email2 = document.getElementById("mem_email2");
		var e_order_zip = document.getElementById("order_zip");
		var e_order_address1 = document.getElementById("order_address1");
		var e_order_address2 = document.getElementById("order_address2");
		
		var h_mem_name = document.getElementById("h_mem_name");
		var h_mem_tel = document.getElementById("h_mem_tel");
		var h_mem_email1 = document.getElementById("h_mem_email1");
		var h_mem_email2 = document.getElementById("h_mem_email2");
		var h_order_zip = document.getElementById("h_order_zip");
		var h_order_address1 = document.getElementById("h_order_address1");
		var h_order_address2 = document.getElementById("h_order_address2");
		
		
		e_mem_name.value = h_mem_name.value;
		e_mem_tel.value = h_mem_tel.value;
		e_mem_email1.value = h_mem_email1.value;
		e_mem_email2.value = h_mem_email2.value;
		e_order_zip.value = h_order_zip.value;
		e_order_address1.value = h_order_address1.value;
		e_order_address2.value = h_order_address2.value;
	}
	
	function fn_pay_card() {
		var e_card = document.getElementById("payment_card");
		var e_account = document.getElementById("payment_account");
		e_card.style.display="block";
		e_account.style.display="none";
	}
	
	function fn_pay_account() {
		var e_account = document.getElementById("payment_account");
		var e_card = document.getElementById("payment_card");
		e_account.style.display="block";
		e_card.style.display="none";
	}
	
	
    
    function pay(){
    	
    	var formObj=document.createElement("form");
    	
    	var e_mem_name = document.getElementById("mem_name");
		var e_mem_tel = document.getElementById("mem_tel");
		var e_mem_email1 = document.getElementById("mem_email1");
		var e_mem_email2 = document.getElementById("mem_email2");
		var e_order_zip = document.getElementById("order_zip");
		var e_order_address1 = document.getElementById("order_address1");
		var e_order_address2 = document.getElementById("order_address2");
		var e_final_order_total_price = document.getElementById("p_final_order_total_price");
		var e_sell_title = document.getElementById("h_sell_title");
		
		var h_mem_name = document.getElementById("h_mem_name");
		var h_mem_tel = document.getElementById("h_mem_tel");
		var h_mem_email1 = document.getElementById("h_mem_email1");
		var h_mem_email2 = document.getElementById("h_mem_email2");
		var h_order_zip = document.getElementById("h_order_zip");
		var h_order_address1 = document.getElementById("h_order_address1");
		var h_order_address2 = document.getElementById("h_order_address2");
		var h_final_order_total_price = document.getElementById("h_final_order_total_price");
		var h_sell_title = document.getElementById("h_sell_title");
		
		
		e_mem_name.value = h_mem_name.value;
		e_mem_tel.value = h_mem_tel.value;
		e_mem_email1.value = h_mem_email1.value;
		e_mem_email2.value = h_mem_email2.value;
		e_order_zip.value = h_order_zip.value;
		e_order_address1.value = h_order_address1.value;
		e_order_address2.value = h_order_address2.value;
		e_final_order_total_price.value = h_final_order_total_price.value;
		e_sell_title.value = h_sell_title.value;
    	
        IMP.init('imp02202162');
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : e_sell_title.value,
            amount : e_final_order_total_price.value,
            buyer_email : e_mem_email1.value +"@" + e_mem_email2.value,
            buyer_name : e_mem_name.value,
            buyer_tel : e_mem_tel.value,
            buyer_addr : e_order_address1.value + "<br>" + e_order_address2.value,
            buyer_postcode : e_order_zip.value
        }, function(rsp) {
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }

            alert(msg);
        });
        }
    
    $(document).ready(function(){
    	$('#all_point').change(function(){
    		if($('#all_point').is(':checked')){
    			$('#order_pointuse').val('${orderer.mem_point}');
    			$("#p_order_pointuse").text($("#order_pointuse").val());
    		}else {
    			$('#order_pointuse').val('0');
    			$("#p_order_pointuse").text($("#order_pointuse").val());
    		}
    		$("#order_pointuse").on("keyup", function(){
        		var order_pointuse = $("#order_pointuse").val();
        		var h_mypoint = $("#h_mypoint").val();
        		
        		if(Number(order_pointuse) > Number(h_mypoint)) {
        			alert("보유 금액 이상 사용은 불가능 합니다.");
        			$('#order_pointuse').val('0');
        		}
        	});
    	});
    });

   
    
    $(document).ready(function(){
    	$("#order_pointuse").keyup(function(){
    		$("#p_order_pointuse").text($("#order_pointuse").val());
    	});
    });
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container" style="min-width:1000px !important;">
  <form name="orderForm" method="post" action="${contextPath}/payToOrder.do">
	<div class="order_box">
	  <h1 style="width:1096px;">주문페이지</h1>
	  <hr style="border: 2px solid black; width: 100%; min-width:1000px">
	  <h4 style="float:left">1. 주문 상품 확인</h4>
	  <table id="orderListTable">
	    <col width="30px"/>
	    <col width="200px"/>
	    <col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
	  	<tr style="background-color:purple; color:white; border:2px solid black;">
	  	  <td> </td>
	  	  <td>상품 정보</td>
	  	  <td>상품 가격</td>
	  	  <td>배송비</td>
	  	  <td>배송비 지급방법</td>
	  	  <td>적립 포인트</td>
	  	</tr>
	  	<c:forEach var="item" items = "${orderList}" varStatus = "list_num">
	  	  <tr>
	  	    <td id="list_num">
	  	      <c:out value="${list_num.count}"/>
	  	    </td>
	  	    <td>
	  	      <div id="prod" style="width:200px;">
	  	      	<span id="prod_info" style="text-align:center;">
	  	        <a style="color:black; margin: 0 0 0 0; width:500px;" href="${contextPath}/sellItems.do?sell_no=${item.sell_number}">${item.sell_title}</a>
	  	      	<input type="hidden" id="h_sell_number" name="h_sell_number" value="${item.sell_number}"/>
	  	      	<input type="hidden" id="h_sell_title" name="h_sell_title" value="${item.sell_title}"/>
	  	        </span>
	  	      	<span id="option">
		  	      ${item.order_size}&nbsp;&nbsp;&nbsp;
		  	      <input type="hidden" id="h_order_size" name="h_order_size" value="${item.order_size}"/>
		  	      ${item.order_color}&nbsp;&nbsp;&nbsp;${item.detail_quantity}개
		  	      <input type="hidden" id="h_order_color" name="h_order_color" value="${item.order_color}"/>
		  	      <input type="hidden" id="h_detail_quantity" name="h_detail_quantity" value="${item.detail_quantity}"/>
	  	      </span>
	  	      </div>
	  	    </td>
	  	    <td>
	  	      <input type="hidden" id="h_pro_price" name="h_pro_price" value="${item.pro_price}"/>
	  	      <input type="hidden" id="h_sell_price" name="h_sell_price" value="${item.sell_price}"/>
	  	      <input type="hidden" id="h_seller_id" name="h_seller_id" value="${item.mem_id}"/>
	  	      <del><fmt:formatNumber value="${item.pro_price * item.detail_quantity }"/></del>원<br>
	  	      <fmt:formatNumber value="${item.sell_price * item.detail_quantity}"/>원 (<fmt:formatNumber value="${order_sale_price + (1-(item.sell_price / item.pro_price ))*100}" pattern="#"/>%)
	  	    </td> 
	  	    <td>
	  	  		배송비
	  	    </td>
	  	    <td>
	  	       <input type="hidden" id="delivery_payment" name="delivery_payment" value=""/>
	  	       <select name="selectdeliverypayment" onChange="select_delivery_payment(this)">
		        <option value="now" selected>주문시 지불</option>
		        <option value="after">수령 후 지불</option>
		      </select>
	  	    </td>
	  	    <td>
	  	      <c:set var="point_save" value="${point_save + (item.pro_price*0.05)}"/>
	  	      <fmt:parseNumber value="${point_save + (item.pro_price*0.05)}" var="point_save" integerOnly="true"/>P
	  	      <input type="hidden" id="h_point_save" name="h_point_save" value="${point_save}"/>
	  	    </td>
	  	  </tr>
	  	  	<c:set var="order_total_price" value="${order_total_price + item.sell_price * item.detail_quantity}"/>
	  	  	<c:set var="order_total_sale_price" value="${order_total_sale_price + (item.pro_price - item.sell_price)}"/>
	  	  	<c:set var="point_save_total" value="${point_save_total + point_save}"/>
	  	</c:forEach>
	  	</table>
	  		<input type="hidden" id="h_order_total_price" name="h_order_total_price" value="${order_total_price}"/>
	  		<input type="hidden" id="h_order_total_sale_price" name="h_order_total_sale_price" value="${order_total_sale_price}"/>
	  		<input type="hidden" id="h_point_save_total" name="h_point_save_total" value="${point_save_total}"/>
	</div>
	<br>
	<br>
	<br>
	<div class="delivery_info">
      <h4>2. 배송 정보</h4>
		<table id="detail_table" class="table table-striped table-bordered">
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
		      <input id="mem_name" name="mem_name" type="text" size="40" value="${orderer.mem_name}">
		      <input type="hidden" id="h_mem_name" name="h_mem_name" value="${orderer.mem_name}">
		    </td>
		  </tr>
		  <tr>
		    <td>연락처</td>
		    <td>
		      <input id="mem_tel" name="mem_tel" type="text" size="40" value="${orderer.mem_tel}">
		      <input id="h_mem_tel" name="h_mem_tel" type="hidden" value="${orderer.mem_tel}">
		    </td>
		  </tr>
		  <tr>
		    <td>이메일</td>
		    <td>
		      <input size="40" type="text" id="mem_email1" name="mem_email1" value="${orderer.mem_email1}">&nbsp;@
		      <input size="40" type="text" id="mem_email2" name="mem_email2" value="${orderer.mem_email2}">
		      <select name="select_order_email2" onChange="selectEmail(this)">
		        <option value="" selected>선택하세요</option>
		        <option value="1">직접입력</option>
		        <option value="daum.net">daum.net</option>
		        <option value="naver.com">naver.com</option>
		        <option value="hanmail.net">hanmail.net</option>
		        <option value="nate.net">nate.net</option>
		        <option value="gmail.net">gmail.net</option>
		        <option value="hotmail.net">hotmail.net</option>
		      </select>
		      <input type="hidden" id="h_mem_email1" name="h_mem_email1" value="${orderer.mem_email1}">
		      <input type="hidden" id="h_mem_email2" name="h_mem_email2" value="${orderer.mem_email2}">
		    </td>
		  </tr>
		  <tr>
		    <td>주소</td>
		    <td>
		                우편번호:<input type="text" id="order_zip" name="order_zip" size="5" value="${orderer.mem_zip}"/>
		             <a href="javascript:execDaumPostcode()">우편번호 검색</a><br>
		     <p>
				도로명 or 지번 주소:<input type="text" id="order_address1" name="order_address1" size="50" value="${orderer.mem_address1}"><br>
				상세 주소:<input type="text" id="order_address2" name="order_address2" size="50" value="${orderer.mem_address2}">
		     </p>
		     <input type="hidden" id="h_order_zip" name="h_order_zip" value="${orderer.mem_zip}">
		     <input type="hidden" id="h_order_address1" name="h_order_address1" value="${orderer.mem_address1}">
		     <input type="hidden" id="h_order_address2" name="h_order_address2" value="${orderer.mem_address2}">
		    </td>
		  </tr>
		  <tr>
		    <td>배송시 요청사항</td>
		    <td>
		      <input id="order_request" name="order_request" type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요."/>
		    </td>
		  </tr>
		  <tr>
		</table>
	</div>
	<div class="clear"></div>
	<div class="sale">
	  <table class="table table-striped table-bordered">
	    <tbody>
	      <tr class="dot_line">
	      <c:set var="point" value="0"/>
	        <td>포인트</td>
	        <td>
	          <input id="order_pointuse" name="order_pointuse" type="text" size="10" value="${pointuse}"/> 
	          <input id="h_order_pointuse" name="h_order_pointuse" type="hidden" value="${pointuse}"/>
	          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <span id="mypoint">잔여포인트: ${orderer.mem_point}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <input type="hidden" id="h_mypoint" name="h_mypoint" value="${orderer.mem_point}"/>
	          <input type="checkbox" id="all_point" name="all_point" value="전액 사용하기"/> 전액 사용하기
	        </td>
	      </tr>
	      <tr class="dot_line">
	        <td>쿠폰 선택</td>
	        <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="쿠폰 선택" id="co_number" name="co_number"></td>
	      </tr>
	    </tbody>
	  </table>
	</div>
	<div class="clear"></div>
	<br>
	<div class="payment">
	  <h4>3. 결제금액</h4>
	  <table class="list_view" style="background:#CCCCCC; width:100%; text-align:center">
	    <tbody>
	      <tr align="center" class="fixed">
	        <td>총 상품 금액</td>
	        <td>총 배송비</td>
	        <td>총 할인금액</td>
	        <td>사용 포인트</td>
	        <td>최종 결제금액</td>
	        <td>총 적립 포인트</td>
	      </tr>
	      <tr style="cellpadding:40px; align:center;">
	        <c:set var="final_order_total_pro_price" value="${final_order_total_pro_price + order_total_price}"/>
	  		<c:set var="final_order_total_price" value="${final_order_total_pro_price + order_total_sale_price}"/>
	        <td>
			  <p id="p_final_order_total_pro_price"><fmt:formatNumber value="${final_order_total_pro_price}"/>원</p>	  
	        </td>
	        <td>
	          <p id="p_delivery_cost">배송비</p>
	        </td>
	        <td>
	          <p id="p_order_total_sale_price"><fmt:formatNumber value="${order_total_sale_price}"/>원</p>
	        </td>
	        <td>
	          <p><span id="p_order_pointuse"></span>P</p>
	        </td>
	        <td>
	        <c:set var="final_order_total_price" value="${final_order_total_price - pointuse}"/>
	          <p id="p_final_order_total_price">
	           <fmt:formatNumber value="${final_order_total_price}"/>원
	         </p>
		  		<input type="hidden" id="h_order_total_price" name="h_order_total_price" value="${order_total_price}"/>
		  		<input type="hidden" id="h_order_total_sale_price" name="h_order_total_sale_price" value="${order_total_sale_price}"/>
		  		<input type="hidden" id="h_final_order_total_pro_price" name="h_final_order_total_pro_price" value="${final_order_total_pro_price}"/>
	            <input type="hidden" id="h_final_order_total_price" name="h_final_order_total_price" value="${final_order_total_price}"/>
	        </td>
	        <td>
	         <p id="p_point_save_total"><fmt:formatNumber value="${point_save_total}" type="number"/>P</p>
	        </td>
	      </tr>
	    </tbody>
	  </table>
	  <br>
	  <br>
	  <h4>4. 결제수단 선택</h4>
	  <table class="table table-striped table-bordered" id="choose_payment" style="text-align:center;">
	    <tr>
	      <td>
	        <ul>
	          <li>카드 & 계좌 결제<input type="radio" id="pay_method" name="pay_method" value="신용카드" onclick="fn_pay_card()"></li>
	          <li>무통장입금<input type="radio" id="pay_method" name="pay_method" value="무통장입금" onclick="fn_pay_account()"></li>
	        </ul>
	      </td>
	      <td>
	      	<input type="button" id="payment_card" name="payment_card" onClick="pay()" style="display:none;" value="카드 또는 계좌이체로 결제하기">
	      	<input type="hidden" id="od_state" name="od_state" value="결제완료">
	      	<button class="btn" type="submit" id="payment_account" name="payment_account" style="display:none;">무통장 입금 방식으로 결제하기</button>
	      </td>
	    </tr>
	  </table>	    
	</div>
  </form>
</div>
</body>
</html>