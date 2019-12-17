<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<h1> 비밀번호 변경</h1>
<form action="change_pw.do" method="post">
<input type="password" name="customer_pw" required>
<input type="submit" value="확인">
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>