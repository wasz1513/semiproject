<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String error = request.getParameter("error");
    
    %>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="find_pw.do" method="post">
<h1>비밀번호 찾기</h1>
<h4>핸드폰 번호로 찾기</h4>
	<div>
		이름 : <input type="text" name="customer_name" required>
	</div>
	<div>
		아이디 : <input type="text" name="customer_id" required>
	</div>
	<div>
		핸드폰 번호 : <input type="text" name="customer_phone" required>
	</div>
		<input type="submit" value="찾기">
</form>

<form action="find_pw.do" method="post">
<h4>이메일로 찾기</h4>
	<div>
		이름 : <input type="text" name="customer_name" required>
	</div>
	<div>
		아이디 : <input type="text" name="customer_id" required>
	</div>
	<div>
		이메일 : <input type="email" name="customer_email" required>
	</div>
	<input type="submit" value="찾기">
</form>
	<%if(error!=null){ %>
		<h4><font color = "red"> 입력하신 정보가 일치하지 않습니다.</font></h4>
		<%} %>
<jsp:include page="/template/footer.jsp"></jsp:include>