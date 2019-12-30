<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String customer_id = request.getParameter("id");
	CustomerDao dao = new CustomerDao();
	CustomerDto dto = dao.get(customer_id);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<style>

.info_wrap{
	margin-bottom: 100px;
}

</style>
<article>
	<div id="info">
	
		<header id="header">
            <h2 class="info_title"><%=dto.getCustomer_name()%>님의 회원 정보</h2>    			
        </header>
        
		<div class="info_wrap">
			
			<table class="info_table">
				<tr>
					<th>아이디</th>
					<td><%=dto.getCustomer_id() %></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=dto.getCustomer_name() %></td>
				</tr>
				<tr>
					<th>등급</th>
					<td><%=dto.getCustomer_grade() %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=dto.getCustomer_phone() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=dto.getCustomer_email() %></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><%=dto.getCustomer_address() %></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><%=dto.getCustomer_joindateWithFormat() %></td>
				</tr>
				<tr>
					<th>최종로그인</th>
					<td><%=dto.getCustomer_lastloginWithFormat() %></td>
				</tr>
			</table>
			
			 <div class="info_btn">                  
             	<a href="list.jsp"><input class="change_info" type="submit" value="회원리스트"></a>
             </div>
		</div>
	</div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>