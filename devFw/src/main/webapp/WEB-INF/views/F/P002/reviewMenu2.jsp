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

#sideMenu{
	position: relative;
	top: 10px;
	margin: 0 auto;
	width: 1020px;
	height: 135px;
	background-color: white;
	padding: 7px 20px;
	display: block;
	border: 1px solid lightgray;
	border-radius: 15px;
}


.bigCtrg{
	text-align: center;
	position: relative;
	float: left;
	padding: 10px 0 ;
	margin: 10px;
	width: 175px;
	height:40px;
	background-color: #f2f2f2;
	font-size:15px;
	font-weight:bold;
	display: inline;
}
.bigCtrg a{
	color: black;
	cursor: pointer;
}
.smallCtgr{
	position: relative;
	top: 5px;
	left:-150px;
	background-color: black;
	font-size:14px;
	width: 175px;
	height:40px;
	padding:6px;
	color: white;
	display: none;
	z-index: 1;
	opacity: 0.8;
}
.glyphicon{
	float: right;
	margin: 10x;
	font-size: 20px;
	width: 25px;
	height: 25px;
	border-radius: 4px;
}

.glyphicon:hover{
	background-color: white;
	
}
.glyphicon:hover .smallCtgr{
	display: block;
}

.smallCtgr:hover{
	background-color: white;
	color: black;
	font-weight: bold;
	cursor:pointer;
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
	           var dropL;
	           var bigCtgr;
	           var icon;
	           var smallCtgr;
	           var link;
	           for(var i=0;i<jsonInfo.length;i++){
	        	   var name = jsonInfo[i].common_name;
	        	   var code = jsonInfo[i].common_code;
	        	   
	        	   if(code.length==4){
	        		   dropL = document.createElement('div');
	        		   dropL.setAttribute("class", "dropL");
	        	
	        		   var biga = document.createElement("a");
	        		   var icon = document.createElement("span");
	        		   icon.setAttribute("class", "glyphicon glyphicon-plus");
	        		   
	        		   biga.setAttribute("onclick", "moveCtgr('"+code+"')");
	        		   biga.innerHTML=name;
	        		   bigCtgr = document.createElement('div');
	        		   bigCtgr.setAttribute("class", "bigCtrg");
	        		   bigCtgr.setAttribute("id", code);
	        		  // bigCtgr.setAttribute("onclick", "location.href='/devFw/reviewRanking.do?ctgrNum="+code+"'");
	        		   bigCtgr.append(biga);
	        		   bigCtgr.append(icon);
	        		   dropL.appendChild(bigCtgr);
	        	  		
	        	   		document.getElementById("sideMenu").appendChild(dropL);
	        	   }else{
	        	   		smallCtgr = document.createElement('div');
	        	  		smallCtgr.setAttribute("class", "smallCtgr");
	        	  		smallCtgr.setAttribute("id", code);
	        	  		smallCtgr.setAttribute("onclick", "moveCtgr('"+code+"')");
	        	  		smallCtgr.append(name);           
	        	  		icon.appendChild(smallCtgr);
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
	    
// 	 var nowCtgr = '${cnum}';
	 
// 	 if(nowCtgr==''){
// 		 $('[id^=H_]').css("display","block");
// 		 $('#topCategoryName').remove();
// 	 }else{
// // 		 if(nowCtgr)
// // 		$('[id^='+nowCtgr+']').css("background-color","gray");
// 	 	nowCtgr = nowCtgr.substr(0,4);
// 		$('[id^='+nowCtgr+']').css("display","block");
// 	 }
	 $('#contentDetail').load('bestReviewPlus.do',{ ctgrNum :'${ctgrNum}'});
});
function moveCtgr(ctgr){
	$('#contentDetail').load('bestReviewPlus.do',{ ctgrNum :ctgr});
}
</script>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
	<div id="sideMenu">
		<div class="bigCtrg"><a onclick="moveCtgr()">전체보기</a></div>
	</div>

</body>
</html>