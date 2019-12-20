<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<h2>게시글 작성</h2>
	
	
	<form action="write.do" method="post">
<%-- 		<%if(request.getParameter("superno") != null){ %> --%>
<%-- 		<input type="hidden" name="superno" value="<%=request.getParameter("superno")%>"> --%>
<%-- 		<%} %> --%>
	
		<table border="1" width="30%">
			<tr>
				<th>말머리</th>
				<td>
					<select name="head">
						<option value="">선택하세요</option>
						<option>공지</option>
						<option>정보</option>
						
					</select>		
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" required>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" required rows="15" cols="100" 
						style="resize:vertical;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					
				  	<input type="submit" value="등록하기">
					<a href="list.jsp">
						<input type="button" value="목록보기">
					</a>
				</td>
			</tr>
		</table>
		
	</form>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>