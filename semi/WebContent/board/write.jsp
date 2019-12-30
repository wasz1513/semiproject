<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<br>
	<h2 style="font-size:20px;">게시글 작성</h2>
	<br><br>
	
	<form action="write.do" method="post">
<%-- 		<%if(request.getParameter("superno") != null){ %> --%>
<%-- 		<input type="hidden" name="superno" value="<%=request.getParameter("superno")%>"> --%>
<%-- 		<%} %> --%>
	
		<table border="1" width="40%">
			<div class="board_write_wrap">
            <table class="board_write">	
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" style="width:400px;" required>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" required rows="20" cols="100" 
						style="resize:vertical;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					
				  	<input type="submit" value="등록" style="height:30px; width:50px;">
					<a href="list.jsp">
						<input type="button" value="목록" style="height:30px; width:50px;">
					</a>
					
				</td>
			</tr>
		</table>
		</div>
	</form>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>