<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	<table border="1" width="1000">
		<tbody>
			<tr>
				<td align="center" valign="middle">
					<a href="<%= request.getContextPath() %>">
						<img src="./image/sample.png">
					</a>
					<br>
					<a href="<%= request.getContextPath() %>">
						<h3>Sample Main Page</h3>					
					</a>
				</td>
			</tr>
			<tr>
				<td align="center">
				
				<jsp:include page="/template/menu.jsp"></jsp:include>
				
				</td>
			</tr>
			<tr>	
				<td align="center" valign="middle">
				