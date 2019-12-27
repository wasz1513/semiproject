<%@page import="semi.bean.OrdersDao"%>
<%@page import="semi.bean.OrdersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("customer_id");
	int no = Integer.parseInt(request.getParameter("no"));
	OrdersDao dao = new OrdersDao();
	OrdersDto dto = dao.getOrder(no);
%>
<jsp:include page = "/template/header.jsp"></jsp:include>

<style>
	.order_table{
		text-align: right;
	}
	.order_table2{
		margin-top:10px;
	}
	.order_table3{
		text-align: left;
	}
	.order_table4{
		margin-top:40px;
		text-align: right;
	}
	.order_table4{
		
		text-align: center;
	}
	.order_table5{
		margin-left:10px;
		padding-left:10px;
		text-align: left;
	}
</style>
<article class="w=60">
	<div>
		<h2 class="order_table4">구매해주셔서 감사합니다.</h2>	
	</div>
	<div class="row-multi">
		<div>
		<img id = "product_sell" src = "../image/pointicon.jpg" width="80px" height="80px">
		</div>
		<div class="order_table5">
		주문일자 : <%=dto.getOrders_date() %><br>
		주문번호 : <%=dto.getOrders_no() %><br>
		상품명 : <%=dto.getOrders_goods_title() %><br>
		상품금액 : <%=dto.getOrders_amount() %><br>
		배송지 : <%=dto.getOrders_basic_address() %> <%=dto.getOrders_extra_address() %> 
		</div>
		<div>
		
		</div>
	</div>
	<div>
		
	</div>
</article>

<jsp:include page = "/template/footer.jsp"></jsp:include>