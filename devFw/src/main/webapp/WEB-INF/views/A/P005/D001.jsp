<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">

</head>

<style>
#basket_tb {
	width: 840px;
	margin: 0 auto;
	margin-top: 100px;
}

aside {
	float: right;
	position: relative;
	width: 30%;
}

.summary-subtotal, .summary-total {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	clear: both;
	margin: 1rem 0;
	overflow: hidden;
	padding: 0.5rem 0;
}

.summary {
	background-color: #eee;
	border: 1px solid #aaa;
	padding: 1rem;
	position: fixed;
	right: 100px;
	width: 200px;
	top: 300px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.price
:after
,
.subtotal
:after
,
.subtotal-value
:after
,
.total-value
:after
,
{
content
:
 
'
원
';


}
.subtotal-value, .total-value {
	text-align: right;
}

.total-title {
	font-weight: bold;
	text-transform: uppercase;
}

.summary-checkout {
	display: block;
}

.checkout-cta {
	display: block;
	float: none;
	font-size: 0.75rem;
	text-align: center;
	text-transform: uppercase;
	padding: 0.625rem 0;
	width: 100%;
}
</style>
<body>

	<form name="frm" method="post" action="./basket/buy.do"
		encType="UTF-8">



		<div class="basket">
			<table class="table table-hover" id="basket_tb">
				<tr class="basket-labels">
					<th class="checkbox" width="50px">구분
						<div class="allCheck"></div>
					</th>
					<th class="item itme-heading">상품</th>
					<th class="product">이름</th>
					<th class="price-">가격</th>
					<th class="quantity">수량</th>
					<th class="subtotal-">총금액</th>
					<th class="remove_p">삭제</th>
					<th class="change_p">수정</th>
				</tr>

				<c:set var="sum" value="0" />
				<c:forEach var="basket" items="${basketList}" varStatus='index'>
					<c:set var="ba_quantity"
						value="${basketList[index.count-1].ba_quantity}" />
					<c:set var="sell_number"
						value="${basketList[index.count-1].sell_number}" />
						
<%-- 					<input type="hidden" id="basketSize" value="${fn:length(basket) }"> --%>

					<tr>
						<td class=check style="text-align: center;">
						<input type="checkbox" name="check" value="" data-cartNum="${index.count}" class="checkSelect" id="check${index.count }">
						</td>
						<td class="item" name="src">
							<div class="product-image">
								<img src="${basket.sell_thumbnail}" width="120px" height="166px">
								<input type="hidden" name="thumbnail" id="thumbnail${index.count }"
									value="${basket.sell_thumbnail}">
							</div>
						</td>
						<td class="product-details" name="product-details"><strong>${basket.sell_title}</strong>
							<input type="hidden" name="title" value="${basket.sell_title}">
							<strong><br> <c:choose>
									<c:when test="${basket.ba_color eq '-1'}">
										<input type="hidden" name="color" id="color${index.count}" value="${basket.ba_color}">
									</c:when>
									<c:otherwise>
										color : ${basket.ba_color} 
										<input type="hidden" name="color" id="color${index.count}" value="${basket.ba_color}">
									</c:otherwise>
								</c:choose> </strong> <br> <strong> <c:choose>
									<c:when test="${basket.ba_size eq '-1'}">
										<input type="hidden" name="size" id="size${index.count}" value="${basket.ba_size}">
									</c:when>
									<c:otherwise>
										size&nbsp;&nbsp;&nbsp;: ${basket.ba_size}
										<input type="hidden" name="size" id="size${index.count}" value="${basket.ba_size}">
									</c:otherwise>
								</c:choose>
						</strong></td>

						<td class="price">${basket.sell_price}<input type="hidden"
							name="price" value="${basket.sell_price}">
						</td>
						<td class="quantity"><input type="number" name="ba_quantity"
							id="ba_quantity" value="${basket.ba_quantity}" min="1"
							class="quantity-field"> 
							<input type="hidden" name="quantity" id="quantity${index.count}" value="${basket.ba_quantity}"></td>
						<td class="subtotal">${basket.sell_price*basket.ba_quantity}
						</td>
						<td class="remove"><button class="btn btn-default"
								id="delete"
								onclick="deleteBasket('${basket.sell_number}', '${basket.ba_color}', '${basket.ba_size}')">삭제</button></td>
						<td class="change"><button class="btn btn-default"
								id="modify"
								onclick="modifyBasket('${basket.sell_number}', ${index.count-1}, '${basket.ba_color}', '${basket.ba_size}')">수정</button></td>
					</tr>

					<input type="hidden" name="sell_number" id="sellnumber${index.count}" value="${basket.sell_number}">
					<c:set var="sum"
						value="${sum + (basket.sell_price*basket.ba_quantity)}" />
				</c:forEach>
				<tr>
					<td colspan="6" align="center"><strong>총금액</strong></td> 
					<td id="sum" colspan="2"><fmt:formatNumber
							pattern="###,###,###" value="${sum}" />원 <input type="hidden"
						name="sum" value="${sum}"></td>
				</tr>


			</table>
			<input type="button" class="btn btn-default" id="buy" value="구매">
			
		</div>


<input type="hidden" name="test" value="">
<input type="hidden" name="test1" value="">
<input type="hidden" name="test2" value="">
<input type="hidden" name="test3" value="">
	</form>


	<script>
	
	//구매 버튼 눌렀을 때
	$(document).on('click', '#buy' , function(){
		var frm = document.frm;
		var d_color = "";
		var d_size = "";
		var d_quantity = "";
		var d_sellnumber = "";
		
		var check = $(".checkSelect");
		
		//alert(check.length);
		for(i=0;i<check.length;i++){
            if(check[i].checked == true){
            	var colors = "color" + (i+1);
            	var sizes = "size" + (i+1);
            	var quantities = "quantity" + (i+1);
            	var sellnumbers = "sellnumber" + (i+1);
            	
            	d_color += document.getElementById(colors).value + ",";
            	d_size += document.getElementById(sizes).value + ",";
            	d_quantity += document.getElementById(quantities).value + ",";
            	d_sellnumber += document.getElementById(sellnumbers).value + ",";        	
            	
          
            	
            	document.getElementsByName("test")[0].value = d_color;
            	document.getElementsByName("test1")[0].value = d_size;
            	document.getElementsByName("test2")[0].value = d_quantity;
            	document.getElementsByName("test3")[0].value = d_sellnumber;
            }
         }
		
		frm.method="post";
		frm.action="./order2.do";
		frm.submit();
	});
	
	
	/* $(document).ready(function(){
		var size = $("#basketSize");
		//alert(size);
		for(var i=0;i<size;i++){
			if(chkbox1[i].checked == true){
	               prod_group += chkbox1[i].value + " ";
	        }
		}
			
	}); */
	
  
  
  	function deleteBasket(id, color, size){
  		$.ajax({
			type : "POST",
			url : "${contextPath}/basket/removeBasket.do",
			data : {	
				"sell_number" : id,
				"ba_color" : color,
				"ba_size" : size
			},
			success : function() {
				alert('삭제 성공');
				location.reload();
			},
			error : function() {
				alert('삭제 실패');
			}
		});

  	}
  
  	function modifyBasket(id, index, color, size){
  		  alert("id:"+id);
  		alert("index:"+index);
  		alert(color);
		alert(size); 
  		var length=document.frm.ba_quantity.length;
  		/* alert("length:"+length); */
  	    var _ba_quantity=0;
  	    
  		if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
  			_ba_quantity=document.frm.ba_quantity[index].value;		
  		}else{
  			_ba_quantity=document.frm.ba_quantity.value;
  		}
  		
  		var ba_quantity=Number(_ba_quantity);
  		
  		/* alert("수량:"+ba_quantity); */
  		
  		$.ajax({
			type : "POST",
			url : "${contextPath}/basket/updateBasket.do",
			data : {	
				"sell_number" : id,
				"ba_quantity" : ba_quantity,
				"ba_color" : color,
				"ba_size" : size
			},
			success : function() {
			
			},
			error : function() {
				alert(' 실패');
			}
		});

  	}
  
	var fadeTime = 300;
	
	$('.quantity input').change(function() {
		updateQuantity(this);
	});
	
	/* 카트 재계산 */
	function recalculateCart(onlyTotal) {
		var subtotal = 0;
	
		/* 총합 합계 */
		var total = subtotal;
	}
	
	/* 수량 업데이트 */
	function updateQuantity(quantityInput) {
		
		var productRow = $(quantityInput).parent().parent();
		
		var price = parseFloat(productRow.children('.price').text());
		var quantity = $(quantityInput).val();
		var linePrice = price * quantity;
	
		
		productRow.children('.subtotal').each(function() {
			$(this).fadeOut(fadeTime, function() {
				$(this).text(linePrice);
				recalculateCart();
				$(this).fadeIn(fadeTime);
			});
		});
	
		productRow.find('.item-quantity').text(quantity);
		updateSumItems();
	}
	
		</script>


	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../devFw/resources/js/bootstrap.js"></script>
	<script src="../devFw/resources/js/bootstrap.min.js"></script>

</body>
</html>