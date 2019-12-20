<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.CustomerDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.PointDto"%>
<%@page import="semi.bean.PointDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("customer_id");
	CustomerDao cdao = new CustomerDao();
	CustomerDto cdto = cdao.get(id);
	
	PointDto dto = new PointDto();
	PointDao dao = new PointDao();
	List<PointDto> list = dao.getList();
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
	.point{
		margin-top:10px;
	}
	ul{
		list-style-type : none;
		text-align : left;
	}
</style>

<!--  -->
<article>
<div class="row-multi col-3">
	<div>
	<ul>
		<li>보유포인트</li>
		<li><img src="<%=request.getContextPath()%>/image/pointicon.jpg"><%=cdto.getCustomer_point() %>Point</li>
	</ul>
	</div>
	<div>
	<ul>
		<li>회원 등급</li>
		<li>
		<%if(cdto.getCustomer_grade().equals("오렌지")){ %>
				<img src="<%=request.getContextPath()%>/image/grade/orange2.jpg" width = "40px" height="40px">
		<%}else if(cdto.getCustomer_grade().equals("브론즈")){ %>
				<img src="<%=request.getContextPath()%>/image/grade/bronze.jpg" width = "40px" height="40px">
		<%}else if(cdto.getCustomer_grade().equals("실버")){ %>
				<img src="<%=request.getContextPath()%>/image/grade/silver.png" width = "40px" height="40px">
		<%}else if(cdto.getCustomer_grade().equals("골드")){ %>
				<img src="<%=request.getContextPath()%>/image/grade/gold.png" width = "40px" height="40px">
		<%}else{ %>
				<img src="<%=request.getContextPath()%>/image/grade/administrator.jpg" width = "40px" height="40px">
		<%} %>
		<%=cdto.getCustomer_grade() %></li>
	</ul>
	</div>
	<div>
	<ul>
		<li>보유포인트</li>
		<li><img src="<%=request.getContextPath()%>/image/pointicon.jpg"><%=cdto.getCustomer_point() %>Point</li>
	</ul>
	</div>
</div>

	<div class="row-multi col-4">
		<div class="point">
			적립
		</div>
		<div>
			<div>적립일자 : <br>적립내용 : </div>
		</div>
		<div>
		</div>
		<div>
			<div>적립포인트</div>
			<div>내역삭제</div>
		</div>
	</div>
	<div class="row-multi col-4">
		<div class="point">
			사용
		</div>
		<div>
			<div>사용일자</div>
			<div>사용내용</div>
		</div>
		<div>
		</div>
		<div>
			<div>사용포인트</div>
			<div>내역삭제</div>
		</div>
	</div>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>