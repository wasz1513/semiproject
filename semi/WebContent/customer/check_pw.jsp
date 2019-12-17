<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


String go = request.getParameter("go");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="check_pw.do" method="post">
	<input type="hidden" name="go" value="<%=go%>">
	<div></div>
	<div></div>
	<div></div>
</form>
</body>
</html>