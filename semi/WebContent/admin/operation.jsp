<%@page import="semi.bean.SessionVisitDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	SessionVisitDao dao = new SessionVisitDao();
	int total = dao.total();
	int today = dao.today();

%>
