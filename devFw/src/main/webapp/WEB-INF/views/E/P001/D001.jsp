<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

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
	margin:10% 0 0 30%;
	text-align:left;
	text-overflow:ellipsis;
}

#prod {	
	width:300px;
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
                document.getElementById('order_zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('road_Address').value = fullRoadAddr;
                document.getElementById('number_Address').value = data.jibunAddress;

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

function process_pay_order(){
    
var IMP = window.IMP;
IMP.init('가맹점 식별 코드 a store identification code');
IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'vbank',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 14000,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
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
			<col width="30px"/>
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
				<c:set var = "total" value="0"/>
				<c:forEach var="item" items="${orderList }" varStatus="list_num">
			<tr>
				<td>${list_num.count}</td>
				<td><img src="${item.sell_thumbnail}" style="width:75px; height:100px; float:left;"/>
				<div id="prod"><a style="color:black; margin: 50% 0 0 0;" href="${contextPath}/sellItems.do?sell_no=${item.sell_number}">[${item.sell_number}]&nbsp;${item.sell_title}</a></div>
				<div id="option">${item.order_size }&nbsp;&nbsp;&nbsp;
				${item.order_color }&nbsp;&nbsp;&nbsp;${item.detail_quantity }개</div></td>
				<td>item.prod_price</td>
				<td><fmt:formatNumber value="${item.sell_price}" pattern="###,###,###"/>원(할인률)</td>
				<td><c:out value="${item.mem_ID }" /></td>
				<td>착불 or 결제</td>
			</tr>
		</c:forEach>
		</table>
		<br><br>
	</form>
</div>
<div id="transportInfo">
	<h4>2. 배송 정보</h4>
	<form role="form" method="post" autocomplete="off">
		<table style="border:1px solid #DDDDDD;">
			<tr>
				<td>배송방법</td>
				<td>
					<input type="radio" id="delivery_method" name="delivery_method" value="택배">택배
					<input type="radio" id="delivery_method" name="delivery_method" value="퀵 서비스">퀵 서비스
					<input type="radio" id="delivery_method" name="delivery_method" value="해외배송">해외배송
				</td>
			</tr>
			<tr>
				<td>배송지 선택</td>
				<td>
					<input type="radio" name="delivery_place" onClick="restore_all()" value="기본배송지">기본배송지
					<input type="radio" name="delivery_place" onClick="reset_all()" value="새로 입력">새로 입력
					<input type="radio" name="delivery_place" value="최근배송지">최근배송지
				</td>
			</tr>
			<tr>
				<td>받으실 분</td>
				<td>
					<input id="receiver_name" name="receiver_name" type="text" size="40" value=""/>
					<input type="hidden" id="" name="" value=""/>
					<input type="hidden" id="" name="" value=""/>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input size="40px" type="text" id="order_phone" name="" value="">
					<input type="hidden" id="" name="" value=""/>
					<c:set var="order_phone" value=""/>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input size="40px" type="text" id="order_email1" name="" value="">@
					<input size="40px" type="text" id="order_email2" name="" value="">
				<td><select id="email" name="email">
					<option>직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hotmail.com">hotmail.com</option>
				</select>
			<tr>
				<td>주소</td>
				<td><input type="text" id="order_zip" name="zipcode" size="5" value="">
					<a href="javascript:execDaumPostcode()">우편번호 검색</a> <br>
					<p>
						지번 주소: <br>
						<input type="text" id="number_Address" name="number_Address" size="50" value=""/><br>
						<br> 도로명 주소:
							<input type="text" id="road_Address" name="road_Address" size="50" value=""/>
						<br> 상세 주소:
							<input type="text" id="detail_Address" name="detail_Address" size="50" value=""/>
					</p>
					<input type="hidden" id="number_Address" name="number_Address" value=""/>
					<input type="hidden" id="road_Address" name="road_Address" value=""/>
					<input type="hidden" id="detail_Address" name="detail_Address" value=""/>
				</td>
			</tr>
			<tr>
				<td>배송 메시지</td>
				<td><input id="delivery_message" name="delivery_message" type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요."/>
				</td>
			</tr>
		</table>
	</form>
</div>


</div>

</body>
</html>