<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="item" value="${searchItem}" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/F_P002_D001.css?ver=1.1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#itemsImg').attr('src','${item.sell_thumbnail}');
	$('.miniImg').attr('src', 'resources/image/items/10.JPG' );
	
	
	if('${item.option_yn}'=='y'){
	/////ajax
		 var p_id = '${item.sell_number}'
	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"${contextPath}/searchOption.do",
	       data: [{"p_id":p_id}],
	       dataType:"json",
	       success:function (data,textStatus){
	    	   //var jsonInfo = JSON.parse(data);
	           var jsonInfo = data;
	           if(jsonInfo.length!=0){
	        	   $('#orderOption').css('display', 'block');
	           }
	           const size = new Set();
	           const color = new Set();

	           for(var i=0;i<jsonInfo.length;i++){
	        	   var size_op = jsonInfo[i].option_size;
	        	   var color_op = jsonInfo[i].option_color;
	         	   if(size_op!='0' && !size.has(size_op)){
	        	   	 $('#sizeOption').css('display', 'block');
	        	   	 size.add(size_op);
	        	   	 var sizeOption = document.createElement('option');
	        	     sizeOption.setAttribute("value", size_op);
	        	   	 sizeOption.append(size_op);
	        	   	 document.getElementById('sizeOption').appendChild(sizeOption);
	          	  }
	         	  if(jsonInfo[i].option_color!='0' && !color.has(color_op)){
	         		 $('#colorOption').css('display', 'block');
	         		 color.add(color_op);
	        	   	 var colorOption = document.createElement('option');
	        	   	 colorOption.setAttribute("value", color_op);
	        	     colorOption.append(color_op);
	        	   	 document.getElementById('colorOption').appendChild(colorOption);
	          	  }
	           }
		
		      
	       },
	       error:function(request,textStatus,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	       complete:function(data,textStatus){
	          //alert("작업을완료 했습니다");
	       }
	    });  //end ajax
	}

})
var itemList = [];
$(document).ready(function(){
	 $('#sizeOption').on('change',function(){
		 $('#colorOption').css('display', 'block');
		 $('#colorOption').on('change',function(){
			 var item={};
			 if(document.getElementById('colorOption').value!=""){
				 item.color = document.getElementById('colorOption').value;
				 $('#colorOption').val("");
			 }
			 if(document.getElementById('sizeOption').value!=""){
				 item.size = document.getElementById('sizeOption').value;
				 $('#sizeOption').val("");
			 }
		
			 if("color" in item || "size" in item){
				 itemList.push(item);
			 }

			 console.log(itemList);
			 //document.getElementById('sizeOption').value="";
			 
			 

			 /*
			 var form = document.createElement("item1");
			 form.setAttribute("charset", "UTF-8");
	         form.setAttribute("method", "get"); 
	         form.setAttribute("action", "/test/test.html");
			 
			 //var size = document.getElementById('sizeOption');
			 var item = document.createElement("input");
			 item.setAttribute("type", "hidden");
			 item.setAttribute("name", "color");
			 item.setAttribute("value", document.getElementById('colorOption').value);

	         form.appendChild(item);
	         
	         document.getElementById('selectItem').appendChild(form);
			 form.submit();
			 */
			 
		 });
	 });
});



</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="catCategory" >
	<div>
		<a href="#"> 분류 </a> > 
		<a href="#"> 1차 분류 </a> > 
		<a href="#"> 2차 분류 </a>
	</div>
</div>

<div id="sellBox" >
	<div id="imgBox">
		<img id="itemsImg" src="" width="400px" height="400px" />
		<div id="imgList">
			<img class="miniImg" src="" width="60px" height="60px" />
		</div>
	</div>
	<div id="selectBox"> 
		<div id="sellerInfo" class="sellInfo">
			<h2>${item.sell_title}</h2>
		</div>
		<div class="sellInfo">
			<p id="addInfo">혜택/이벤트 정보를 넣어주세요</p>
		</div>
		<div  class="sellInfo">
			<p id="itemPrice">${item.sell_price}원</p>
		</div>
		<div  class="sellInfo">
			<p id="itemDelivery">배송정보를 넣어주세요</p>
		</div>
		<div id="orderOption" class="sellInfo">옵션선택
			<select id="sizeOption" name="option_size" class="form-control" >
				<option value="">사이즈 선택</option>
			</select>
			<select id="colorOption" name="option_color" class="form-control">
				<option value="">색상 선택</option>
			</select>
		</div>
		<div id="selectItem" class="sellInfo">선택상품
			<div id="item_1" name="pro_number" >상품1  수량<input type="number" name="detail_quantity" class="quantity" value="1" min="0" max="99" ></div>
			<div id="item_2" name="item_2"> 상품2  수량<input type="number" class="quantity" value="1" min="0" max="99" ></div>
		</div>
		<div id="sellButton">
			<button class="btn btn-light" onclick="">장바구니</button>
			<button class="btn btn-primary" onclick="location.href='/test/test.html?asdf=12'">바로구매</button>
			
		</div>
	</div>
</div>
<div id="itemsInfoSelect">
	<button id="itemsInfo" class="btn btn-primary">상품정보</button>
	<button id="itemsReview" class="btn btn-primary">리뷰</button>
	<button id="itemsQna" class="btn btn-primary">QnA</button>
	<button id="itemsSaller" class="btn btn-primary">판매자정보</button>
</div>

<div>
 <table border='1' width='800' align='center'>


     <tr align=center>
       <td>${item.sell_number}</td>
       <td>${item.pro_number}</td>
       <td>${item.sell_price}</td>
       <td>${item.sell_score}</td>
   
     </tr>
 
</table>
</div>
${info }
<c:forEach var="option1" items="${info }" >
	<p>${option1.option_size }</p>
</c:forEach>
<p id="test" ></p>


 	

</body>
</html>