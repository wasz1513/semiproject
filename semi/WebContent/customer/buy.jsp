<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("customer_id");
	CustomerDao dao = new CustomerDao();
	CustomerDto dto = dao.get(id);
	
%>


<jsp:include page = "/template/header.jsp"></jsp:include>


<article class="w-50">
	<form>
	
	<table>
		<thead>
			<tr>
				<th>상품정보</th>			
				<th>판매자</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
<%-- 					<%=dto.getGoods_title()%> --%>
				</td>
				<td>
<%-- 					<%=dto.getBuy_goods_seller()%> --%>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div>
		<h5>배송지 정보</h5>
		<input type ="radio" >
		<label>직거래</label>
		<div>
			<ul>
				<li>
					<input type ="radio" >
					<label><%=dto.getCustomer_address() %></label>
				</li>
				<li>
					<input type ="radio" >
					<label>신규배송지</label>
				</li>
			</ul>
		</div>	
	</div>
	
	<div>
		<h5>결제 방법</h5>	
		<input type="radio">
		<label>신용카드</label>
		<input type="radio">
		<label>실시간 계좌이체</label>
		<input type="radio">
		<label>무통장 입금</label>
		<input type="radio">
		<label>만나서 결제</label>
	</div>
	<div>
		<h5>최종 결제 금액</h5>
		<input type="text">원
	</div>
	
	
	</form>

</article>











<jsp:include page = "/template/footer.jsp"></jsp:include>
