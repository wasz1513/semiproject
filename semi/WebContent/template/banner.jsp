<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<style>
/* 슬라이더 영역 스타일 */

    
    nav{
/*     	margin-top:110px; */
    	height: 380px;
    	z-index: 10;
    }
    
    #banner1{
    	padding:0 100;
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
				      <div class="swiper-slide" id="banner1"><img src="<%=request.getContextPath()%>/image/banner01.png"></div>
				      <div class="swiper-slide" id="banner2"><img src="<%=request.getContextPath()%>/image/banner02.png"></div>
				      <div class="swiper-slide" id="banner3"><img src="<%=request.getContextPath()%>/image/banner03.png"></div>	
				      <div class="swiper-slide" id="banner4"><img src="<%=request.getContextPath()%>/image/banner04.png"></div>	 
				    </div>
				</div>
			</nav>	