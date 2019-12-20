<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<% String customer_id = (String)session.getAttribute("customer_id");
			CustomerDao cdao = new CustomerDao();
			CustomerDto cdto = cdao.get(customer_id);
			int cno = cdto.getCustomer_no();%>
			
			
<jsp:include page="/template/header.jsp"></jsp:include>


<div align="center">



<style>
.row.row-multi::after {
	content: "";
	display: block;
	clear: both;
}

.row.row-multi>* {
	float: left;
}

.row.row-multi.col-2>* {
	width: 50%
}

.row.row-multi.col-3>* {
	width: 33.3333%
}

.row.row-multi.col-4>* {
	width: 25%
}

.row.row-multi.col-5>* {
	width: 20%
}
</style>




<form action="write.do" method="post">
<input type="hidden" id="customer_id" value="customrt_jd">
		<title>신고/문의하기</title>
		<div align="center" >
		<div class="row row-multi col-2" >
			<a href="write.jsp">
				<input type="button" style="WIDTH: 300pt; HEIGHT: 44pt" value="1:1상담하기">
				</a> 
			<a href="list.jsp">
				<input type="button" style="WIDTH: 300pt; HEIGHT: 44pt" value="문의/신고내역">
				</a> 
			</div>
		   <h2>문의/신고 하기</h2>
		   <h5>※ 신고/문의내용에 욕설, 성희롱 등의 내용이 포함된 경우 상담이 제한될 수 있습니다.</h5>
			
			<br>
		
			<div class="row row-multi col-2">
				<div>문의/신고</div>
				<div>
					<select name="head">
						<option class="row-multi col5" value="">선택하세요</option>
						<option>거래신고</option>
						<option>서비스장애</option>
					</select>
				</div>
			</div>
		
			<div>
			
				<textarea name="content" required rows="20" cols="100"
					style="resize: vertical;"></textarea>
			</div>



			<div class="row row-multi col-2">
			<div align="left">
				<input type="button" value="사진 첨부하기">
			</div>
			
			<div align="right">
				<input type="submit" value="1:1상담하기">
				 <a href="list.jsp"> </a> 
			</div>
			</div>



				</form>
		</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
