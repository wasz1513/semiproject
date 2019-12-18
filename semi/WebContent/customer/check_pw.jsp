<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String go = request.getParameter("go");
%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
    
    
     <div align="center">
    	
    	<h2>비밀번호 확인</h2>
    	
    	<form action="check_pw.do" method="post">
    			<input type="hidden" name = "go" value="<%=go%>">
		    	<input type = "password"  name="customer_pw" required>
    			<input type = "submit" value="확인">
    	</form>
    
    </div>
    
        
    
<jsp:include page="/template/footer.jsp"></jsp:include>
    
    