<%@page import="semi.bean.CustomerDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<%  
	CustomerDao dao = new CustomerDao();
	
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	boolean isSearch = type!=null && keyword!=null;
	List<CustomerDto> list;
	
	
	int pagesize = 10;
	int navsize = 10;
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno <= 0) throw new Exception();
	}
	catch(Exception e){
		pno = 1;
	}
	
	int finish = pno * pagesize;
	int start = finish - (pagesize - 1);
	
	int count = dao.getCount(type, keyword);
	
	if(isSearch){
		list = dao.search(type, keyword, start, finish);
	}else{
		list = dao.getList();
	}
%>
<article>
	<div class="row">
	
	<form action="list.jsp" method="get">
		<div class="w-50">
			<div class="row-multi col3">
				<div>
					<select name="type">
						<option value="customer_id">아이디</option>
						<option value="customer_name">이름</option>
						<option value="customer_grade">회원등급</option>
					</select>
				</div>
				<div>
					<input type="text" name="keyword" <% if(keyword!=null)%>value="<%=keyword%>">
				</div>
				<div>
					<input type="submit" value="검색">
				</div>
			</div>
		</div>
	</form>
	
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
				<td><%=dto.getCustomer_point() %></td>
				<td><a href="info.jsp?id=<%=dto.getCustomer_id()%>">회원정보</a></td>
				<td><a href="out.do?id=<%=dto.getCustomer_id()%>">회원탈퇴</a></td>
				<td>????</td>
			</tr>
			<%} %>
		</tbody>	
	</table>
	
	<div class="w-50">
		<jsp:include page="/template/adminlistnav.jsp">
			<jsp:param name="pno" value="<%=pno%>"/>
			<jsp:param name="count" value="<%=count%>"/>
			<jsp:param name="navsize" value="<%=navsize%>"/>
			<jsp:param name="pagesize" value="<%=pagesize%>"/>
		</jsp:include>
	</div>
	
	</div>

</article>

<jsp:include page="/template/footer.jsp"></jsp:include>