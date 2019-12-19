<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<style>
/* 슬라이더 영역 스타일 */

    
    nav{
/*     	margin-top:110px; */
    	height: 300px;
    	z-index: 10;
    }


</style>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script>
function loadSlider(){
	 var swiper = new Swiper('.swiper-container', {
		 slidesPerView: 3,
		 autoplay:{
		     delay:3000,
	     },
	     loop: true,
	  });
}
</script>


    <!-- 		메뉴(네비) -->
			<nav>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				      <div class="swiper-slide"><img src="./image/kh.jpg"></div>
				      <div class="swiper-slide"><img src="./image/sad.gif"></div>
				      <div class="swiper-slide"><img src="./image/sad.gif"></div>		 
				    </div>
				</div>
			</nav>	