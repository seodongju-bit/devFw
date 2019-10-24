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
        width: 100%;
        margin: 0px auto;
        text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
        padding: 0;
        margin: 0;
        width:100%;
        height:215px;
        background-color: #F3F3F3;
      }
      #sidebar-left {
        width: 15%;
        min-height:700px;
        padding: 5px;
        margin-right: 5px;
        margin-bottom: 5px;
        float: left;
        border: 0px solid #bcbcbc;
        font-size:10px;
      }
      #content {
        width: 75%;
        padding: 5px;
        margin-right: 5px;
        float: left;
        border: 0px solid #bcbcbc;
      } 
      
      #mainContent {
        width: 100%;
        padding:0;
        margin:0;
      }
      #mainContentDetail{
        width: 100%;
        padding:0;
        margin:0;
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
       <div id="sidebar-left">
          <tiles:insertAttribute name="side"/>
      </div> 
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="mainContent">
          <tiles:insertAttribute name="fullBody"/>
      </div>
      <div id="mainContentDetail">
          <tiles:insertAttribute name="fullBodyDetail"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>