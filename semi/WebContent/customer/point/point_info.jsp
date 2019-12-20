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
	

	PointDao dao = new PointDao();
	int no = cdto.getCustomer_no();
	List<PointDto> plist = dao.get(no);	
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<script>
function check(){
    // confirm() : 확인창 확인/취소
        var choice = window.confirm("삭제하시겠습니까?");
        console.log(choice);
        if(choice){
        	location.replace="/semi"
        }
    }
</script>
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
<!-- 테스트용 버튼키 -->
<div class="row-multi col-2">
<form action ="point_save.do" method="post">
	<input type="hidden" name="customer_no" value="<%=cdto.getCustomer_no()%>">
	<input type="text" name="point_save" placeholder="적립포인트" required>
	<input type="submit" value="적립하기">
</form>

<form action ="point_use.do" method="post">
	<input type="hidden" name="customer_no" value="<%=cdto.getCustomer_no()%>">
	<input type="text" name="point_use" placeholder="사용포인트" required>
	<input type="submit" value="사용하기">
</form>
</div>
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
		<li>사용가능 쿠폰</li>
		<li><a>10</a>개(필요없으면 삭제 예정임.)</li>
	</ul>
	</div>
</div>


	<%for(PointDto dto : plist){ %>
		<%if(dto.getPoint_save_details() != null){ %>
		<div class="row-multi col-4">
			<div class="point">
				적립
			</div>
			<div>
				<div>적립일자 : <%=dto.getPoint_save_dateWithFormat() %> <br>적립내용 : <%=dto.getPoint_save_details() %> </div>
			</div>
			<div>
			</div>
			<div>
				<div>적립포인트 : <%=dto.getPoint_save() %></div>
				<div><input type="button" value="내역삭제" onclick="check();"></div>
			</div>
		</div>
		<%}else{ %>
		<div class="row-multi col-4">
			<div class="point">
				사용
			</div>
			<div>
				<div>사용일자 : <%=dto.getPoint_use_dateWithFormat() %></div>
				<div>사용내용 : <%=dto.getPoint_use_details() %> </div>
			</div>
			<div>
			</div>
			<div>
				<div>사용포인트 : <%=dto.getPoint_use() %></div>
				<div><input type="button" value="내역삭제"></div>
			</div>
		</div>
		<%} %>
	<%} %>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>