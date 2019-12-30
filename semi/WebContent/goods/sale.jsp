<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.OrdersDto"%>
<%@page import="semi.bean.OrdersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page = "/template/header.jsp"></jsp:include>
    
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String id = (String)session.getAttribute("customer_id");
	
	OrdersDao odao = new OrdersDao();
	OrdersDto odto = odao.getOrder(no);
	
	CustomerDao cdao = new CustomerDao();
	CustomerDto cdto = cdao.get(odto.getOrders_goods_buyer());
	
%>   

<style>
	.info_table{
		border-bottom:1px solid black;
	}	
</style>
 
<article>
    
    <div id="info">
    
	    <header id="header">
            <h2 class="info_title"><%=odto.getOrders_goods_title()%> 거래정보</h2>    			
        </header>
	    
	   
	    <div class="info_wrap">
	        <table  class="info_table">
	        	<tr>
	        		<th rowspan="3">구매자정보</th>
	        		<th>아이디</th>
	        		<td><%=odto.getOrders_goods_buyer() %></td>
	        	</tr>
	        	<tr>
	        		<th>회원등급</th>
	        		<td><%=cdto.getCustomer_grade() %></td>
	        	</tr>
	        	<tr>
	        		<th>연락처</th>
	        		<td><%=cdto.getCustomer_phone() %></td>
	        	</tr>
	        </table>
	        
        
	        <table class="info_table">
	        	<tr>
	        		<th rowspan="5">상품정보</th>
	        		<th>상품제목</th>
	        		<td><%=odto.getOrders_goods_title() %></td>
	        	</tr>
	        	<tr>
	        		<th>첨부파일</th>
	        		<td><img src="../download.do?goods_no=<%=odto.getGoods_no()%>"></td>
	        	</tr>
	        	<tr>
	        		<th>거래방법</th>
	        		<td>
	        			<%=odto.getOrders_type() %>
	        			<br>
	        			<%=odto.getOrders_payment() %>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>거래주소</th>
	        		<td>
	        			<%=odto.getOrders_post() %>
	        			<br>
	        			<%=odto.getOrders_basic_address() %>
	        			<br>
	        			<%=odto.getOrders_extra_address() %>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>거래가격</th>
	        		<td><%=odto.getOrders_amount()%> 원 </td>
	        	</tr>
	        </table>
	    </div>
        
	    <div class="info_btn">
	    	<form action="sale.do" method="post">
	    		<input type="hidden" name="goods_no" value="<%=odto.getGoods_no()%>">
		    	<input type="submit" value="판매하기" class="withdraw">
		   	</form>
	    </div>
    
    </div>
    
</article>

<jsp:include page = "/template/footer.jsp"></jsp:include>