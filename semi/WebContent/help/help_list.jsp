<%@page import="semi.bean.HelpDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.HelpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="/template/header.jsp"></jsp:include>
 
  <%
  	//dao가져오기
	String write=(String)request.getSession().getAttribute("customer_id");
  	HelpDao dao=new HelpDao();
    List<HelpDto>list=dao.getList(write);
    %>
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

<title>신고/문의하기</title>
		<div align="center" >
		<div class="row row-multi col-2" >
			<a href="help_write.jsp">
				<input type="button" style="WIDTH: 300pt; HEIGHT: 44pt" value="1:1상담하기">
				</a> 
			<a href="help_list.jsp">
				<input type="button" style="WIDTH: 300pt; HEIGHT: 44pt" value="문의/신고내역">
				</a> 
			</div>
		   <h2>문의/신고 내역</h2>
		   <h5>※ 신고/문의내용에 욕설, 성희롱 등의 내용이 포함된 경우 상담이 제한될 수 있습니다.</h5>
		
			
		<table border="1" width="90%">
			<thead>
				<tr>
					<th width="5%">번호</th>
					<th>날짜</th>
					<th>유형</th>
					<th width="70%">내용</th>
				</tr>
			</thead>
			<tbody align="center">
			<%for(HelpDto dto : list){ %>
		  	<tr>
				<td><%=dto.getBoard_NO()%></td>
				<td><%=dto.getHdate()%></td>
				<td><%=dto.getHead()%></td>
				<td align="left"><%=dto.getContent()%></td>
					
			</tr>
			<%} %>
			</tbody>
		</table>
		
		
			</div>
			
			



<jsp:include page="/template/footer.jsp"></jsp:include>
