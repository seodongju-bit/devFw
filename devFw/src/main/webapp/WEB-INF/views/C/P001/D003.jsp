<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="../devFw/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script>

$(function() {
    //전역변수
    var obj = [];
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
       oAppRef : obj,
       elPlaceHolder : "editor",
       sSkinURI : "../devFw/resources/smarteditor/SmartEditor2Skin.html",
       htParams : {
          // 툴바 사용 여부
          bUseToolbar : true,
          // 입력창 크기 조절바 사용 여부
          bUseVerticalResizer : true,
          // 모드 탭(Editor | HTML | TEXT) 사용 여부
          bUseModeChanger : true,
       }
    });
    
    $("#subBtn").click(function(){
    	var frm = document.frmch;
    	 //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
   	 
   	var title = document.getElementsByName("title")[0].value;
   	var writer = document.getElementsByName("writer")[0].value;
   	var content = document.getElementsByName("content")[0].value;
   	var division = document.getElementsByName("division")[0].value;
   	if (title.trim() == '') {
   		alert("제목을 입력해주세요");
   		return false;
   	}
   	if (writer.trim() == '') {
   		alert("작성자를 입력해주세요");
   		return false;
   	}
   	if (content.trim() == '') {
   		alert("내용을 입력해주세요");
   		return false;
   	}
   	alert(title);
   	alert(writer);
   	alert(content);
   	alert(division);
   	
     frm.method="post"; 
     frm.action="./write.do"; 
   	 frm.submit();
   	
    });
    
});

/* function goWrite(frm) {
    //전역변수
    var obj = [];
  	
  }  */

</script>

</head>
<body>

<form name="frmch" action = "./write.do" method="post">
 
 <h2 style="text-align: center;">글 작성</h2><br><br><br>

<div style="width: 60%; margin-left: 30%; margin-right: auto;">

		<input type="text" name="writer" style="width: 20%;" placeholder="작성자"/><br>
		<input type="text" name="title" style="width: 40%;" placeholder="제목"/><br>
		<select name="division" >
		<option value="none">===선택===</option>
		<option value="공지">공지</option>
		<option value="이벤트">이벤트</option>
		</select>
		
		<br><br> 
		
		<textarea name="content" id="editor"   style="width: 80%; height: 400px;"></textarea>

		
		<input id="subBtn" type="button" value="글 작성" style="float: left;"/>

</div>

  </form>
  
  
</body>
</html>  