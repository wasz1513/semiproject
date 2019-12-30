<%@page import="semi.bean.SessionVisitDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	SessionVisitDao dao = new SessionVisitDao();
	int total = dao.total();
	int today = dao.today();

%>

<article>

	<div class="row-multi rol-5">
		<div>이용현황</div>
		<div>회원리스트</div>
		<div>게시글리스트</div>
		<div>공지</div>
		<div>신고</div>
		<%= total %>
		<%= today %>
	</div>

</article>

<jsp:include page="/template/footer.jsp"></jsp:include>