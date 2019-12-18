<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String customer_id = request.getParameter("id");
	CustomerDao dao = new CustomerDao();
	CustomerDto dto = dao.get(customer_id);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<article>
	<div class="row">
		<div class="w-60">
			
			<div><%=customer_id%></div>
			<div class="row-multi col-2">
				<div>아이디</div>
				<div></div>
			</div>
			<div class="row-multi col-2">
				<div>이름</div>
				<div></div>
			</div>
			<div class="row-multi col-2">
				<div>등급</div>
				<div></div>
			</div>
			<div class="row-multi col-2">
				<div>전화번호</div>
				<div></div>
			</div>
			<div class="row-multi col-2">
				<div>이메일</div>
				<div></div>
			</div>
			<div class="row-multi col-2">
				<div>주소</div>
				<div></div>
			</div>
			<div class="row-multi col-2">
				<div>가입일</div>
				<div></div>
			</div>
			<div class="row-multi col-2">
				<div>최종로그인</div>
				<div></div>
			</div>
		
		</div>
	</div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>