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


#topCategoryName{
	position: relative;
	left: 230px;
	display: block;
	padding:3px 10px;
	text-align: center;
	width:130px;
	font-size:13px;
/* 	background-color: lightgray; */
	margin:20px 0px 8px 0px;
	border:1px solid gray;
 	border-radius: 10px; 
}                
#topCategoryName:hover{
	cursor: pointer;
}

#sideMenu{
	float: right;
	text-align:center;
	width:250px;
}

.bigCtgr{
	text-align:center;
}
.bigCtrg{
	padding:8px;
	height:40px;
	background-color: #f2f2f2;
	font-size:19px;
	color: #424242;
 	border-radius: 2px 3px 4px 5px; 
	margin-top:3px;
	font-weight: 540;
/* 	display:none; */
	border-bottom: 1px solid gray;
}
.smallCtgr{
/* 	background-color: #F2F2F2; */
	position: relative;
	font-size: 17px;
	color: gray;
 	border-radius: 5px; 
	padding: 5px;
/* 	margin:5px 0; */
/* 	border:1px solid lightgray; */
	display:none;

}

.bigCtrg:hover{
	background-color: #fafafa;
	cursor:pointer;
}
.smallCtgr:hover{
	background-color: #fafafa;
	cursor:pointer;
	font-size:18px;
	font-weight: border;
}

 </style>
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//alert('${cnum}');
$(document).ready(function(){
	 $.ajax({
	       type:"post",
	       async:false,  
	       url:"/devFw/searchCommon.do",
	       data: {"p_id":"H"},
	       dataType:"json",
	       success:function (data,textStatus){
	    	   //var jsonInfo = JSON.parse(data);
	           var jsonInfo = data;
	           var bigCtgr;
	           var smallCtgr;
	           var link;
	           for(var i=0;i<jsonInfo.length;i++){
	        	   var name = jsonInfo[i].common_name;
	        	   var code = jsonInfo[i].common_code;
	        	   
	        	   if(code.length==4){
	        			bigCtgr = document.createElement('div');
	        	   		bigCtgr.setAttribute("class", "bigCtgr");
	        	   		
	        	   		smallCtgr = document.createElement('div');
	        	  		smallCtgr.setAttribute("class", "bigCtrg");
	        	  		smallCtgr.setAttribute("id", code);
	        	  		smallCtgr.setAttribute("onclick", "location.href='/devFw/category.do?ctgrNum="+code+"'");
	        	  		smallCtgr.append(name);
	        	  		bigCtgr.appendChild(smallCtgr);
	        	  		
	        	   		document.getElementById("sideMenu").appendChild(bigCtgr);
	        	   }else{
	        		   // link=document.createElement('a');
	        		   // link.setAttribute("href", "/devFw/category?code"+code);
	        		    //link.append(name);
	        	   		smallCtgr = document.createElement('div');
	        	  		smallCtgr.setAttribute("class", "smallCtgr");
	        	  		smallCtgr.setAttribute("id", code);
	        	  		smallCtgr.setAttribute("onclick", "location.href='/devFw/category.do?ctgrNum="+code+"'");
	        	  		smallCtgr.append(name);
	        	  		//smallCtgr.appendChild(link);               
	        	  		bigCtgr.appendChild(smallCtgr);
	        	   }
	        	   
	        	   
	        	   
	        	   //document.getElementById("sideMenu").innerHTML += code+name   +"<br>";
	           }
      
	       },
	       error:function(request,textStatus,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	       complete:function(data,textStatus){
	          //alert("작업을완료 했습니다");
	       }
	    });  //end ajax
	    
	 var nowCtgr = '${cnum}';
	 
	 if(nowCtgr==''){
		 $('.bigCtrg').css("display","block");
// 		 $('#topCategoryName').remove();
	 }else{
// 		 if(nowCtgr)
// 		$('[id^='+nowCtgr+']').css("background-color","gray");
		$('[id='+nowCtgr+']').css("background","linear-gradient( to right,#fafafa, white, #f2f2f2)");
		$('[id='+nowCtgr+']').css("font-weight","bolder");
	 	nowCtgr = nowCtgr.substr(0,4);
		$('[id^='+nowCtgr+']').css("display","block");
	 }
	 
});

function totalMenu(){
// 	$('.bigCtrg').toggle('fast');
// 	$('.smallCtgr').toggle('fast');
	
	var tic = $('#topCategoryName').attr("value");
	if(tic=='on'){
		$('#topCategoryName').attr("value","off");
		$('#topCategoryName').css("background-color","lightgreen");
		$('#topCategoryName').html("전체닫기");
		$('.smallCtgr').css("display","block");
	}else{
		$('#topCategoryName').attr("value","on");
		$('#topCategoryName').css("background-color","white");
		$('#topCategoryName').html("전체펴기");
		$('.smallCtgr').css("display","none");
	}
}
</script>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
<div id="topCategoryName" onclick="totalMenu()" value="on">전체펴기</div>
	<div id="sideMenu">
	</div>

</body>
</html>