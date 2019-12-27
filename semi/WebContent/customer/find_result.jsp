<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String customer_id = request.getParameter("customer_id");
%>


<jsp:include page="/template/header.jsp"></jsp:include>


<div class="idfind_result_wrap">

<%
	if (customer_id != null) {
%>

<h2 class="idfind_result_title">
	아이디는 <span><%=customer_id%></span>입니다
</h2>
<h3>
	<a href="login.jsp">로그인 하러가기</a>
</h3>
<%} else {%>

<h2  class="idfind_result_title">입력하신 정보에 해당하는 회원이 없습니다</h2>
<h3>
	<a href="find.jsp">다시 입력하기</a>
</h3>
<%}%>

</div>



<jsp:include page="/template/footer.jsp"></jsp:include>