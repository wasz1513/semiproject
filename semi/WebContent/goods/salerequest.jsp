<%@page import="semi.bean.OrdersDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.OrdersDao"%>
<%@page import="semi.bean.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page = "/template/header.jsp"></jsp:include>

<%
	String customer_id = (String)request.getSession().getAttribute("customer_id");
	GoodsDao gdao = new GoodsDao();
	
	OrdersDao odao = new OrdersDao();
	List<OrdersDto> list = odao.history_salerequest(customer_id);
%>
<style>
.board_list tbody tr td:nth-child(2){
	text-align:center;
}

.salerequest-title{
	margin-top:50px;
}

</style>


<article>

	<div class="row salerequest-title">
		<h2>거래요청</h2>
	</div>

	<div class="board_list_wrap">
		 <table class="board_list">
	                <caption>판매 목록</caption>
	            <thead>	
					<tr>      
	                    <th>제목</th>
	                    <th>구매요청날짜</th>
	                    <th>구매요청인</th>    
	                    <th>가격</th>
	                    <th>판매</th>
	                </tr>
				</thead>
				
				<tbody align="center">					
					<% for(OrdersDto odto : list){ %>
					
						<tr>
							<td>
								<a href="goods_content.jsp?goods_no=<%=odto.getGoods_no()%>">
									<%=odto.getOrders_goods_title() %>
								</a>
							</td>
							<td>
								<%=odto.getOrders_dateWithFormat() %>
							</td>
							<td>
								<a href="#">
									<%=odto.getOrders_goods_buyer() %>
								</a>
							</td>
							<td><%=odto.getGoods_price() %></td>
							<td>
								<a href="orders_success.jsp?no=<%=odto.getOrders_no()%>">
									판매하기
								</a>
							</td>
						</tr>
					
					<%} %>
				</tbody>
		</table>
	</div>
</article>

<jsp:include page = "/template/footer.jsp"></jsp:include>
