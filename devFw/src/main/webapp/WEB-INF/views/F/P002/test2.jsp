<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script><!-- jquery -->
<script>
var request = require('request'),
cheerio = require('cheerio');

var url = "http://codenamu.org/blog/";


request(url, function (err, res, html) {
if (!err) {
    var $ = cheerio.load(html);
    
    // 블로그 title 정보 가져오기
    $(".entry-title > a").each(function () {
        var post = {"title": "", "link": "", "summary": "", "category": []};
        var data = $(this);
        console.log(data.text());
        post["title"] = data.text();
        post["link"] = data.attr("href");
    });
}
})

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>123123

</body>
</html>