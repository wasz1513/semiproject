<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기능 테스트 페이지</title>
</head>
<body>
<h1>기능 테스트 페이지</h1>
<a href="<%=request.getContextPath()%>/customer/change_info.jsp">회원정보 수정</a>
<a href="<%=request.getContextPath()%>/customer/change_pw.jsp">비밀번호 수정</a>
<a href="">회원 탈퇴</a>

</body>
</html>