<%@page import="semi.bean.SessionVisitDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SessionVisitDao dao = new SessionVisitDao();
	int total = dao.total();
	int today = dao.today();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>operation</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/test.css">

</head>
<body test>
	<main>
		<header>
			<div>
			</div>
		</header>
	
		<section>
		</section>
	</main>
</body>
</html>