<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
body{
	background-color: #F2F2F2;
}
.productLabel{
	width:90%;
	background-color:lightblue;
	color:white;
	border-radius: 6px;
	padding:3px;
	
}
.form-control{
	width:80%;
	float:right;
	display:inline;
}
.form-group{
	margin:0 auto;
	
}
.innerDiv{
	position:relative;
	display:inline;
	top:7px;
	color:white;
}
#smallCtgrBox{
	display:none;
}
#tagLabel .innerDiv{
	top:25px;
}
#price{
	position:absolute;
	width:150px;
	height:30px;
	left:410px;
	top:235px;
	color:black;
	z-index:1;
	color:lightgray;
	text-align:right;
}
</style>
<script>
$(document).ready(function(){
	
	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"/devFw/bigDivision.do",
	       data: {},
	       dataType:"json",
	       success:function (data,textStatus){
	    	   //var jsonInfo = JSON.parse(data);
	           var jsonInfo = data;
	           for(var i in jsonInfo){
					var option = "";
	        	    option +="<option value='"+jsonInfo[i].common_code+"'>"+jsonInfo[i].common_name+"</option>";
					document.getElementById('bigCtgr').innerHTML+=option;
	           }  
	       },
	       error:function(request,textStatus,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	       complete:function(data,textStatus){
	       }
	    });  //end ajax
	    
	    //////////////////
	    
	 $('#bigCtgr').on('change',function(){
			var p_code = "";
			if($('#bigCtgr').val()!=""){
				p_code = $('#bigCtgr').val();
				$('#smallCtgrBox').css("display","block");
			}else{
				$('#smallCtgrBox').css("display","none");
				return
			}
			
			
			 $.ajax({
			       type:"get",
			       async:false,  
			       url:"/devFw/smallDivision.do",
			       data: {"p_code":p_code},
			       dataType:"json",
			       success:function (data,textStatus){
			    	   //var jsonInfo = JSON.parse(data);
			           var jsonInfo = data;
			           document.getElementById('smallCtgr').innerHTML="<option value=''>분류를 선택해주세요</option>";
			           for(var i in jsonInfo){
							var option = "";
			        	    option +="<option value='"+jsonInfo[i].common_code+"'>"+jsonInfo[i].common_name+"</option>";
							document.getElementById('smallCtgr').innerHTML+=option;
			           }  
			       },
			       error:function(request,textStatus,error){
			          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       },
			       complete:function(data,textStatus){
			       }
			 });  //end ajax
			
			
	 });
});
function formSubmit(){
	 var queryString = $("form[name=addProductForm]").serialize() ;
	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"/devFw/itemManager/InsertProduct.do",
	       data: queryString,
	       dataType:"json",
	       success:function (data,textStatus){
	    	   window.close(); 
	       },
	       error:function(request,textStatus,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	       complete:function(data,textStatus){
	       }
	 });  //end ajax
}

function numberWithCommas(x) {
	  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	  x = x.replace(/,/g,'');          // ,값 공백처리
	  document.getElementById('price').innerHTML=x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원"; // 정규식을 이용해서 3자리 마다 , 추가 
}



</script>

<title>Insert title here</title>
</head>
<body>
RECOM에 등록되어 있지 않은 상품정보를 추가해주세요
<h1>제품추가</h1>
<form name="addProductForm" method="post" accept-charset="UTF-8" >
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >제품번호</a>
		<input type="text" class="form-control" name="pro_id" /></label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >제품명</a>
		<input type="text" class="form-control"  /></label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >출시일자</a>
		<input type="text" class="form-control"  /></label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >제품가격</a>
		<input type="text"  class="form-control" onkeyup="numberWithCommas(this.value)" />
		<div id="price"></div>
		</label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >대분류</a>
		<select class="form-control" id="bigCtgr" name="bigCtgr">
			<option value="" >분류를 선택해주세요</option>
		</select>
  		</label>
	</div>
	<div class="form-group" id="smallCtgrBox">
		<label class="productLabel"><a class="innerDiv" >소분류</a>
			<select class="form-control" id="smallCtgr">
			</select>
		</label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >제조사</a>
		<input type="text" class="form-control"  /></label>
	</div>
	<div class="form-group">
		<label class="productLabel"><a class="innerDiv" >브랜드명</a>
		<input type="text" class="form-control"  /></label>
	</div>
	<div class="form-group">
		<label class="productLabel" id="tagLabel"><a class="innerDiv" >제품상세</a>
		<textarea class="form-control" rows="3" id="comment"></textarea></label>
	</div>
	<button class="btn btn-default" onclick="formSubmit()">등록</button>
</form>

</body>
</html>