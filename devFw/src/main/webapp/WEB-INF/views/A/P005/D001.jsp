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
<link href="../pro27/resources/css/bootstrap.min.css" rel="stylesheet">
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
.total-value:after,
.promo-value:after {
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

<div class="basket">
 <table class="table table-hover" id="basket_tb">
 <tr class="basket-labels">
 <th class="checkbox">구분</th>
 <th class="item itme-heading">상품</th>
 <th class="product">이름</th>
 <th class="price">가격</th>
 <th class="quantity">수량</th>
 <th class="subtotal">총금액</th>
 <th class="remove_p">삭제</th>
 </tr>
 
 <c:forEach var="basket" items="${basketList}" >
 <tr>
 <td class=check><input type="checkbox"></td>
 <td class="item">
 <div class="product-image">
 <img src="http://placehold.it/120x166">
 </div>
 </td>
 <td class="product-details">
 <strong><span class="item-quantity">${basket.ba_quantity}</span> x Eliza J</strong> Lace Sleeve Cuff Dress
 <p><strong>Navy, Size 18</strong></p>
 <p>Product Code - ${basket.prod_number}</p>
 </td>
 <td class="price">${basket.sell_number}</td>
 <td class="quantity"><input type="number" value="${basket.ba_quantity}" min="1" class="quantity-field"></td>
 <td class="subtotal">${basket.sell_number}
 </td>
 <td class="remove"><button class="btn btn-default">삭제</button></td>
 </tr>
 </c:forEach>
 
 </table>
</div>

<aside>
      <div class="summary">
        <div class="summary-total-items">장바구니<span class="total-items"></span>개</div>
        <div class="summary-subtotal">
          <div class="subtotal-title">총 금액</div>
          <div class="subtotal-value final-value" id="basket-subtotal">100,000</div>
        </div>
        <div class="summary-total">
          <div class="total-title">Total</div>
          <div class="total-value final-value" id="basket-total">100,000</div>
        </div>
        <div class="summary-checkout">
          <button class="checkout-cta">구매</button>
        </div>
      </div>
    </aside>

  <script>
  /* 설정 값 */

  var fadeTime = 300;

  /* 액션 */
  $('.quantity input').change(function() {
    updateQuantity(this);
  });

  $('.remove button').click(function() {
    removeItem(this);
  });

  $(document).ready(function() {
    updateSumItems();
  });

  /* 카드 재계산 */
  function recalculateCart(onlyTotal) {
    var subtotal = 0;

    /* 행 합계 */
    $('.basket-product').each(function() {
      subtotal += parseFloat($(this).children('.subtotal').text());
    });

    /* 총합 합계 */
    var total = subtotal;

    /*If switch for update only total, update only total display*/
    if (onlyTotal) {
      /* Update total display */
      $('.total-value').fadeOut(fadeTime, function() {
        $('#basket-total').html(total.toFixed(3));
        $('.total-value').fadeIn(fadeTime);
      });
    } else {
      /* Update summary display. */
      $('.final-value').fadeOut(fadeTime, function() {
        $('#basket-subtotal').html(subtotal.toFixed(3));
        $('#basket-total').html(total.toFixed(3));
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
        $(this).text(linePrice.toFixed(3));
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

  /* 카트 제거 */
  function removeItem(removeButton) {
    /* Remove row from DOM and recalc cart total */
    var productRow = $(removeButton).parent().parent();
    productRow.slideUp(fadeTime, function() {
      productRow.remove();
      recalculateCart();
      updateSumItems();
    });
  }
  </script>
  
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../pro27/resources/js/bootstrap.js"></script>
	<script src="../pro27/resources/js/bootstrap.min.js"></script>
  
</body>
</html>