<%@page import="semi.bean.BoardDto"%>
<%@page import="semi.bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int no =Integer.parseInt(request.getParameter("no"));
BoardDao dao = new BoardDao();
BoardDto dto = dao.get(no);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
 <div class="board_edit">
             <table class="board_edit">	
	<h2>게시글 수정</h2>

	<form action="edit.do" method="post">
	<input type="hidden" name="no" value="<%=no%>">

		<table border="1" width="30%">
			
				
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" style="width:350px" value="<%=dto.getTitle()%>" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea name="content" required rows="15"
					cols="100" style="resize:vertical"><%=dto.getContent()%></textarea>'
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit"value="등록하기">
					 <a href="list.jsp"> </a> 
			
		</table>

	</form>
</table>
</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>