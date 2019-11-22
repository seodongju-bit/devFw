<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

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
#basket_tb{
width: 840px;
margin:0 auto;
margin-top: 100px;

}

aside {
  float: right;
  position: relative;
  width: 30%;
}

.summary-subtotal,
.summary-total {
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

.price:after,
.subtotal:after,
.subtotal-value:after,
.total-value:after,{
  content: '원';
}

.subtotal-value,
.total-value {
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

<form name="frm" method="post" encType="UTF-8">

<aside>
      <div class="summary">
        <div class="summary-total-items">장바구니<span class="total-items"></span>개</div>
        <div class="summary-subtotal">
          <div class="subtotal-title">총 금액</div>
          <div class="subtotal-value final-value" id="basket-subtotal"></div>
        </div>
        <div class="summary-total">
          <div class="total-title">Total</div>.
          <div class="total-value final-value" id="basket-total"></div>
        </div>
        <div class="summary-checkout">
          <button class="checkout-cta">구매</button>
        </div>
      </div>
</aside>

<div class="basket">
 <table class="table table-hover" id="basket_tb">
 <tr class="basket-labels">
 <th class="checkbox">구분</th>
 <th class="item itme-heading">상품</th>
 <th class="product">이름</th>
 <th class="price-">가격</th>
 <th class="quantity">수량</th>
 <th class="subtotal-">총금액</th>
 <th class="remove_p">삭제</th>
 <th class="change_p">수정</th>
 </tr>
 
 
 <c:forEach var="basket" items="${basketList}" varStatus='index' >
 <c:set var="ba_quantity" value="${basketList[index.count-1].ba_quantity}" />
<c:set var="sell_number" value="${basketList[index.count-1].sell_number}" />

 <tr>
 <td class=check><input type="checkbox"></td>
 <td class="item">
 <div class="product-image">
 <img src="${basket.sell_thumbnail}" width="120px" height="166px">
 </div>
 </td>
 <td class="product-details">
 <strong>${basket.sell_title}</strong>
 <strong><br>
 <c:choose>
 <c:when test="${basket.ba_color eq '-1'}">

 </c:when>
<c:otherwise>
color : ${basket.ba_color} 
</c:otherwise>
</c:choose>
</strong>
<br>
<strong> 
 <c:choose>
 <c:when test="${basket.ba_size eq '-1'}">

 </c:when>
<c:otherwise>
size&nbsp;&nbsp;&nbsp;: ${basket.ba_size}
</c:otherwise>
</c:choose>
</strong>
 </td>
 
 <td class="price">${basket.sell_price}sell_number${basket.sell_number}</td>
 <td class="quantity"><input type="number" id="ba_quantity"  value="${basket.ba_quantity}" min="1" class="quantity-field"></td>
 <td class="subtotal">${basket.sell_price*basket.ba_quantity}
 </td>
 <td class="remove"><button class="btn btn-default" id="delete" onclick="deleteBasket('${basket.sell_number}', '${basket.ba_color}', '${basket.ba_size}')" >삭제</button></td>
 <td class="change"><button class="btn btn-default" id="modify" onclick="modifyBasket('${basket.sell_number}', ${index.count-1}, '${basket.ba_color}', '${basket.ba_size}')" >수정</button></td>
 </tr>
 <input type="hidden" id="mem_no" value="${basket.sell_number}">
 </c:forEach>
 
 </table>
</div> 
</form>
    
  <script>

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
  		/*  alert("id:"+id);
  		alert("index:"+index);
  		alert(color);
		alert(size); */
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
  

			/* $(document).ready(function() {
				
				$('.delete').click(function() {
					$.ajax({
						type : "POST",
						url : "${contextPath}/basket/removeBasket.do",
						data : {	
							"mem_no" : $('#mem_no').val(),
						},
						success : function() {
							alert('삭제 성공');
							location.reload();
						},
						error : function() {
							alert('삭제 실패');
						}
					});
				});
				
				
				$('.modify').click(function() {
					$.ajax({
						type : "POST",
						url : "${contextPath}/basket/updateBasket.do",
						data : {
							"ba_quantity" : $('#ba_quantity').val(),
							"mem_no" : $('#mem_no').val(),
						}
						/* success : function() {
							alert('수정 성공');
							location.reload();
							
						},
						error : function() {
							alert('수정 실패');
							
						} 
					});
				}); 
			}); 
*/
			
						var fadeTime = 300;
						
						$('.quantity input').change(function() {
							updateQuantity(this);
						});
						
						$(document).ready(function() {
							updateSumItems();
						});
						
						/* 카트 재계산 */
						function recalculateCart(onlyTotal) {
							var subtotal = 0;
						
							/* 행 합계 */
							$('.basket-product').each(
									function() {
										subtotal += parseFloat($(this)
												.children('.subtotal').text());
									});
						
							/* 총합 합계 */
							var total = subtotal;
						
							/*If switch for update only total, update only total display*/
							if (onlyTotal) {
								/* Update total display */
								$('.total-value').fadeOut(fadeTime, function() {
									$('#basket-total').html(total);
									$('.total-value').fadeIn(fadeTime);
								});
							} else {
								/* Update summary display. */
								$('.final-value').fadeOut(fadeTime, function() {
									$('#basket-subtotal').html(subtotal);
									$('#basket-total').html(total);
									if (total == 0) {
										$('.checkout-cta').fadeOut(fadeTime);
									} else {
										$('.checkout-cta').fadeIn(fadeTime);
									}
									$('.final-value').fadeIn(fadeTime);
								});
							}
						}
						
						/* 수량 업데이트 */
						function updateQuantity(quantityInput) {
							/* Calculate line price */
							var productRow = $(quantityInput).parent().parent();
							var price = parseFloat(productRow.children('.price').text());
							var quantity = $(quantityInput).val();
							var linePrice = price * quantity;
						
							/* Update line price display and recalc cart totals */
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
						
						function updateSumItems() {
							var sumItems = 0;
							$('.quantity input').each(function() {
								sumItems += parseInt($(this).val());
							});
							$('.total-items').text(sumItems);
						}
		</script>
  
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../devFw/resources/js/bootstrap.js"></script>
	<script src="../devFw/resources/js/bootstrap.min.js"></script>
  
</body>
</html>