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
	display:block;
	padding:5px 20px;
	text-align: center;
	float:right;
	width:250px;
	font-size:15px;
	background-color:lightgray;
	margin:5px 0;
	border-radius: 10px;
	
}                
#topCategoryName:hover{
	background-color:lightgreen;
	cursor:pointer;
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
	padding:5px;
	height:45px;
	background-color: #E0E6F8;
	font-size:20px;
	color: #5E59B5;
	border-radius: 10px;
	margin-top:3px;
	font-weight:bold;
	display:none;
}
.smallCtgr{
	background-color: #F2F2F2;
	font-size:15px;
	color: gray;
	border-radius: 5px;
	margin:5px 0;
	border:1px solid lightgray;
	display:none;
}
.bigCtrg:hover{
	background-color: #A9D0F5;
	cursor:pointer;
}
.smallCtgr:hover{
	background-color: #A9D0F5;
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
		 $('[id^=H_]').css("display","block");
		 $('#topCategoryName').remove();
	 }else{
	 	nowCtgr = nowCtgr.substr(0,4);
		$('[id^='+nowCtgr+']').css("display","block");
	 }
	 
});

function totalMenu(){
	$('[id^=H_]').toggle('fast');
	
	var tic = $('#topCategoryName').attr("value");
	if(tic=='on'){
		$('#topCategoryName').attr("value","off");
		$('#topCategoryName').css("background-color","lightgray");
		$('#topCategoryName').html("다른카테고리");
	}else{
		$('#topCategoryName').attr("value","on");
		$('#topCategoryName').css("background-color","lightgreen");
		$('#topCategoryName').html("이전카테고리");
	}
}
</script>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
<div id="topCategoryName" onclick="totalMenu()" value="">다른카테고리</div>
	<div id="sideMenu">
	</div>

</body>
</html>