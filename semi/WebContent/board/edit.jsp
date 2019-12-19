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
	<h2>게시글 수정</h2>

	<form action="edit.do" method="post">
	<input type="hidden" name="no" value="<%=dto.getNo()%>">

		<table border="1" width="70%">
			<caption>
				<tr>
					<th>말머리</th>
					<td>
					<select name="head">
							<option value="">선택하세요</option>
							<option selected>공지</option>
							<option>정보</option>
							</select>
							</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="<%=dto.getTitle()%>" required>
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
			</caption>
		</table>

	</form>


</div>

<jsp:include page="/template/footer.jsp"></jsp:include>