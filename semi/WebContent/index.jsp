
<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.GoodsDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String context = request.getContextPath();
	
	int start = 1;
	int finish = 7;
	GoodsDao dao = new GoodsDao();
	List<GoodsDto> list = dao.getList(start, finish);

	CustomerDao cdao = new CustomerDao();
	CustomerDto cdto = new CustomerDto();
%>




<jsp:include page="/template/header.jsp"></jsp:include>	

<jsp:include page="/template/banner.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/gallary.css">

<style>
	#a{
	text-align:center;
	margin-top:113px;
	font-size: large;
	}
	.row > a > h2{
	margin-top:50px;
	margin-bottom:50px;
	}
</style>
<!-- 		내용 -->
<!-- 			인기게시글 / 키워드 게시글 / 근접위치 -->
					
		<article>
			<div class="row">
				<a href="<%=context%>/goods/goods_list.jsp"><h2>인기게시글</h2></a>
			</div>
			<div class="gallary">
				<% for (GoodsDto dto : list ){ %>
					<div class="gallary-item">
						<a href="<%=context%>/goods/goods_content.jsp?goods_no=<%=dto.getGoods_no()%>">
							<img src="<%=context%>/goods/download.do?goods_no=<%=dto.getGoods_no()%>" width="200" height="200">
						</a>
						<div class="gallary-text">
							<p id="p0">제목 : <%=dto.getGoods_title() %></p>
							<p id="p1">
							<%= dto.getCustomer_basic_address() %>
							</p>
							<p id="p2"><%=dto.getGoods_price()%>원</p>
						</div>
						<div align="right">
								조회수
								<%=dto.getGoods_readcount()%>
								댓글 
								<%=dto.getGoods_replycount()%>
						</div>
					</div>
				<%} %>
				<div class="gallary-item more">
				<a href="<%=context%>/goods/goods_list.jsp" class="more-text">		
					<h3 id="a">+<br>당근나라<br>인기 매물<br>더 보기 </h3>
				</a>
				</div>
			</div>
			
		</article>
		
			
<jsp:include page="/template/footer.jsp"></jsp:include>	