<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
<!DOCTYPE html>
	<script type="text/javascript" src="/devFw/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	
	 <meta name="viewport" content="width=device-width, initial-scale=1">
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  


<style>
body{
	background-color: #F2F2F2;
	text-align:center;
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

#pro_num_search{
	float:right;
	
}
#pro_number{
	float:right;
	width:65%;	
}

.form-group{
	margin:0 auto;
	
}
.innerDiv{
	position:relative;
	display:inline;
	top:7px;
	color:white;
	height:20px;
}
#smallCtgrBox{
	display:none;
}
#tagLabel .innerDiv{
	top:15px;
}
#price{
	position:absolute;
	width:150px;
	height:30px;
	left:650px;
	top:190px;
	color:black;
	z-index:1;
	color:lightgray;
	text-align:right;
}
#editor{
	position:relative;
	width: 95%;
	min-width:800px;
	height: 400px;
	
	
}
#editorBox{
	width:90%;
	background-color: white;
	padding:0 15px;
 	border-radius: 3px; 
} 

 #option{ 
 	position:relative;
 	
 } 
 #sizeOption, #colorOption, #sizeBox, #colorBox{
 	width:160px;
 	float: none;
 	margin:0 15px;
 }
 #optionBox{
 	width:150px;
 	height:100%;
 	display:inline-block;
 	float:left;
 }

 

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script>
	

$(document).ready(function(){
	$('#option').css('display','none');
	var check = '<%=request.getAttribute("error_yn")%>';
	if(check=='n'){
		window.close();
	}
	
	 $('.radio-inline').on('change',function(){
		 //alert($('.radio-inline input:checked').val());
		 var yn = $('.radio-inline input:checked').val();
		 if(yn =='y'){	 
			 $('#quantity').css('display','none');
			 $('#option').css('display','');
		 }
		 else if(yn =='n'){
			 $('#quantity').css('display','');
			 $('#option').css('display','none');
		 }
	 });
});


/////////
$(function() {
    //전역변수
    var obj = [];
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
       oAppRef : obj,
       elPlaceHolder : "editor",
       sSkinURI : "/devFw/resources/smarteditor/SmartEditor2Skin.html",
       htParams : {
          // 툴바 사용 여부
          bUseToolbar : true,
          // 입력창 크기 조절바 사용 여부
          bUseVerticalResizer : true,
          // 모드 탭(Editor | HTML | TEXT) 사용 여부
          bUseModeChanger : true,
       }
    });
    $("#submitBtn").click(function(){
    	var frm = document.addSellForm;
    	 //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
   	 

     frm.action="inputSell.do"; 
   	 frm.submit();
   	
    });
    
});

function proNumSearch(){
	console.log("실행");
	window.open("proNumSearch.do", "제품번호 검색", "width=600, height=350, left=500, top400", "resizable=no");
}

function numberWithCommas(x) {
	  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	  x = x.replace(/,/g,'');          // ,값 공백처리
	  document.getElementById('price').innerHTML=x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원"; // 정규식을 이용해서 3자리 마다 , 추가 
}

