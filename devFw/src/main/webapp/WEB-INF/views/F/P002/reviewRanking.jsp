<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="../devFw/resources/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
<!DOCTYPE html>
<style>
	#contentsBody{
		position: relative;
		width:1300px;
		background-color: #FAFAFA;
		margin:0 auto;
		min-height:700px;
		color: gray;
		text-align: left;
		background-color: lightgray;
	}
	#bestReview, #bestProduct {
		width:100%;
		height: 400px;
		background-color: #f2f2f2;
		margin: 20px auto;
		border-radius: 10px;
	}
	#reviewListBox{
		width: 100%;
		height: 650px;
	}
	
	.reviewList{
		position:relative;
		width: 100%;
		min-height: 600px;
		background-color: #f2f2f2;
		margin:0 auto;
		font-size: 15px;
		border-radius: 10px;
		
	}
	.reviewBox img{
		width: 130px;
		height: 130px;
		display: block;
		margin: 0 auto;
		
	}
	.imgBox{
		height: 130px;
		border: 5px solid #f2f2f2;
		background-color: white;
		overflow: hidden;
	}
	
	.imgBox:hover{
/* 		height: 150px; */
		cursor: pointer;	
		
	}
	
	.reviewBox{
		position: relative;
		width: 195px;
		height: 250px;
		float: left;
		display: inline-block;
		background-color: white;;
		margin: 10px 30px;
		padding: 5px;
		border: 1px solid lightgray;
	}
	.reviewNum{
		font-size: 16px;
		font-weight: bold;
		border: 3px solid yellow;
		padding: 5px;
		background-color: white;
	}
	.prReviewNum{
		position: absolute;
	}
	
	#proImg{
		width: 196px;
		height: 196px;
	}
	#bestProduct .reviewBox{
		padding: 0px;
		width: 200px;
		height: 250px;
		
	}
	#bestProduct .reviewBox:hover .ProdropBox{
		display: block;
	}
	
	.ProdropBox{
		position: absolute;
		top: 0px;
		width: 200px;
		height: 200px;
		padding:10px;
		display: none;
		background-color: white;
		opacity: 0.7;
		color: white;
	}
	.threeReview{
		margin:1px;
		height: 57px;
		border: 1px solid black;
		background-color: black;
	}
	.threeReview a{
		color: white;
	}
	.threeReview a:hover{
		cursor: pointer;
	}
	
	#pagination {
 		position: absolute;
 		left: 500px;
 		bottom:15px;
    	display: inline-block;
		
 	}

	#pagination a {
   		color: black;
   		float: left;
   		padding: 8px 16px;
		text-decoration: none;
   		transition: background-color .3s;
		border: 1px solid #ddd;
	}


	#pagination a.active {
		background-color: #4CAF50;
		color: white;
		border: 1px solid #4CAF50;
	}

	#pagination a:hover:not(.active) {
		background-color: #ddd;
		cursor: pointer;
	}
	
	
	
	#totalReviewBox{
		position: relative;
		width: 1170px;
		height: 700px;
		text-align: center;
		display: block;
	}
	#totalReview{
		width: 1000px;
		margin: 0 auto;
	}
	.reviewTag:hover{
		font-weight: bold;
		cursor: pointer;
	}
	

	.youtubeBox{
		position: absolute;
		top:210px;
		width:50px;
		height:30px;
	}
	.youtubeBox:hover #player{
		position: absolute;
		top: 0px;
		width:640px;
		height:360px;
		background-color: white;
		z-index: 1;
	}
	.youtubeBox img{
		width:45px;
		height:30px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	if('${bestReview.size()}'==0){
		document.getElementById('bestReview').innerHTML += "<br><h4>데이터가 없습니다.</h4>";
	}

});

function paging(movePage){
	$('#contentsBody').load('reviewRanking.do',{ ctgrNum :'${ctgrNum}', page :movePage});
}

function pageMake(){
	var startIndex ='${pageInfo.start }';
    var endIndex ='${pageInfo.end }';
	var now = '${pageInfo.page }';
	var div = document.getElementById('pagination');
	
	if(startIndex!='1'){
		var start = document.createElement('a');
		start.append("<");
		start.setAttribute("onclick","paging("+(startIndex-1)+")");
		div.appendChild(start);
	}
	
	for(var i=startIndex; i<= endIndex ; i++){
		var index = document.createElement('a');
		if(i==now){index.setAttribute("class", "active");}
		index.append(i);
		index.setAttribute("onclick","paging($(this).text())");
		div.appendChild(index);
	}
	
	if(endIndex=='5'){
		var end = document.createElement('a');
		end.append(">");
		end.setAttribute("onclick","paging("+(endIndex+1)+")");
		div.appendChild(end);
	}
}

