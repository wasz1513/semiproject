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
	
%>   
 
<article>
    
    <div>
    
	    <div>
	    	상품거래정보 출력
	    </div>
	    
	    <div>
	    	구매자정보 출력
	    </div>
	    
	    <div>
	    	<form action="sale.do" method="post">
	    		<input type="hidden" name="goods_no" value="<%=odto.getGoods_no()%>">
		    	<input type="submit" value="판매하기">
		   	</form>
	    </div>
    
    </div>
    
</article>

<jsp:include page = "/template/footer.jsp"></jsp:include>