let optionSet = new Set();
function addOptionBox(sizeVal, colorVal){
	//var option = document.getElementById("optionUp");
	//var addSelect = document.createElement('select');

	//option.append(addSelect);
	console.log(optionSet);
	if(sizeVal!=0 || sizeVal!=''){  //사이즈 옵션 추가
		if(optionSet.has(sizeVal)){
			alert("이미 들어있는 옵션입니다");
			return;
		}
		var size = document.getElementById("sizeBox");
		var sizeOption = document.createElement('option');
		sizeOption.setAttribute("value", sizeVal);
		sizeOption.append(sizeVal);
		size.appendChild(sizeOption);
		optionSet.add(sizeVal);
	}
	if(colorVal!=0 || colorVal!='' ){  //컬러옵션 추가
		if(optionSet.has(colorVal)){
			alert("이미 들어있는 옵션입니다");
			return;
		}
		var size = document.getElementById("colorBox");
		var sizeOption = document.createElement('option');
		sizeOption.setAttribute("value", colorVal);
		sizeOption.append(colorVal);
		size.appendChild(sizeOption);
		optionSet.add(sizeVal);
	}
	
}
function addOptionUp(sizeVal, colorVal){
	alert(sizeVal+":"+colorVal);
	var option = document.getElementById("optionUp");
	
}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>제품판매</h1>
제품번호 , 제목, 썸네일, 판매가격, (판매내용), 등록날짜, 상품재고수, 옵션(size, color)
<form name="addSellForm" method="post"  accept-charset="UTF-8" >
	<div class="form-group">
		<label class="productLabel"><p class="innerDiv" >제품번호</p>
		<button type="button" class="btn btn-default"  id="pro_num_search" onclick="proNumSearch()">제품번호 찾기</button>
		<input type="text" class="form-control" id="pro_number" name="pro_number" readonly autocomplete="off" />
		</label>
	</div>
	<div class="form-group">
		<label class="productLabel"><p class="innerDiv" >제목</p>
		<input type="text" class="form-control" id="sell_title" name="sell_title" /></label>
	</div>
<!-- 	<div class="form-group"> -->
<!-- 		<label class="productLabel"><a class="innerDiv">썸네일</a> -->
<!-- 		<input type="text" class="form-control" /></label> -->
<!-- 		<input type="file" name="fileName1"> -->
<!-- 	</div> -->
	<div class="form-group">
		<label class="productLabel"><p class="innerDiv" >판매가격</p>
		<input type="text"  class="form-control" name="sell_price" onkeyup="numberWithCommas(this.value)" />
		<div id="price"></div>
		</label>
	</div>
	<div class="form-group">
	<label class="productLabel" id="radio" >판매 옵션을 설정하시겠습니까?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label class="radio-inline">
     			 <input type="radio" name="option_yn"  value="y">옵션 사용
   			</label>
    		<label class="radio-inline">
      			<input type="radio" name="option_yn"  value="n" checked>옵션 없음
    		</label>
	</label>
	</div>
	
	<div class="form-group"> <!-- 옵션 n -->
		<label class="productLabel" id="quantity"><p class="innerDiv" >수량</p>
			<input type='number' class="form-control"  name="sell_quantity" />
  		</label>
	</div>
	
	<div class="form-group"> <!-- 옵션 y -->
		<label class="productLabel" id="option"><p class="innerDiv" id="optionBox">옵션추가 :</p>
		사이즈 입력<input type="text" class="form-control" id="sizeOption" name="size" autocomplete="off">
		<button type="button" class="btn btn-default" onclick="addOptionBox(size.value, 0)"><span class="glyphicon glyphicon-plus"></span></button>
		색상 입력<input type="text" class="form-control" id="colorOption" name="color" autocomplete="off">
		<button type="button" class="btn btn-default" onclick="addOptionBox(0, color.value)"><span class="glyphicon glyphicon-plus"></span></button>
		<br>
		<select name="sizeBox" id="sizeBox" class="form-control"><option value="">size선택</option></select>
		<select name="colorBox" id="colorBox" class="form-control"><option value="">color선택</option></select>
		<button type="button" class="btn btn-default" onclick="addOptionUp(sizeBox.value, colorBox.value)"><span class="glyphicon glyphicon-plus"></span></button>
		</label>
	</div>
	<div class="form-group" id="optionUp">
		
	</div>


<!-- 	<div class="form-group"> -->
<!-- 		<label class="productLabel" id="tagLabel"><a class="innerDiv" >제품설명</a> -->
<!-- 		<textarea class="form-control" rows="2" id="comment" name="pro_explain"></textarea></label> -->
<!-- 	</div> -->
	<div class="form-group" id="editorBox">
		<textarea name="sell_contents" id="editor"  ></textarea>
	</div><br>
	<input type="button" class="btn btn-default" id="submitBtn"  value="판매등록" />
</form>
</body>
</html>