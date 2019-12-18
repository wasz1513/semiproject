<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>

<form action="find.do" method="post">
	<article class="w-40">

		<h2>아이디 찾기</h2>
	
		<div>
			<label>이름</label>
			<input type="text" name="customer_name" required>
		</div>
		<div>
			<label>휴대폰번호</label>
			<input type="text"  name ="customer_phone" required>
		</div>
		<div>
			<input type="submit" value="확인">
		</div>


</article>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>