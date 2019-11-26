<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<script type="text/javascript" src="/devFw/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"/><!-- 팝업 관련 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<style>
html {overflow:hidden;} 


.titleBox{
	width:90%;
	background-color:lightblue;
	height:35px;
	margin:0 auto;
	padding:3px 0;
}
#inputTitle{	
	position:relative;
	width:500px;
	height:95%;
	display:inline;
	float:right;
	right:50px;
}
span{
	position:relative;
	top:3px;
	text-align:left;
	font-size:16px;
}
#editor{
	float:center;
	position:relative;
	width: 95%;
	min-width:90%;
	height: 400px;
}
#editorBox{
	position:relative;
	left:50px;
}


#star_grade a{
      text-decoration: none;
      color: gray;
}
#star_grade a.on{
      color: #FFBF00;
}

iframe{
	background-color:white;
}
</style>

<script>

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
          fOnBeforeUnload : function(){}

       }
    });
    
    $("#subBtn").click(function(){
    	 //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
        
//    	 	//아작스
   	 	var queryString = $("form[name=reviewEnrollment]").serialize() ;
	  	console.log(queryString);
    	$.ajax({
        	 type : 'post',
        	 url : 'reviewEnrollment.do',
        	 async:false,
        	 data : queryString,
        	 dataType: "json",
             success : function(Data){
            	 window.close();
       	 	 },
       	 	 error : function(Data){
       	 		 alert("등록에 실패하였습니다");
       	 	 }
    	});
   	 	
   	
    });
    
});


///별점
$(document).ready(function(){
	$("#star_grade a").click(function(){
		 var grade = $(this).prevAll("a").length;
	     $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	     $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	     $("#star").val(grade);
	     return false;
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><br>
<h2>리뷰쓰기</h2>
<div class="reviewBox">
	<form name="reviewEnrollment" method="post"  accept-charset="UTF-8" >
		<div  class="titleBox" ><span>제목</span>
		<input type="text" id="inputTitle" class="form-control" id="title"></div>
		<br>
		<div  class="titleBox" ><span>별점</span>
		<span id="star_grade">
			<a></a>
       		<a href="#" >★</a>
        	<a href="#" >★</a>
        	<a href="#" >★</a>
        	<a href="#" >★</a>
        	<a href="#" >★</a>
		</span>
		</div>
		<input type="hidden" name="grade" id="star" value="3">
		<div class="form-group" id="editorBox">본문
			<textarea  id="editor"  ></textarea>
		</div>
		
		<button type="button" id="subBtn" class="btn btn-default">등록</button>
	</form>

</div>
</body>
</html>
