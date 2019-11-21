<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>


<style>

page_title{
text-align:center;
}

.content-sheet{
max-width:670px;
margin-left:auto;
margin-right: auto;
}
#btn1, #btn2{
float: right;
margin-left: 5px;
}
</style>

<%-- <link rel="stylesheet" href="${contextPath}/resources/ibsheet/css/style.css"> --%> 


<script language="javascript">
	//시트 높이 계산용
	var pageheightoffset = 200;
	
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:30, Align:"Center",Edit:0},
			{Header:"번호",Type:"Text",SaveName:"point_number",MinWidth:80,Align:"Center",Edit:0},
			{Header:"지급날자",Type:"Date",SaveName:"point_date",MinWidth:150,KeyField:1 ,MultiLineText:1,Align:"Center",Edit:0},			
			{Header:"사용날자",Type:"Date",SaveName:"point_usedate",MinWidth:150,KeyField:1 ,MultiLineText:1, Wrap:1,Align:"Center",Edit:0},
			{Header:"사용금액",Type:"Text",SaveName:"point_usemoney",MinWidth:105,Align:"Center",Edit:0},
			{Header:"주문번호",Type:"Text",SaveName:"order_number",MinWidth:90,Align:"Center",Edit:0},
			{Header:"사용메모",Type:"Text",SaveName:"point_content",MinWidth:60,Align:"Center",Edit:0}
			
		];    
		IBS_InitSheet( mySheet , initSheet);

		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		doAction('search');
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {

		switch(sAction) {
			case "search": //조회
			;
			    var param = FormQueryStringEnc(document.frm);
			   
				mySheet.DoSearch("${contextPath}/pointSearch.do", param);
				//mySheet.DoSearch("transaction_data2.json");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
		}
				
	}
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}	
	
</script>
</head>
<body onload="LoadPage()">
  <div class="page_title" style="text-align: center;">
    <span class="title"><h1>포인트 사용 내역</h1></span>
  </div>
  <br>
  <div class="content-sheet">
    <div class="exp_product">
      <form name='frm'>
      <select name="division" >
		<option value="">===선택===</option>
		<option value="point_date">지급날자</option>
		<option value="point_usedate">사용날자</option>
		</select> 
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
        <input type='Date' id="start" name="start" /> ~ <input type='Date' id="end" name="end" />
        <a href="javascript:doAction('reload')" id="btn1" class="btn btn-default">초기화</a>
	  <a href="javascript:doAction('search')" id="btn2" class="btn btn-default">조회</a>
      </form>
      <br>
    </div>
	<div class="clear hidden"></div>
	<script>createIBSheet("mySheet", "670px", "500px");</script>
  </div>

</body>
</html>