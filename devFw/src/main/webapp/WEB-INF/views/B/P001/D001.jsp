<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<script type="text/javascript" src="/devFw/resources/maskedit/js/jquery-1.7.0.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script language="javascript" src="/devFw/resources/sheet/sheet/ibsheetinfo.js"></script>
<script language="javascript" src="/devFw/resources/sheet/sheet/ibsheet.js"></script>
<script language="javascript" src="/devFw/resources/sheet/sheet/ibexcel.js"></script>
<style>

#area{
	background-color: white;
	width:100%;
	height:700px;
}
.main_content{
	
	width:1250px;
	margin:0 auto;
	background-color: white;
}
#DIV_mySheet{
	margin:0 auto;
	
}
</style>
<script language="javascript">
	
	
	//시트 초기 높이 결정
	var pageheightoffset = 200;
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.UseEditMask = 1;
		//시트 초기화.
		var initSheet = {};
		initSheet.Cfg = {ToolTip:1,FrozenCol:0};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};

		initSheet.Cols = [
			{Header:"선택",Type:"DelCheck", Width:10},
	   		{Header:"NO",Type:"Seq", Align:"Center" , SaveName:"seq", Width:15},
			{Header:"상품글번호",Type:"Text", Align:"Center", SaveName:"sell_number", Edit:"0" , Width:40},
			{Header:"제품번호",Type:"Text", Align:"Center", SaveName:"pro_number", Width:40},
			{Header:"제목",Type:"Text", Align:"Center", SaveName:"sell_title", MinWidth:40},
			{Header:"가격",Type:"Text", Align:"Center", SaveName:"sell_price", MinWidth:40},
			{Header:"문자열",Type:"Text", SaveName:"TEXT_DATA",MultiLineText:1,KeyField:1,MinWidth:80}
		];
		IBS_InitSheet( mySheet , initSheet);
		
		//붙여넣기 모드 (0:한셀에붙여넣기(default) , 1:구분자 기준으로 붙여넣기 , 2:모자란 부분을 추가하면서 붙여넣기)
		mySheet.SetClipPasteMode(2);

		//시트에서 보여질 이미지 배열 구성
		//mySheet.SetImageList(0,"../../common/img/am.jpg");
		//mySheet.SetImageList(1,"../../common/img/ca.jpg");
		//mySheet.SetImageList(2,"../../common/img/ch.png");
		//mySheet.SetImageList(3,"../../common/img/fe.jpg");
		//mySheet.SetImageList(4,"../../common/img/ko.jpg");
		//mySheet.SetImageList(4,"../../common/img/ru.jpg");
		//mySheet.SetDataLinkMouse("AUTOSUM_DATA",1);
		
		//콤보 컬럼 클릭시 즉시 펼쳐짐.
		mySheet.SetComboOpenMode(1);
		
		var json = mySheet.GetSearchData("/devFw/itemManager/searchList.do");
		mySheet.LoadSearchData(json);
	}
	 
	var toggle = 0;
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search":      //조회
				var json = mySheet.GetSearchData("/devFw/itemManager/searchList.do");
				mySheet.LoadSearchData(json);
				break;
			case "reload":  //조회 데이터 제거
				mySheet.RemoveAll();
				break;
			case "save":  //수정된 데이터 추출 확인
//				mySheet.DoSave("save.jsp");
				var json = mySheet.GetSaveJson({ "AllTypeToText" : 1 });
				alert(JSON.stringify(json));
				break;
			case "insert"://신규행 추가
				var row = mySheet.DataInsert();
				break;
				
		}
	}
	function mySheet_OnButtonClick(Row, Col) {
		alert(Row+"행의 버튼이 클릭되었습니다.");	
	}

	//Popup,PopupEdit 컬럼에 팝업 버튼 클릭시 호출 이벤트
	function mySheet_OnPopupClick(Row,Col){
		
		var v = mySheet.GetCellText(Row,"ISO");
		document.getElementById("popupFrame").src="./popup.jsp?searchCondition="+encodeURIComponent(v);
		//DIV 형태의 팝업창을 띄운다.
		showAndHide(1);
	}
	/////////
	
	

	function addProduct(){
		var popupX = (window.screen.width/2) - (400);
		var popupY = (window.screen.height/2) - (500);
		window.open("itemManager/addProduct.do", "제품추가창", "width=600, height=700, left="+popupX+", top="+popupY,"resizable=no");
	}
	
	function addSell(){
		var popupX = (window.screen.width/2) - (400);
		var popupY = (window.screen.height/2) - (500);
		window.open("itemManager/addSell.do", "판매등록창", "width=885, height=920, left="+popupX+", top="+popupY,"resizable=no");
	}


</script>

<title>Insert title here</title>
</head>
<body onload="LoadPage()">
     <div id="area">
		
        <div class="main_content">
  			<h1>상품관리</h1><br>
  			<button class="btn btn-default" onclick="addProduct()">제품추가</button>
  			<button class="btn btn-default" onclick="addSell()">판매등록</button>

            <div class="ib_function float_right">
                <a href="javascript:doAction('reload')" class="f1_btn_gray lightgray">초기화</a>
                <a href="javascript:doAction('insert')" class="f1_btn_gray lightgray">추가</a>
                <a href="javascript:doAction('search')" class="f1_btn_white gray">조회</a>

                <a href="javascript:doAction('save')" class="f1_btn_white gray">저장</a>
            </div>

            <div class="clear hidden"></div>

            <div class="ib_product">
				<script type="text/javascript"> createIBSheet("mySheet", "1200px", "500px"); </script>
            </div>

        </div>
        <!--main_content-->

	


	</div>
</body>
</html>