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
<link rel="stylesheet" type="text/css" href="resources/css/F_P002_D001.css?ver=1">

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
	
	
	
	//document.getElementById('test').innerHTML = 'p_id';
	
	if('${item.option_yn}'=='y'){
	/////ajax
	
	  

	}

})
function ajax(){
	console.log("아작스");
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
	        
	           
		       $('#before_id').val(jsonInfo.before_id);
		      
		       var sizeOption ;
		       var colorOption ;
		       
		       sizeOption.setAttribute("id", "sizeOption");
		       sizeOption.setAttribute("class", "form-control");
		       
		       var selectOption1 = document.createElement('option');
		       selectOption1.setAttribute("value", "123123");
		       selectOption1.setAttribute("val", "123123");
		       selectOption1.append("asdf");
	    	   var selectOption2 = document.createElement('option');
	    	   selectOption2.setAttribute("value", "123124");
	    	 
	    	   sizeOption.appendChild(selectOption1);
	    	   sizeOption.appendChild(selectOption2);
	    	   document.getElementById('orderOption').appendChild(sizeOption);
	    	   
	    	   var sizeCheck=0;
	    	   var colorCheck=0;
		       for(var i=0;i<jsonInfo.length;i++){
		    	   jsonInfo[i].option_quantity
		    	   if(jsonInfo[i].option_size!='0' && sizeCheck==0){ sizeOption = document.createElement('select'); sizeCheck++;}
		    	   if(jsonInfo[i].option_color!='0' && colorCheck==0){ colorOption = document.createElement('select'); colorCheck++;}
		    	   
		    	   if(sizeCheck>0){
		    		   var selectSize = document.createElement('option');
		    		   selectSize.setAttribute("value", jsonInfo[i].option_size);
		    		   selectSize.append(jsonInfo[i].option_size);
		    		   sizeOption.appendChild(selectSize);
		    	   }
		    	   if(colorCheck>0){
		    		   var selectColor = document.createElement('option');
		    		   selectColor.setAttribute("value", jsonInfo[i].option_color);
		    		   selectColor.append(jsonInfo[i].option_color);
		    		   colorOption.appendChild(selectColor);
		    	   }
		    	   
		    	   
		    	  // document.getElementById('orderOption').innerHTML += jsonInfo[i].option_size;
		    	   //document.getElementById('orderOption').innerHTML +=jsonInfo[i].option_color;
		      
		       }
		       //document.getElementById('sizeOption').appendChild(selectOption);
		      
	       },
	       error:function(request,textStatus,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	       complete:function(data,textStatus){
	          //alert("작업을완료 했습니다");
	       }
	    });  //end ajax
}
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
			<select id="sizeOption" class="form-control">
				<option>옵션1</option>
	 			
			</select>
			<select id="option2" class="form-control">
				
			</select>
		</div>
		<div id="selectItem" class="sellInfo">선택상품
			<div id="item_1" name="pro_number" >상품1  수량<input type="number" name="detail_quantity" class="quantity" value="1" min="0" max="99" ></div>
			<div id="item_2" name="item_2"> 상품2  수량<input type="number" class="quantity" value="1" min="0" max="99" ></div>
		</div>
		<div id="sellButton">
			<button class="btn btn-light" onclick="ajax()">장바구니</button>
			<button class="btn btn-primary">바로구매</button>
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
	<p>adsf</p>
</c:forEach>
<p id="test" >asdf</p>
 

</body>
</html>