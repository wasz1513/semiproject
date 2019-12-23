<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>
<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("customer_id");

	CustomerDao cdao = new CustomerDao();
	CustomerDto cdto = cdao.get(id);
	
	GoodsDao gdao = new GoodsDao();
	int goods_no = 0;
	gdao.get(goods_no);
	GoodsDto gdto = gdao.get(goods_no);

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
					<%=gdto.getGoods_title()%>
				</td>
				<td>
					<%=gdto.getCustomer_id()%>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div>
		<h5>배송지 정보</h5>
		<input type ="radio" >
		<label>직거래</label>
		<input type ="radio" >
		<label>배송</label>
		<div>
			<ul>
				<li>
					<label>우편번호</label>
					<input type ="text" value="<%=cdto.getCustomer_post()%>" >
				</li>
				<li>
					<label>기본주소</label>
					<input type ="text"  value="<%=cdto.getCustomer_basic_address()%>">
				</li>
				<li>
					<label>상세주소</label>
					<input type ="text"  value="<%=cdto.getCustomer_extra_address()%>">
				</li>
<!-- 				<li> -->
<!-- 					<input type ="radio" > -->
<!-- 					<label>신규배송지</label> -->
<!-- 				</li> -->
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
		<input type="text" value="<%=gdto.getGoods_price() %>">원
	</div>
	
	
	</form>

</article>











<jsp:include page = "/template/footer.jsp"></jsp:include>
