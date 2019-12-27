<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page = "/template/header.jsp"></jsp:include>
    
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String id = (String)session.getAttribute("customer_id");
%>   
 
<article>
    
    
    <div>
    	상품거래정보
    </div>
    
    <div>
    	판매하기
    </div>
    
    
    
    
    
    
    
</article>

<jsp:include page = "/template/footer.jsp"></jsp:include>