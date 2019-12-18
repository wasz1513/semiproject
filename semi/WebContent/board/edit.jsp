<%@page import="semi.BoardDto"%>
<%@page import="semi.BoardDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//[1] 번호 받고 [2] 게시글 불러오고 [3] 입력창에 출력
    	int no = Integer.parseInt(request.getParameter("no"));
    	BoardDao dao = new BoardDao();
    	BoardDto dto = dao.get(no);
    %>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<h2>게시글 수정</h2>
	<h5>타인에 대한 비방글은 예고 없이 삭제될 수 있습니다</h5>
	
	<form action="edit.do" method="post">
	
		<!-- 번호는 숨김 처리로 전송 -->
		<input type="hidden" name="no" value="<%=dto.getNo()%>">
	
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
					<input type="text" name="title" value="<%=dto.getTitle()%>" required>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" required rows="15" cols="100" 
						style="resize:vertical;"><%=dto.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
					<a href="list.jsp">
						<input type="button" value="목록보기">
					</a>
				</td>
			</tr>
		</table>
		
	</form>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>