function readReview(reviewNum){
	var popupX = (window.screen.width/2) - (400);
	var popupY = (window.screen.height/2) - (500);
	window.open("readReview.do?review="+reviewNum, "리뷰보기", "width=850, height=730, left="+popupX+", top="+popupY);
}
function reviewLink(address){
	var popupX = (window.screen.width/2) - (400);
	var popupY = (window.screen.height/2) - (500);
	if(address.indexOf("https://")==-1){
		address = "https://" + address ;
	}
	window.open(address , "리뷰보기", "width=850, height=800, left="+popupX+", top="+popupY);
}
function recommendation(recomNum, sellNo){
	//$('#content').load('sellItems.do',{ sell_no :'${sell_number}', recom :recomNum});
	var url = "sellItems.do?sell_no="+sellNo+"&recom="+recomNum;
	window.location.href = url;
}


$(document).ready(function(){
	pageMake();
});

var youtubeSw = 1;
$(".youtubeBox").mouseover(function(){
	if(youtubeSw==1){
		var videoId = $(this).attr("value");
		var player = document.createElement("div");
		player.setAttribute("id","player");
		player.innerHTML="<iframe id='ytplayer' type='text/html' width='640' height='360' src='https://www.youtube.com/embed/"+videoId+"?autoplay=1&origin=http://example.com' frameborder='0'></iframe>";
		$(this).append(player);
		youtubeSw =0;
	}
});

$(".youtubeBox").mouseleave(function(){
 	$(this).html('<img src="resources/image/youtubeIcon.png" >');
 	youtubeSw=1;
});


</script>
</head>
<html>
<body>
    <div id="contentsBody">
    
		<h2>리뷰랭킹</h2>
		<div id="bestReview">
			<h3>Best Review</h3> (월간추천수 기준 정렬)<br>
			<c:forEach var="bestReview" items="${bestReview}" varStatus="index">
				<div class="reviewBox">
					<span class="reviewNum">${index.count }</span>
					<div class="imgBox" onclick="readReview(${bestReview.REVIEW_NUMBER })">${bestReview.REVIEW_THUMNAIL }</div>
					${bestReview.REVIEW_TITLE }
					<p style="text-align: right">by ${bestReview.MEM_ID }<p>
					<br>추천수 ${bestReview.REVIEW_MONTHPOINT }
					<c:choose>
    					<c:when test='${bestReview.REVIEW_YOUTUBE!=null }' >
    						<div class="youtubeBox" value='${bestReview.REVIEW_YOUTUBE}'><img src="resources/image/youtubeIcon.png" ></div>
    					</c:when>
    				</c:choose>
				</div>
			</c:forEach>
		</div>
		
		<div id="bestProduct">
			<h3>best product</h3> (제품추천 높으것들중 각 3개의 리뷰)<br>
			<c:forEach var="bestProduct" items="${bestProduct}" varStatus="index">
				<div class="reviewBox">
					<span class="prReviewNum">${index.count }</span>
					<img id="proImg" src="${bestProduct.SELL_THUMBNAIL }">
						<div class="ProdropBox">
							<div class="threeReview" >
							(1)  <a onclick="readReview(${bestProduct.REVIEW_NUMBER1 })">${bestProduct.REVIEW_TITLE1 }</a>
							<br>추천수 : ${bestProduct.REVIEW_TOTALPOINT1 }	
						</div>
						<div class="threeReview" >
							(2)  <a onclick="readReview(${bestProduct.REVIEW_NUMBER2 })">${bestProduct.REVIEW_TITLE2 }</a>
							<br>추천수 : ${bestProduct.REVIEW_TOTALPOINT2 }
						</div>
						<div class="threeReview">
							(3)  <a onclick="readReview(${bestProduct.REVIEW_NUMBER3 })">${bestProduct.REVIEW_TITLE3 }</a>
							<br>추천수 : ${bestProduct.REVIEW_TOTALPOINT3 }
						</div>
					</div>
					${bestProduct.PRO_NAME }
				</div>
			</c:forEach>
		</div>
		
		<div id="reviewListBox">
			<h3>Recent Recommendation</h3>(전체추천수 3개이상인 최근 등록된 리뷰)
			<div class="reviewList">
    			<c:forEach var="reviewList" items="${reviewList}">
    			<div class="reviewBox">
					${reviewList.REVIEW_THUMNAIL }
					<a class="reviewTag" onclick="readReview(${reviewList.REVIEW_NUMBER })">${reviewList.REVIEW_TITLE }</a>
					by ${reviewList.MEM_ID }
					<br>추천수 ${reviewList.REVIEW_MONTHPOINT }
    				<c:choose>
    					<c:when test='${reviewList.REVIEW_URL!=null }' >
    						<button onclick="reviewLink('${reviewList.REVIEW_URL}')">link</button>
    					</c:when>
    				</c:choose>
					<button class="btn btn-default" onclick="recommendation('${reviewList.REVIEW_NUMBER }','${reviewList.SELL_NUMBER }')">추천 구매</button>
				</div>
				</c:forEach>
    			<br>
    		</div>	
    		<div id="pagination"></div>
		</div>
    </div>
    
    
</body>

</html>