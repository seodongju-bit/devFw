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
        text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
      	position:relative;
      	margin:0 auto;
        width:100%;
      }
      #sideLayout{
      	position:relative;
      	margin:0px auto;
      	width:1200px;
      	box-sizing:content-box;
      	background-color:pink;
      }
      #sidebar-left {
        width: 200px;
        float: left;
        border: 0px solid #bcbcbc;
        font-size:10px;
      }
      #content {
     	width:980px;
        float: right;
        border: 0px solid #bcbcbc;
      }   
      #mainContent {
        width: 100%;
        padding:0;
        margin:0;
      }
      #mainContentDetail{
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
		<div id="sideLayout">
			<div id="sidebar-left">
				<tiles:insertAttribute name="side" />
			</div>
			<div id="content">
				<tiles:insertAttribute name="body" />
			</div>
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