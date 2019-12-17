<%@page import="beans.CustomerDto"%>
<%@page import="beans.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String id = (String)session.getAttribute("customer_id");
	CustomerDao dao = new CustomerDao();
	CustomerDto dto = dao.get(id);

%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
    
    <article class ="w-40">
    	
    	<div>
    		
    		<h2>회원 정보</h2>
    		<div>
    			<h4></h4>
    		</div>
    		
    		
    	</div>    
    
    </article>
    
<jsp:include page="/template/footer.jsp"></jsp:include>
    