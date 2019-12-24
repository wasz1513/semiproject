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

<!-- 날짜선택기 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/date.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/date2.js"></script>
    <script>
        function loadPicker(){
            var options = {
                //날짜가 입력될 첫 번째 칸 설정
                field:document.querySelector(".start-date"),
                //날짜가 입력될 두 번째 칸 설정
                secondField:document.querySelector(".end-date"),
                //표시될 월의 개수를 설정
                numberOfMonths:2,
                //날짜 선택이 아닌 범위 선택으로 설정
                singleDate:false,
                //최초 선택일 이후로만 종료일을 선택하도록 설정
                selectForward:true,
                //날짜 구분자 설정
                seperator:'-',
                //문서 내에 표시되도록 설정
                // inline:true,
                //선택 시작일 설정(현재일로 설정하거나 'YYYY-MM-DD' 형태로 설정)
                minDate:moment(new Date()).add(1, 'days'),//내일부터 선택 가능
                // minDate:new Date(),//오늘부터 선택가능
                //날짜 형식 설정
                format:'YYYY-MM-DD',
            };
            var picker = new Lightpick(options);
        }
    </script>

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
			<input type="text" id="date1" class="start-date" onclick="loadPicker()">
		</div>
		<div>
			<input type="text" class="end-date"> 
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