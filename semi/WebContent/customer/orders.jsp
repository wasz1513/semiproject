<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("customer_id");
	CustomerDao dao = new CustomerDao();
	CustomerDto dto = dao.get(id);
	
%>

//주문하기

	public void insertOrder(OrderBean bean){

		try {

			String sql = "insert into webshop_order(product_no, quantity, date, state, id) values(?,?,now(),?,?)";

			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getProduct_no());

			pstmt.setString(2, bean.getQuantity());

			pstmt.setString(3, "1");

			pstmt.setString(4, bean.getId());

			pstmt.executeUpdate();

			

		} catch (Exception e) {

			System.out.println("insertOrder err : " + e);

		} finally {

			try {

				if(rs!=null)rs.close();

				if(pstmt!=null)pstmt.close();

				if(conn!=null)conn.close();

			} catch (Exception e2) {

				// TODO: handle exception

			}

		}

	}



출처: https://sourcestudy.tistory.com/351 [study]

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
<!-- 				</td> -->
<!-- 				<td> -->
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
