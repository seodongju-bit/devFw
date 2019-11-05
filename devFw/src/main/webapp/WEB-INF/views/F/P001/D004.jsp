<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<style>
                                       


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
  height: auto;

}

div.desc {
position:absolute;
bottom:8px;                               
left:16px;
font-size:15px;
  padding: 15px;
  text-align: center;
}                                                                 
div.desc1{
position:absolute;
bottom:8px;
left:16px;
font-size:15px;
  padding:-50px;   
  text-align: center;
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
                    
                                   

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
<div class="name">
new product
</div>
 <c:forEach var="productlist1" items="${List}" >   
<div class="gallery">
  <a target="_blank" href="myPage.do">

    <img src="${productlist1.sell_thumbnail}" alt="1" width="600" height="400">
  </a>
  <div class="desc">${productlist1.sell_title}<br>
  ${productlist1.sell_price}   
   ${productlist1.event_explain}  
               
   </div>                   
                                                            
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


</body>
</html>        