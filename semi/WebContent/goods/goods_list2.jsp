<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.GoodsFilesDao"%>
<%@page import="semi.bean.GoodsFilesDto"%>
<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
    String context = request.getContextPath();
    
    //페이지 크기
    	int pagesize = 28;
    	int navisize = 10;
    
    	String goods_category = request.getParameter("goods_category");
    	
    	//페이징 추가
  	int pno;
    try{
    	pno = Integer.parseInt(request.getParameter("pno"));
    	if(pno <=0) throw new Exception();
    }
    catch(Exception e){
    	pno = 1;
    }

    	int finish = pno * pagesize;
    	int start = finish - (pagesize -1);
    	
    	String type = request.getParameter("type");
    	String keyword = request.getParameter("keyword");
  		
    	String keyword_search = request.getParameter("keyword_search");
    	
    	boolean isSearch = type != null && keyword != null;
    	boolean isSearch2= type == null && keyword != null;
    	
    	GoodsDao dao = new GoodsDao();
    	CustomerDao kdao = new CustomerDao();
    	CustomerDto  kdto = new CustomerDto();
    	String customer_id = (String)request.getSession().getAttribute("customer_id");
    	kdto = kdao.get(customer_id);
    	
   		 List<GoodsDto> list;
   		 
    	if(goods_category != null){
    		list = dao.CategorySearch( goods_category, start, finish);
    	}
    	else if(isSearch){
    		list = dao.search(start , finish ,type , keyword);
    	}
    	else if(isSearch2){
    		list=dao.search(start, finish, keyword);
    	}
    	else if(keyword_search != null){
    		list = dao.keywordsearch(keyword_search, start, finish);
    	}
    		
    	else{
    		list  = dao.getList(start , finish);
    	}
    	
    	int count = 0;
    	
    	if(isSearch){
    		count = dao.getCount(type , keyword);
    	}else if(keyword_search != null){
    		count = dao.getCount(keyword_search);
    	}
    	
    	
    
    	GoodsFilesDao fdao = new GoodsFilesDao();
    	
    	
    	
    %> 
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
* {
	box-sizing: border-box;
}

.gallary::after {
	content: "";
	display: block;
	clear: both;
}

.gallary>.gallary-item {
	float: left;
	width: 25%;
	padding: 10px;
}

.gallary>.gallary-item img {
	width: 100%;
}

/*        폭이 720px 이하면 2단으로 표시*/
@media screen and (max-width:720px) {
	.gallary>.gallary-item {
		width: 50%;
	}
}

@media screen and (max-width:540px) {
	.gallary>.gallary-item {
		width: 100%;
	}
}
</style>

<article>


		<div align="center">
			<%if (isSearch) {%>
			<h2>검색 결과 상품</h2>
			<<h6> 관심상품 : 
			 		<a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_first() %>"><%=kdto.getKeyword_first() %></a>         
					<a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_second()%>"> <%=kdto.getKeyword_second() %></a>          
					<a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_third() %>"> <%=kdto.getKeyword_third() %></a>         
					<a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_fourth()%>"><%=kdto.getKeyword_fourth()%></a>        
					<a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_fifth()%>"> <%=kdto.getKeyword_fifth()%></a>
			</h6>
	
			<%} else {%>
			<h2>현재 인기 상품</h2>
			<h6>관심상품 : 
				    <a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_first() %>"><%=kdto.getKeyword_first() %></a>         
					<a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_second()%>"> <%=kdto.getKeyword_second() %></a>          
					<a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_third() %>"> <%=kdto.getKeyword_third() %></a>         
					<a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_fourth()%>"><%=kdto.getKeyword_fourth()%></a>        
					<a href="<%=context%>/goods/goods_list.jsp?keyword_search=<%=kdto.getKeyword_fifth()%>"> <%=kdto.getKeyword_fifth()%></a>
			</h6>
			
			<%}%>

		</div>



<body>
		<div class="gallary">
		
			<%
				for (GoodsDto dto : list) {
			%>
				<div class="gallary-item">
 			<div class="gallary-image">
		 			<a href="goods_content.jsp?goods_no=<%=dto.getGoods_no()%>">
						<img src="download.do?no=<%=fdao.get(dto.getGoods_no())%>" width="200" height="200">
						</a>
						 </div>
						 
						 <div class="gallary-text">
						<h4>
							카테고리 :
							<%=dto.getGoods_category()%></h4>
						<h3>
							제목:<%=dto.getGoods_title()%></h3>
						<h5>
							동네 : <%=kdto.getCustomer_address()%></h5>
						<h3>
							가격 :
							<%=dto.getGoods_price()%></h3>
						<div align="right">
							조회수 :
							<%=dto.getGoods_readcount()%>
							댓글 :
							<%=dto.getGoods_replycount()%>
						</div>
					</div>
					</div>
				</div>
			<%
				}
			%>

		</div>
		<div align="center">
			<a href="goods_write.jsp"> <input class="btn" type="button"
				value="상품 등록하기">
			</a>
		</div>


		<br>

		<div align="right">

			<form action="goods_list.jsp" method="get">

				<select name="type" class="input-item">
					<option value="goods_title">제목</option>
					<option value="goods_category">카테고리</option>
				</select> <input class="input-item" type="search" name="keyword"
					placeholder="검색어" required> <input class="btn"
					type="submit" value="검색">

			</form>


			<!-- 네비게이터 -->
			<div align="center">
				<jsp:include page="/template/navigator.jsp">
					<jsp:param name="pno" value="<%=pno%>" />
					<jsp:param name="count" value="<%=count%>" />
					<jsp:param name="navisize" value="<%=navisize%>" />
					<jsp:param name="pagesize" value="<%=pagesize%>" />
				</jsp:include>
			</div>

		</div>
		<br>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>