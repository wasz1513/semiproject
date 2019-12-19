<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page ="/template/header.jsp"></jsp:include>



<form action="login.do" method="post">


<article class="w-40">

	<div>
		<h2>로그인</h2>
	</div>
	<div>
		<input type="text" name="customer_id" placeholder="ID" required>
	</div>
	<div>
		<input type="password" name="customer_pw" placeholder="Password" required>
	</div>
	<div>
		<input type="checkbox">
		아이디 저장하기
	</div>
	<div>
		<input type="submit" value="Login">
	</div>
	<div>
		<a href="find.jsp">아이디 찾기</a>/<a href="find_pw.jsp">비밀번호 찾기</a>
		<a href="regist.jsp">회원가입</a>
	</div>

<%if(request.getParameter("error") != null){ %>
	<div>
		<!-- error라는 이름의 파라미터가 있다면 오류 메시지를 출력 -->
		<h5><font color="red">입력하신 정보가 일치하지 않습니다</font></h5>
	</div>
	<%} %>	
	
</article>

</form>




	





<jsp:include page ="/template/footer.jsp"></jsp:include>


