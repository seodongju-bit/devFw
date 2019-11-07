<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
    #container {
}
    
    
      #header {
      	width: 100%;
        margin: 0 0 0 0px;
        background-color:gray;
      }
      
      #content {
        width: 100%;
        margin: 0 0 0 0px;
        border: 0px solid #bcbcbc;
      } 
      
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
         background-color: lightblue;
      }
      
        
    
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>         
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <br><br>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>