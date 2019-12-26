<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:include page = "/template/header.jsp"></jsp:include>




<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/check_pw.css">

<div class="check_pw_wrap">

	<h2 class="checkpw_title">신규 비밀번호 입력</h2>	
	<form action="change_pw.do" method ="post">	
		<input type="password" name="customer_pw" required>
		<input type="submit" value="확인">	
	</form>


</div>
        
    



<jsp:include page = "/template/footer.jsp"></jsp:include>