<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("customer_id");
CustomerDao dao = new CustomerDao();
CustomerDto dto = dao.get(id);
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<h1>회원정보 수정</h1>
<form action="change_info.do" method="post">

<!-- get 메소드 추가시 input에 placeholder를 dto.get으로 가져와야함. -->
	<div>
		 아이디 : <%=dto.getCustomer_id() %>
	</div>
	<div>
		 이름 : <%=dto.getCustomer_name() %>
	</div>
	<div>
		닉네임 : <input type="text" name="customer_nickname" value="<%=dto.getCustomer_nickname()%>">
	</div>
	<div>
		폰번호 : <input type="text" name="customer_phone" value="<%=dto.getCustomer_phone() %>">
	</div>
		<div>
		이메일 : <input type="text" name="customer_email" value="<%=dto.getCustomer_email() %>">
	</div>
	<div>
		우편번호 : <input type="text" name="customer_post" value="<%=dto.getCustomer_post() %>">
	</div>
	<div>
		기본주소 : <input type="text" name="customer_basic_address" value="<%=dto.getCustomer_basic_address() %>">
	</div>
	<div>
		상세주소  : <input type="text" name="customer_extra_address" value="<%=dto.getCustomer_extra_address() %>">
	</div>
		<div>
		<input type="reset" value="초기화">
		<input type="submit" value="수정">
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>