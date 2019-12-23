<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.radio{
	float:left;
}

.date{
	float:left;
}

.date #date1{
	margin-right: 10px;
}

.date > #date1::after{
	 content : "-";
	 width:6px;
	 display:block;
	 position:absolute; 
	background-color : #666;
}


</style>

<jsp:include page="/template/header.jsp"></jsp:include>


<article class="w-40">

	<div>
	
		<h2>주문내역 조회</h2>
		
		<div class="radio">
			<input type ="radio" >
			<label>1주일</label>
			<input type ="radio" >
			<label>1개월</label>
			<input type ="radio">
			<label>3개월</label>
		</div>
		
		<div class="date">
			<input type="text" id="date1">
		</div>
		<div>
			<input type="text"> 
		</div>
		
		<div>
			<select>
				<option value selected="selected">전체 상태</option>
				<option>구매 완료</option>
				<option>입금 예정</option>
				<option>결제 완료</option>
				<option>배송중</option>
				<option>배송 완료</option>
			</select>
		</div>
		
	</div>

</article>













<jsp:include page="/template/footer.jsp"></jsp:include>