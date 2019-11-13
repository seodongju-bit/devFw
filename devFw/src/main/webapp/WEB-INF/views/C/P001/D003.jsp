<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>




</head>
<body>


 
 <h2 style="text-align: center;">글 작성</h2><br><br><br>

<div style="width: 60%; margin-left: 30%; margin-right: auto;">
	<form method="post" action="write.do">
		<input type="text" name="writer" style="width: 20%;" placeholder="작성자"/><br>
		<input type="text" name="title" style="width: 40%;" placeholder="제목"/><br>
		<select name="division" >
		<option value="none">===선택===</option>
		<option value="공지">공지</option>
		<option value="이벤트">이벤트</option>
		</select>
		
		<br><br> 
		<!-- <div id="summernote" name="content"></div> -->
		<textarea id="summernote" name="content"></textarea>
		<input id="subBtn" type="button" value="글 작성" style="float: left;" onclick="goWrite(this.form)"/>
	</form>
</div>
 

 <script>

		$(document).ready(function() {
			$('#summernote').summernote({
				height : 300,
				width : 800,
				minHeight : null,
				maxHeight : null,
				lang : 'ko-KR',
				focus: true,
		        callbacks: {
		          onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		              sendFile(files[i], this);
		            }
		          }
		        }
			});
		});

		function sendFile(file, el) {
		      var form_data = new FormData();
		      form_data.append('file', file);
		      $.ajax({
		        data: form_data,
		        type: "POST",
		        url: '/image',
		        cache: false,
		        contentType: false,
		        enctype: 'multipart/form-data',
		        processData: false,
		        success: function(url) {
		          $(el).summernote('editor.insertImage', url);
		          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
		        }
		      });
		    }

	
		function goWrite(frm) {
			var title = frm.title.value;
			var writer = frm.writer.value;
			var content = frm.content.value;
			var division = frm.division.value; 
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
			frm.submit();
		}
	</script>
  
  
  
</body>
</html>  