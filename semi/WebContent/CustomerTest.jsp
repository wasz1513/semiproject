<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<h1>기능 테스트 페이지</h1>
<a href="<%=request.getContextPath()%>/customer/change_info.jsp">회원정보 수정</a>
<a href="<%=request.getContextPath()%>/customer/change_pw.jsp">비밀번호 수정</a>
<a href="">회원 탈퇴</a>
<jsp:include page="/template/footer.jsp"></jsp:include>