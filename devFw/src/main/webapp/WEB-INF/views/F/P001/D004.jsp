<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<style>

/* 
div.name{
font-size:30px;
margin-top:50px;
margin-right:180px;
font-style: italic;
font-weight: bolder;

}
div.gallery{

   position:relative;
background-color:#848484;
    margin: 5px;                        
    border: 1px solid #ccc;
    float: left;
    width: 300px;
    height:450px;              
    }
  div.gallery:hover {         
  border: 1px solid #777;
}   

div.gallery img {
  width: 100%;
  height: 378.39px;

}

div.desc {
position:initial;
bottom:8px;                               
left:16px;
font-size:15px;
  padding: 15px;
  text-align: center;
}                                                                 
div.desc1{
color:white; 
}     
     
    
      
#paging {
postion:fixed;
width:580px; 
text-align:center; 
float:center; 
line-height:15px;
}
#paging a.prev{
font:8pt verdana; 
color:#555555;

}
#paging .selected {
font-weight:bolder; 
color:#555555;
}
#paging a.num{
border:#AAAAAA 1px solid;
 background-color:#FFFFFF; 
 color:#555555;
  padding:3px 6px;                               
   margin:3px;
    font:8pt verdana;
    }
#paging a:hover.num{
border:#555555 1px solid;
}

#page{                                        
position:relative;
left:335px;
}
       */              
    #banner{
    /* margin-left: auto;
    margin-right: auto; */
    width: 650px;
    height: 470px;
    margin-right: 0;
    }                               

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  

<div class="banner" id="banner">
<c:forEach var="banner" items="${eventbanner}">
<div style="max-width: 650px;">
<p align="center">${banner.NO_TITLE}</p><br>
<a href="#" style="align: center;">
    <img src="${banner.NO_BANNER}" alt="" width="400" height="400" style="margin-left: 100px;">
</a><br>
<p align="center">이벤트 기간: ${banner.NO_STDATE}&nbsp;~&nbsp;${banner.NO_ENDDATE}</p>
</div>
</c:forEach>
</div>

<%-- 
<div class="name">
event product
</div>
 <c:forEach var="productlist1" items="${List}" >   
<div class="gallery">

  
<a href="${contextPath}/sellItems.do?sell_no=${productlist1.sell_number}">
    <img src="${productlist1.sell_thumbnail}" alt="1" width="400" height="400">
</a>
<a href="${contextPath}/sellItems.do?sell_no=${productlist1.sell_number}">
  <div class="desc"><div class="desc1">${productlist1.sell_title}<br></div>
<fmt:formatNumber value="${productlist1.sell_price}" pattern="#,###"/>원 
   ${productlist1.event_explain}    
   </div>        
   </a>           
                                                            
</div>                                                  
     
</c:forEach> 


<div id="paging">
<s_paging id="page"> 
                             
    <a href="#">Prev</a>
    <strong>1</strong>   
     <a href="#">2</a>
    <a href="#">3</a>
    <a href="#">4</a>
    <a href="#">5</a>
    <a href="#">Next</a>                              

</s_paging>
</div>

 --%>
</body>
</html>        