<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


String go = request.getParameter("go");
%>

<jsp:include page="/template/footer.jsp"></jsp:include>
<form action="check_pw.do" method="post">
	<input type="hidden" name="go" value="<%=go%>">
	<div></div>
	<div></div>
	<div></div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>