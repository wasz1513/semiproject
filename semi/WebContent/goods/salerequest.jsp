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



<article>



	<div class="board_list_wrap">
		 <table class="board_list">
	                <caption>판매 목록</caption>
	            <thead>	
					<tr>      
	                    <th>제목</th>
	                    <th>작성일</th>
	                    <th>구매요청인</th>    
	                    <th>가격</th>
	                </tr>
				</thead>
				
				<tbody align="center">
					
					
					<% for(OrdersDto odto : list){ %>
					
						<tr>
							<td><%=odto.getOrders_goods_title() %></td>
							<td><%=odto.getOrders_date() %></td>
							<td><%=odto.getOrders_goods_buyer() %></td>
							<td><%=odto.getGoods_price() %></td>
						</tr>
					
					<%} %>
				</tbody>
		</table>
	</div>









</article>

<jsp:include page = "/template/footer.jsp"></jsp:include>
