<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

body  {
	backgournd-color:red;
   	margin:0;
   	padding:0;
}

.slider {
   min-width: 1200px;
   
   
}

.slide-viewer {
   position: relative;
   overflow: hidden;
   height: 600px;
}

.slide-group {
   width: auto;
   height: auto;
   position: relative;
   display: flex;
   
}

.slide {
   width: 100%;
   height: 100%;
   display: none;
   position: absolute;
   margin-top: 2rem;
}

.slide:first-child {
   display: block;
}

.slide img {
   width: 100%;
}

/* slide-nav */
.slide-nav {
   width: 100%;
   position: absolute;
   top: 50%;
}

.slide-nav .prev, .slide-nav .next {
   width: 40px;
   height: 40px;
   background-color: rgba(0, 0, 0, 0.205);
   position: absolute;
   cursor: pointer;
   z-index: 2;
}

.slide-nav .prev {
   left: 0;
}

.slide-nav .next {
   right: 0;
}
.slide-group img{
	width:1200px;
	height:600px;
}
.slide-nav .prev::before, .slide-nav .prev::after, .slide-nav .next::before,
   .slide-nav .next::after {
   content: '';
   position: absolute;
   top: 50%;
   left: 25%;
   transform: translate(50% 50%);
   width: 24px;
   height: 2px;
   background-color: white;
   z-index: 3;
}

.slide-nav .prev::before {
   transform-origin: 0 50%;
   transform: rotate(50deg) translate(-1px, -1px);
}

.slide-nav .prev::after {
   transform-origin: 0 50%;
   transform: rotate(-50deg);
}

.slide-nav .next::before {
   transform-origin: 100% 50%;
   transform: rotate(50deg);
}

.slide-nav .next::after {
   transform-origin: 100% 50%;
   transform: rotate(-50deg) translate(1px, -1px);
}

/* button */
.slide-buttons {
   text-align: center;
   position: absolute;
   bottom: 0;
   left: 50%;
   transform: translateX(-50%);
}

.slide-btn {
   border: none;
   background: none;
   color: #000;
   font-size: 200%;
   line-height: 0.5em;
   outline: none;
}

.slide-btn.active, .slide-btn:hover {
   color: #ed8e6c;
   cursor: pointer;
}


</style>
</head>
<body>
   <div class="slider">
      <div class="slide-viewer">
         <div class="slide-group">
            <div class="slide slide-1">
               <img
                  src="https://usercontents-c.styleshare.io/images/20428940/700x432"
                  alt="alt 텍스트">
            </div>
            <div class="slide slide-2">
               <img src="https://pbs.twimg.com/media/D-Y_V5_UcAAMAfY.jpg" alt="">
            </div>
            <div class="slide slide-3">
               <img
                  src="http://college.koreadaily.com/wp-content/uploads/2019/06/54315_shop1_222128.jpg"
                  alt="">
            </div>
            <div class="slide slide-4">
               <img
                  src="http://file3.instiz.net/data/cached_img/upload/2018/02/25/3/02815406ae8ce83388f93d7d233343bc.jpg"
                  alt="">
            </div>
         </div>
      </div>
      <div class="slide-nav">
         <div class="prev"></div>
         <div class="next"></div>
      </div>
      <div class="slide-buttons"></div>
   </div>
</body>
<script>
$(document).ready(function () {
    $('.slider').each(function(){
        var $this = $(this);
        var $group = $this.find('.slide-group');
        var $slides = $this.find('.slide');
        var buttonArray = [];
        var currentIndex = 0;
        var timeout;

        var $nav = $('.slide-nav').find('div');
    
         $nav.on('click', function (event) {
            event.preventDefault();
            console.log($(this));
            if ($(this).hasClass('next')) {
                if (currentIndex === $slides.length -1) {
                    move(0);
                }
                move(currentIndex + 1);
            } else {
                if (currentIndex === 0) {
                    move($slides.length -1);
                }
                move(currentIndex - 1);
            }
        });

    function move(newIndex) {
        var animateLeft, slideLeft;

        advance();

        if ($group.is(':animated') || currentIndex === newIndex) {
            return;
        }

        buttonArray[currentIndex].removeClass('active');
        buttonArray[newIndex].addClass('active');

        if (newIndex > currentIndex) {
            slideLeft = '100%';
            animateLeft = '-100%';
        } else {
            slideLeft = '-100%';
            animateLeft = '100%';
        }

        $slides.eq(newIndex).css({
            left: slideLeft,
            display: 'block'
        });

        $group.animate({left: animateLeft}, function() {
            $slides.eq(currentIndex).css({display: 'none'});
            $slides.eq(newIndex).css({left: 0});
            $group.css({left: 0});
            currentIndex = newIndex;
        });
    }

    function advance() {
        clearTimeout(timeout);
        timeout = setTimeout(function() {                    
            if (currentIndex < ($slides.length - 1)) {
                move(currentIndex + 1);
            } else {
                move(0);
            }
        }, 4000);
    }

    $.each($slides, function(index) {
        var $button = $('<button type="button" class="slide-btn">&bull;</button>');
        if (index === currentIndex) {
            $button.addClass('active');
        }
        $button.on('click', function(){
            move(index);
        }).appendTo('.slide-buttons');
        buttonArray.push($button);
    });

    advance();
    })

});

/* 동한ㅇㅇ
 */
</script>
</html>