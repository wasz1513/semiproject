<%@page import="beans.CustomerDto"%>
<%@page import="beans.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String customer_id = (String)session.getAttribute("customer_id");
	CustomerDao dao = new CustomerDao();
	CustomerDto dto = dao.get(customer_id);

%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
    
    <article class ="w-40">
    	
    	<div>
    		
    		<h2><%=dto.getCustomer_name()%>님의 회원 정보</h2>
    		<table>
		<tr>
			<th>아이디</th>
			<td><%=dto.getCustomer_id()%></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=dto.getCustomer_name()%></td>
		</tr>
		<tr>
			<th>등급</th>
			<td><%=dto.getCustomer_grade()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getCustomer_phone()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getCustomer_email()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
			<%=dto.getCustomer_address() %>
			</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getCustomer_joindateWithFormat()%></td>
		</tr>
		<tr>
			<th>최종로그인</th>
			<td><%=dto.getCustomer_lastloginWithFormat()%></td>
		</tr>
	</table>
    		<div>
					<input type="submit" value="수정">	
				</div>
    </div>    
    
    </article>
    
<jsp:include page="/template/footer.jsp"></jsp:include>
    