<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/swiper.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/swiper2.css">

<script src="<%=request.getContextPath()%>/js/swiper.js"></script>
<script>
function loadSlider(){
	 var swiper = new Swiper('.swiper-container', {
		 slidesPerView: 3,
		 autoplay:{
		     delay:3000,
	     },
	     loop: true,
	     pagination: {
	         el: '.swiper-pagination',
	         type: 'fraction',
	     },
	  });
}
</script>
<style>
.swiper-slide > img {
	opacity:0.2;
}
.swiper-slide-next > img {
	opacity:1;
}
.swiper-pagination{
	opacity:0.4;
}
</style>


    <!-- 		메인배너 -->
	<div class="main-banner">
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				      <div class="swiper-slide"><img src="./image/banner01.png" ></div>
				      <div class="swiper-slide"><img src="./image/banner02.png" ></div>
				      <div class="swiper-slide"><img src="./image/banner03.png" ></div>		 
				      <div class="swiper-slide"><img src="./image/banner04.png" ></div>	
				    </div>
				    <div class="swiper-pagination"></div>
				</div>
	</div>