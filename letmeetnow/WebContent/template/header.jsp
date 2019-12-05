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
			<tr height="150">
				<td align="center" valign="middle">
					<a href="<%= request.getContextPath() %>">
						<img src="<%= request.getContextPath() %>/image/sample.png">
					</a>
					<a href="<%= request.getContextPath() %>">
						<h3>Sample Main Page</h3>					
					</a>
				</td>
				<td align="center" valign="middle">
					<form action="#" method="get">
						<input type="text" name="?">
						<input type="submit" value="검색">
					</form>
				</td>
				<td align="center" valign="middle">
					<a href="<%= request.getContextPath()%>/nonmember/loginsub.jsp">로그인</a>
				</td>
				<td align="center" valign="middle">
					<a href="#">관심상품</a>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="4">
				
				<jsp:include page="/template/menu.jsp"></jsp:include>
				
				</td>
			</tr>
			<tr height="600">	
				<td align="center" valign="middle" colspan="4">
				