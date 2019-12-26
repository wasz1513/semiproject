<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/customer.css">    
<jsp:include page ="/template/header.jsp"></jsp:include>

<form action="login.do" method="post">
<article class="w-30">
<div class="login_total">
	<div class="login_title">
	Member Login
	</div>
	<div>
		<input class="login_id" type="text" name="customer_id" placeholder="ID" required>
	</div>
	<div>
		<input class="login_pw" type="password" name="customer_pw" placeholder="Password" required>
	</div>
	<%if(request.getParameter("error") != null){ %>
	<div class="login_error">
		<!-- error라는 이름의 파라미터가 있다면 오류 메시지를 출력 -->
		<h5><font color="red">입력하신 정보가 일치하지 않습니다</font></h5>
	</div>
	<%} %>	
	<div class="login_check" >
		<label for="check"></label>
		<input type="checkbox" id="check">
		아이디 저장하기
	</div>
	<div>
		<input class="login_button" type="submit" value="Login">
	</div>
	<hr>
	<div class="login_bottom">
		<a id="a" href="find.jsp">아이디 찾기</a>|<a id="b" href="find_pw.jsp">비밀번호 찾기</a>|
		<a id="c" href="regist.jsp">회원가입</a>
	</div>
</div>	

</article>
<div class="login_banner">
	<img src="<%=request.getContextPath()%>/image/login.jpg" width="968px" height="56.6px">
</div>
</form>
<jsp:include page ="/template/footer.jsp"></jsp:include>

