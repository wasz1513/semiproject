<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/regist.css">
<style>
</style> 
<form action="find.do" method="post">
	<article class="w-40">
	<div>
		<div>
		아이디 찾기
		</div>
		<hr>
		<div>
			<label>이름<br></label>
			<input type="text" name="customer_name" required>
		</div>
		<div>
			<label>휴대폰번호<br></label>
			<input type="text"  name ="customer_phone" required>
		</div>
		<div>
			<input type="submit" value="확인">
		</div>
		<div>
			<button class="find_button"><a href="<%=request.getContextPath()%>/customer/login.jsp">로그인</a></button>
		</div>
	</div>
	
</article>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>