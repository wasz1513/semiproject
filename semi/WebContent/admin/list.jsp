<%@page import="semi.bean.CustomerDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<%  
	CustomerDao dao = new CustomerDao();
	List<CustomerDto> list = dao.getList();
%>
<article>
	<div class="row">
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>등급</th>
				<th>포인트</th>
				<th colspan="3">관리메뉴</th>
			</tr>
		</thead>
		<tbody>
			<%for(CustomerDto dto : list){ %>
			<tr>
				<td><%=dto.getCustomer_id() %></td>
				<td><%=dto.getCustomer_nickname()%></td>
				<td><%=dto.getCustomer_name() %></td>
				<td><%=dto.getCustomer_grade() %></td>
				<td>포인트 미구현</td>
				<td>회원정보</td>
				<td>회원탈퇴</td>
				<td>????</td>
			</tr>
			<%} %>
		</tbody>	
	</table>
	</div>


</article>

<jsp:include page="/template/footer.jsp"></jsp:include>