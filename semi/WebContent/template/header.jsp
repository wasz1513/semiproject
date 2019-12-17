<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/test.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/indexlist.css">
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
	
	header, section, footer {
		width: 1200px;
		margin: auto;
		padding: 2rem;
	}
	
	.row-multi.col-4 > .more{
		margin-top: 120px;
	}

</style>
</head>
<body test>
<!-- 	메인페이지 -->
	<main>
		
<!-- 		헤더 -->
<!-- 			로고 / 검색창 / 로그인 / 관심목록 -->
		<header>
			
			<div class="row-multi col-4">
<!-- 				로고 -->
				<div class="a">
					<img src="http://placehold.it/180x50">
				</div>
<!-- 				검색창 -->
				<div class="b">
					<form action="#" method="get">
						<input type="text" name="key" size="80%">
						<input type="submit" value="검색">
					</form>
				</div>
<!-- 					로그인 / 마이페이지 -->
				<div class="c">
<%-- 					<%if(세션id==null){ %> --%>
<!-- 						<a>로그인</a> -->
					<div class="menu-wrap1">
						<label for="custom-menu1">로그인</label>
      				  	<input type="checkbox" id="custom-menu1">
      				  	<ul class="custom-list">
      				  		<li>로그인</li>
			             	<li>회원가입</li>
			                <li>아이디/비밀번호찾기</li>		
      				  	</ul>
					</div>
<%-- 					<%}else{ %> --%>
<!-- 						<a>마이페이지</a> -->
<!-- 					<div class="menu-wrap2"> -->
<!-- 						<label for="custom-menu2">마이페이지</label> -->
<!--       				  	<input type="checkbox" id="custom-menu2"> -->
<!--       				  	<ul class="custom-list"> -->
<!--       				  		<li>프로필보기</li> -->
<!-- 			             	<li>키워드입력</li> -->
<!-- 			                <li>위치수정</li> -->
<!--       				  	</ul> -->
<!-- 					</div> -->
<%-- 					<%} %> --%>
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
		
<!-- 		메뉴(네비) -->
		<nav>
			<div class="row benner">
				<div>
					<img src="http://placehold.it/1600x300">
				</div>
			</div>
		</nav>
		
<!-- 		내용 -->
<!-- 			인기게시글 / 키워드 게시글 / 근접위치 -->
		<section>
				
		
		