<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/test.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/indexlist.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/input.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css">
<title>Semi</title>
<style>
	
/* 	header 부분 범위설정 */
	.row-multi.col-4>.a{
		width:20%;
		
	}	
	
	.row-multi.col-4>.b{
		width:60%;
		margin-top:13px;
		
	}
	
	.row-multi.col-4>.c{
		width:10%;
		margin-top:14px;
		
	}
	
	.row-multi.col-4>.d{
		width:10%;
		margin-top:14px;
		
	}
	
	.row-multi.col-2>.a{
		width:20%;
	}
	
	.row-multi.col-4>*{
		text-align:center;
	}
	
	.row-multi.col-2>*{
		text-align:center;
	}
	
	main{
		width: 100%;
		margin: auto;
	}
	
	header, footer, article{
		width: 1200px;
		margin: auto;
		padding: 2rem;
	}
	
/* 	header{ */
/*     background-color: #fff; */
/*     position: fixed; */
/*     top: 0; */
/*     left: 0; */
/*     right: 0; */
/*     z-index: 100; */
/*     padding:0; */
/* 	} */
	
	
	.row-multi.col-4 > .more{
		margin-top: 120px;

	}



</style>

<!-- ================================================================ -->
<!-- 슬라이더 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script>
function loadSlider(){
	 var swiper = new Swiper('.swiper-container', {
		 autoplay:{
		     delay:3000,
	     },
	     loop: true,
	  });
}
</script>
<% 
String id = (String)session.getAttribute("customer_id"); 
boolean login = id!=null;
String grade = (String)session.getAttribute("customer_grade");
boolean master = grade != null && grade.equals("관리자");
%>

</head>
<body onload="loadSlider();" test>

<!-- 	메인페이지 -->
	<main>
	
		<%if(master){ %>
			<div class="menu-master">
				<label for="custom-menu-admin">운영자페이지</label>
      			<input type="checkbox" id="custom-menu-admin">
      			<ul class="custom-list">
      				<li><a href="<%=request.getContextPath()%>/admin/list.jsp">회원리스트</a></li>
			       	<li><a href="<%=request.getContextPath()%>/goods/goods_list.jsp">상품리스트</a></li>
			        <li><a href="#">운영현황</a></li>	
      			</ul>
			</div>
		<%} %>
<!-- 		헤더 -->
<!-- 			로고 / 검색창 / 로그인 / 관심목록 -->
		<header>
			
			
			<div class="row-multi col-4 logo">
<!-- 				로고 -->
				<div class="a">
					<a href="<%=request.getContextPath()%>">
						<img src="http://placehold.it/180x50">
					</a>
				</div>
<!-- 				검색창 -->
				<div class="b">	
					<form action="#" method="get">
						<input class="main-bar-input" type="text" name="key" size="80%" height="40">
						<button><img src="<%=request.getContextPath()%>/image/find.webp" class="main-button" width="20" height="15"></button>
					</form>
				</div>
<!-- 					로그인 / 마이페이지 -->
				<div class="c">
					<%if(id==null){ %>
					<div class="menu-wrap1">
						<label for="custom-menu1">로그인</label>
      				  	<input type="checkbox" id="custom-menu1">
      				  	<ul class="custom-list">
      				  		<li><a href="<%=request.getContextPath()%>/customer/login.jsp">로그인</a></li>
			             	<li><a href="<%=request.getContextPath()%>/customer/regist.jsp">회원가입</a></li>
			                <li><a href="<%=request.getContextPath()%>/customer/find.jsp">아이디찾기</a></li>
			                <li><a href="#">비밀번호찾기</a></li>		                			
      				  	</ul>
					</div>
					<%}else{ %>
					<div class="menu-wrap2">
						<label for="custom-menu2">마이페이지</label>
      				  	<input type="checkbox" id="custom-menu2">
      				  	<ul class="custom-list">
      				  		<li><a href="<%=request.getContextPath()%>/customer/info.jsp">프로필보기</a></li>
      				  		<li><a href="<%=request.getContextPath()%>/goods/goods_write.jsp">상품등록</a></li>
			             	<li>키워드입력</li>
			                <li>위치수정</li>
			                <li><a href="<%=request.getContextPath()%>/customer/logout.do">로그아웃</a></li>
			                <li><a href="<%=request.getContextPath()%>/board/list.jsp">공지게시판</a></li>	
			                <li><a href="<%=request.getContextPath()%>/help/list.jsp">신고게시판</a></li>
      				  	</ul>
					</div>
					<%} %>
				</div>
<!-- 				관심목록 -->
				<div class="d">
					<div class="menu-wrap3">
						<label for="custom-menu3">관심목록</label>
      				  	<input type="checkbox" id="custom-menu3">
      				  	<ul class="custom-list">
      				  		<li>키워드</li>
			             	<li>찜상품</li>
			                <li>????</li>		
      				  	</ul>
					</div>
				</div>
			</div>
		
			
<!-- 			카테고리 / 인기검색어 -->
			<div class="row-multi col-2">
				<div class="a">
					<div class="menu-wrap">
						<label for="custom-menu">카테고리</label>
      				  	<input type="checkbox" id="custom-menu">
      				  	<ul class="custom-list">
      				  		<li>패션의류</li>
			             	<li>패션잡화</li>
			                <li>화장품/미용</li>
			                <li>디지털/가전</li>
			                <li>가구/인테리어</li>
			                <li>출산/육아</li>
			                <li>식품</li>
			                <li>스포츠/레저</li>
			                <li>생활/건강</li>
			                <li>여행/문화</li>
      				  	</ul>
					</div>
				</div>
				<div class="b">
					인기검색어 검색어1 검색어 2 검색어3
				</div>
			</div>
		</header>
		
<section>

		
