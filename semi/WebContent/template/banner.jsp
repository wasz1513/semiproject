<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

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
<style>


.swiper-slide > img {
	opacity:0.2;
}
.swiper-slide-next > img {
	opacity:1;
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
				</div>
	</div>

	