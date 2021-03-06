<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.OrdersDto"%>
<%@page import="semi.bean.OrdersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                minDate:moment(new Date()).add(-90, 'days'),//오늘로 부터 90일전부터 선택 가능.     
                // minDate:new Date(),//오늘부터 선택가능
                //날짜 형식 설정
                format:'YYYY-MM-DD',
            };
            var picker = new Lightpick(options);
        }
    </script>
<%
	/****************************************************/
	
	String id = (String)request.getSession().getAttribute("customer_id");
	String bstart = request.getParameter("start");
	String bfinish = request.getParameter("finish");
	String search_date=request.getParameter("search_date");
	List<OrdersDto> list = new ArrayList<>(); 
	OrdersDao dao = new OrdersDao();
	if(request.getParameter("search_date") == null){
		list = dao.history_order_all(bstart, bfinish, id, null);
	}
	else if(request.getParameter("search_date").equals("0")){
		list=dao.history_order_all(id);
	}else{
		search_date = request.getParameter("search_date");
		list = dao.history_order_all(bstart, bfinish, id, search_date);
	}
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
.board_list tbody tr td:nth-child(2){
	text-align:center;
}

.salerequest-title{
	margin-top:50px;
}

.header .searchbar .search_btn > img {
    width: 32px;
    height: 32px;
    position: relative;
    left: -33px;
    left: 450;
    top: -33;
}

</style>
<article>
<div class="row salerequest-title">
	<h2>구매내역 조회</h2>
</div>	
	<div class="row salerequest-title">
	<form action="<%=request.getContextPath() %>/goods/orders_list.jsp">	
		<div class="radio">
			<input id="date_week" type ="radio" name="search_date" value="7">
			<label for="date_week">1주일</label>
			<input id="date_month" type ="radio" name="search_date" value="30">
			<label for="date_month">1개월</label>
			<input id="date_3month" type ="radio" name="search_date" value="90">
			<label for="date_3month">3개월</label>
			<input id="date_whole" type ="radio" name="search_date" value="0">
			<label for="date_whole">전체 보기</label>
		</div>
		<div>
<!-- 			<select> -->
<!-- 				<option selected="selected">전체 상태</option> -->
<!-- 				<option>구매 완료</option> -->
<!-- 				<option>입금 예정</option> -->
<!-- 				<option>결제 완료</option> -->
<!-- 				<option>배송중</option> -->
<!-- 				<option>배송 완료</option> -->
<!-- 			</select> -->
			<input type="text" name="start" placeholder="시작일" id="date1" class="start-date" onclick="loadPicker()">
			<input type="text" name="finish" placeholder="종료일" class="end-date">
			<input type="submit" value="검색"> 
		</div>
	</form>
	</div>
	<!------------------------------------------------------------------->	
		<div class="board_list_wrap">
		 <table class="board_list">
		<%if(search_date!=null){ %>
	                <caption>판매 목록</caption>
	            <thead>	
					<tr>      
	                    <th>주문일자</th>
	                    <th>주문번호</th>
	                    <th>구매제품</th>    
	                    <th>구매가격</th>
	                    <th>판매자명</th>
	                </tr>
				</thead>
				
				<tbody align="center">					
					<% for(OrdersDto dto : list){ %>

						<tr>
							<td>
								<%=dto.getOrders_dateWithFormat() %>
							</td>
							<td>
								<%=dto.getOrders_no() %>	
							</td>
							<td>
								<%=dto.getOrders_goods_title() %>
								
							</td>
							<td>
								<%=dto.getOrders_amount() %>
							</td>
							<td>
								<%=dto.getOrders_goods_seller() %>	
							</td>
						</tr>
					
					<%} %>
				</tbody>
				<%}else{ %>
	                <caption>판매 목록</caption>
	            <thead>	
					<tr>      
	                    <th>주문일자</th>
	                    <th>주문번호</th>
	                    <th>구매제품</th>    
	                    <th>구매가격</th>
	                    <th>판매자명</th>
	                </tr>
				</thead>
				<%} %>
		</table>
	</div>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>