<%@page import="semi.bean.OrdersDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.OrdersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String context = request.getContextPath();
	
%>




<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="<%=request.getContextPath()%>/image/carrot3232.png">

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/test.css">


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/swiper.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css">
<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/boardlist.css">
<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/info.css">
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/css/regist.css"> 
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/css/change_info.css"> 
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/css/find.css"> 
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/css/find_pw.css"> 
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/css/write.css">
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/css/edit.css"> 
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/css/date.css"> 
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/css/customer.css"> 
<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/header.css">

<title>당근나라</title>	



<style>
main {
	width: 100%;
	margin: auto;
}
header, footer, article {
	width: 1200px;
	margin: auto;
}
	
.menu-master{
	z-index:150;
}
</style>
<%
	String id = (String) session.getAttribute("customer_id");
	boolean login = id != null;
	String grade = (String) session.getAttribute("customer_grade");
	boolean master = grade != null && grade.equals("관리자");
	
	OrdersDao dao = new OrdersDao();
	List<OrdersDto> list = dao.history_salerequest(id);
%>
</head>
<body test onload="loadSlider();">
	<!-- 	메인페이지 -->
	<main>
		<%
			if (master) {
		%>
		<div class="menu-master">
			<label for="custom-menu-admin">운영자페이지</label> <input type="checkbox"
				id="custom-menu-admin">
			<ul class="custom-list">
				<li><a href="<%=request.getContextPath()%>/admin/list.jsp">회원리스트</a></li>
				<li><a href="<%=request.getContextPath()%>/goods/goods_list.jsp">상품리스트</a></li>
				<li><a href="<%=request.getContextPath()%>/admin/operation.jsp">운영현황</a></li>
				<li><a href="<%=request.getContextPath()%>/admin/help2.jsp">신고게시판</a></li>
			</ul>
		</div>
		<%
			}
		%>
		<!-- 		헤더 -->
		<!-- 			로고 / 검색창 / 로그인 / 관심목록 -->
<header class="header">
			
<div class="inner_wrap">
	<!-- 				로고 -->
	<div class="logo">
			<a href="<%=request.getContextPath()%>">
				<img id="logoimg" src="<%=request.getContextPath()%>/image/logo.png">

			</a>

	</div>
	
<!-- 				검색창 -->
		<div class="searchbar">
			<div class="input_box">
				<form action="<%=request.getContextPath() %>/goods/goods_list.jsp"  method="get">
					<input type="text" name="key" size="80%" height="40">
					<button class="search_btn"><img src="<%=request.getContextPath()%>/image/search_icon.png"></button>
				</form>
			</div>	
		</div>
	<div class="keyword">
		<strong>인기검색어</strong> 
			<a href="#">검색어1</a>
			<a href="#">검색어2</a>
			<a href="#">검색어3</a>
			<a href="#">검색어4</a>
			<a href="#">검색어5</a>
	</div>
<!-- 				로그인 / 마이페이지 -->
<div class="topmenu_wrap">
	<ul class="topmenu">
		<li class ="productadd">
			<a href="<%=request.getContextPath()%>/goods/goods_write.jsp">
			<img src="<%=request.getContextPath()%>/image/add.png">
			상품등록</a>
		</li>
		<li class="login">
			<a>
				<img src="<%=request.getContextPath()%>/image/user_icon.png">
			</a>
		<%if (id == null) {%>
	  	<div class="null">ddd</div>
		<div class="topmenu_sub my">
				<ul class="sub_drop">
					<li><a href="<%=request.getContextPath()%>/customer/login.jsp">로그인</a></li>
					<li><a href="<%=request.getContextPath()%>/customer/regist.jsp">회원가입</a></li>
					<li><a href="<%=request.getContextPath()%>/customer/find.jsp">아이디찾기</a></li>
					<li><a href="<%=request.getContextPath()%>/customer/find_pw.jsp">비밀번호찾기</a></li>		                			
				</ul>
		</div>

		<%} else {%>
		<div class="null">ddd</div>
		<div class="topmenu_sub my">
				<ul class="sub_drop">
					<li><a href="<%=request.getContextPath()%>/customer/info.jsp">마이페이지</a></li>
					<li><a href="<%=request.getContextPath()%>/customer/point/point_info.jsp">포인트내역</a></li>
					<li><a href="#">키워드입력</a></li>
					<li><a href="#">위치수정</a></li>              			
					<li><a href="<%=request.getContextPath()%>/customer/logout.do">로그아웃</a></li>
					<li>
						<a href="<%=request.getContextPath()%>/goods/salerequest.jsp">
							상품거래
							<%if(list.size()>0){ %>
								<font color="red"><%=list.size() %></font>
							<%} %>
						</a>
					</li>
				</ul>
			</div>
		<%}%>
		</li>	
		<li class="mycart">
			<a>
				<img src="<%=request.getContextPath()%>/image/cart_icon.png">
			</a>
			<div class="null">ddd</div>
			<div class="topmenu_sub cart">

				<ul class="sub_drop">
						<li><a href="#">키워드</a></li>
						<li><a href="<%=context%>/goods/goods_list.jsp?customer_id=<%=id%>">찜상품</a></li>
						<li><a href="<%=request.getContextPath()%>/goods/orders_list.jsp?customer_id=<%=id%>">구매내역</a></li>
						<li><a href="<%=request.getContextPath()%>/goods/sale_list.jsp?customer_id=<%=id%>">판매내역</a></li>

				</ul>
			</div>
		</li>
	</ul>	
</div>
</div>
<!-- 			카테고리 / 인기검색어 -->
<div class="gnb_wrap">
		<ul class="category">
					<li class="depth1">
						<a href="#"><img src="<%=request.getContextPath()%>/image/menu.png">
								카테고리</a>
					<div class="gnb_dropmenu">
						<ul>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=패션의류">패션의류</a></li>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=패션잡화">패션잡화</a></li>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=미용">화장품/미용</a></li>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=가전">디지털/가전</a></li>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=가구">가구/인테리어</a></li>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=육아">출산/육아</a></li>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=식품">식품</a></li>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=스포츠">스포츠/레저</a></li>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=생활">생활/건강</a></li>
							<li><a href="<%=context%>/goods/goods_list.jsp?goods_category=여행">여행/문화</a></li>
						</ul>
					</div>
					</li>
					<li><a href="<%=request.getContextPath()%>/goods/goods_list.jsp">
					새로운 상품 보기</a>
					</li>

					<li>
					<a href="<%=request.getContextPath()%>/board/list.jsp">
					공지사항</a>
					</li>

					<li><a href="<%=request.getContextPath()%>/help/help_write.jsp">
					<img src ="">신고하기</a>
					</li>
		</ul>
</div>
</header>
<section>