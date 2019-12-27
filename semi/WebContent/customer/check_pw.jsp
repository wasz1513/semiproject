<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String go = request.getParameter("go");
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/check_pw.css">

<div class="check_pw_wrap">

	<h2 class="checkpw_title">비밀번호 확인</h2>	
	<form action="check_pw.do" method ="post">
		<input type="hidden" name="go" value="<%=go%>">	
		<input type="password" name="customer_pw" required>
		<input type="submit" value="확인">	
	</form>
    <%if(request.getParameter("error") != null){ %>
	<h4 class="pwerror"><font color="red">비밀번호가 맞는지 다시 확인 후 입력하세요</font></h4>
	<%} %>

</div>
        
    
<jsp:include page="/template/footer.jsp"></jsp:include>
    
    