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
    *{
    	margin:0;
    	padding:0;
    }
      #container {
        width: 100%;
        margin: 0 auto;
      }
      #header {
      	position:relative;
      	margin:0 auto;
        width:100%;
        display:block;
      }

      #content {
        position:relative;
        top:3px;
        width: 100%;
        padding:0;
        margin:0;
      }
      #contentDetail{
        position:relative;
        margin:0 auto;
        width: 100%;
      }
      #footer {
        clear: both;
        border: 0px solid #bcbcbc;
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
      <div id="contentDetail">
          <tiles:insertAttribute name="bodyDetail"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>