<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:include page = "/template/header.jsp"></jsp:include>


<article class="w-40">

	<form action ="change_pw.do" method="post">
		
		<h2>신규 비밀번호 입력</h2>
		<input type="password" name="customer_pw" required>
		<input type="submit" value="확인">
		
	</form>

</article>



<jsp:include page = "/template/header.jsp"></jsp:include>