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
body {
  font-family: Arial, Helvetica, sans-serif;    

     
}
/* Create a column layout with Flexbox */
.row {
  display: flex;
}

/* Left column (menu) */
.left {
  flex: 35%;    
  padding: 15px 0;
   font-size:20px;
                      
                        
  }

.left h2 {
  padding-left: 8px;                    
}

                             
/* 왼쪽 메뉴 스타일 */
#myMenu {         
  list-style-type: none;
  padding: 0;          
  margin: 0;
  width:200px;       
 
}

#myMenu li{
font-size:20px;
}                  
      
#myMenu li a {
  padding: 12px;
  font-size:15px;
  text-decoration: none;
  color: black;
  display: block
}

#myMenu li a:hover {
  background-color: #eee;
}     

.main {
  margin-left: 160px;
  font-size: 28px; 
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav ul {font-size: 18px;}
}


                    


#sideMenu{
	text-align:center;
}

.bigCtgr{
	text-align:center;
}
.smallCtgr:first-child{
	height:45px;
	background-color:orange;
	font-size:25px;
	color: white;
}
.smallCtgr{
	height:35px;
	background-color:#444444;
	font-size:19px;
	color: lightgray;
}

.smallCtgr:hover{
	background-color: #eee;
	cursor:pointer;
}
 </style>
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
 

 
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
	        	  		smallCtgr.setAttribute("class", "smallCtgr");
	        	  		smallCtgr.setAttribute("onclick", "location.href='/devFw/category.do?code="+code+"'");
	        	  		smallCtgr.append(name);
	        	  		bigCtgr.appendChild(smallCtgr);
	        	  		
	        	   		document.getElementById("sideMenu").appendChild(bigCtgr);
	        	   }else{
	        		   // link=document.createElement('a');
	        		   // link.setAttribute("href", "/devFw/category?code"+code);
	        		    //link.append(name);
	        	   		smallCtgr = document.createElement('div');
	        	  		smallCtgr.setAttribute("class", "smallCtgr");
	        	  		smallCtgr.setAttribute("onclick", "location.href='/devFw/category?code="+code+"'");
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
});
</script>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
<div id="sideMenu">

</div>
	<!-- 
	<h1>
		<a href="#"  class="no-underline">회원관리</a><br>
	    <a href="#"  class="no-underline">게시판관리</a><br>
	    <a href="#"  class="no-underline">상품관리</a><br>
    </h1>
     --> 
    <!--  
<div class="row">
  <div class="left" style="background-color:#bbb;">
    <h2>카테고리</h2>
    
    <ul id="myMenu">
      <li><a href="category.do?c=H01&l=1">패션의류</a>
      <ul>                         
      <li><a href="category.do?c=H_01_0001&l=2">여성_상의</a></li>
       <li><a href="category.do">여성_바지</a></li>
       <li><a href="category.do">여성_스커트</a></li>
       <li><a href="category.do">여성_원피스</a></li>
       <li><a href="category.do">여성_아우터</a></li>
       <li><a href="#">남성_상의</a></li>
       <li><a href="#">남성_하의</a></li>
        <li><a href="#">남성_아우터</a></li>   
        <li><a href="#">양말</a></li>
         <li><a href="#">운동화</a></li>
          <li><a href="#">남성구두</a></li>
           <li><a href="#">여성구두</a></li>
            <li><a href="#">가방</a></li>     
             <li><a href="#">악세사리</a></li>            
              <li><a href="#">아동의류</a></li>                  
               <li><a href="#">아동신발</a></li>
               <li><a href="#">내의/잠옷</a></li>
               <li><a href="#">속옷</a></li>
               <li><a href="#">명품관</a></li>
               
      </ul>

  	</li>
    
    </ul>
  </div>
  

</div>


-->


</body>
</html>