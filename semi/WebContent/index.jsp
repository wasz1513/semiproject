
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

%>




<jsp:include page="/template/header.jsp"></jsp:include>	

<jsp:include page="/template/banner.jsp"></jsp:include>


<!-- 		내용 -->
<!-- 			인기게시글 / 키워드 게시글 / 근접위치 -->
					
		<article>
			<div class="row">
				<a href="<%=context%>/goods/goods_list.jsp"><h2>인기게시글</h2></a>
			</div>
			<div class="row-multi col-4">
				<% for (GoodsDto dto : list ){ %>
				<a href="<%=context%>/goods/goods_content.jsp?goods_no=<%=dto.getGoods_no()%>">
					<div>
						<img src="http://placehold.it/200x200">
						<h3>제목 : <%=dto.getGoods_title() %></h3>
					</div>
				</a>
				<%} %>
				<div class="more">
					<a href="<%=context%>/goods/goods_list.jsp">더보기</a>
				</div>
			</div>
			
			<div class="row">
				<h2>키워드 게시글</h2>
			</div>
			<div class="row-multi col-4">
				<div>
					<img src="http://placehold.it/200x200">
					<h3>제목</h3>
				</div>
				<div>
					<img src="http://placehold.it/200x200">
					<h3>제목</h3>
				</div>
				<div>
					<img src="http://placehold.it/200x200">
					<h3>제목</h3>
				</div>
				<div>
					<img src="http://placehold.it/200x200">
					<h3>제목</h3>
				</div>
				<div>
					<img src="http://placehold.it/200x200">
					<h3>제목</h3>
				</div>
				<div>
					<img src="http://placehold.it/200x200">
					<h3>제목</h3>
				</div>
				<div>
					<img src="http://placehold.it/200x200">
					<h3>제목</h3>
				</div>
				<div class="more">
					<a href="<%=context %>/goods/goods_list.jsp"><h6>더보기</h6></a>
				</div>
			</div>
		</article>
		
			
<jsp:include page="/template/footer.jsp"></jsp:include>	