<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
//     String random = request.getParameter("encrypte");
    String random = (String)request.getSession().getAttribute("temp_pw");
	request.getSession().removeAttribute("temp_pw");
    %>
<jsp:include page="/template/header.jsp"></jsp:include>
<h3>임시로 발급된 비밀번호는 "<font color="red"><%=random %></font>" 입니다.</h3>
<form action="<%=request.getContextPath() %>/customer/temp_pw.jsp" method="post">
	<input type="hidden" name=customer_pw value=<%=random %>>
</form>
<h3><a href="<%=request.getContextPath()%>">홈으로</a></h3>
<jsp:include page="/template/footer.jsp"></jsp:include>