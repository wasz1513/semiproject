<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<h2>게시글 작성</h2>
	<h5>타인에 대한 비방글은 예고 없이 삭제될 수 있습니다</h5>
	
	<form action="write.do" method="post">
		<%if(request.getParameter("superno") != null){ %>
		<!-- 답변글일 경우에는 no가 있기 때문에 등록시 사용하도록 숨김 첨부해야한다 -->
		<input type="hidden" name="superno" value="<%=request.getParameter("superno")%>">
		<%} %>
	
		<table border="1" width="70%">
			<tr>
				<th>말머리</th>
				<td>
					<select name="head">
						<option value="">선택하세요</option>
						<option>공지</option>
						
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