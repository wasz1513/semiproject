<%@page import="semi.bean.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="java.awt.PageAttributes.OriginType"%>
<%@page import="semi.bean.ReplyDao"%>
<%@page import="semi.bean.BoardDto"%>
<%@page import="semi.bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao bdao = new BoardDao();
	BoardDto bdto = bdao.get(no);
	bdao.cu(no);
%>


<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<h2>게시글 보기</h2>

	<table border="1" width="70%">
		<tr>
			<td><%=bdto.getTitle()%></td>
		</tr>
		<tr>
			<td><%=bdto.getWriter()%></td>
		</tr>
		<tr height="200">
			<td valign="top"><%=bdto.getContent()%></td>
		</tr>
		<tr>
			<td align="right">댓글수 <%=bdto.getReplycount()%> 조회수 <%=bdto.getReadcount()%>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<a href="write.jsp">
					<input type="button" value="글쓰기">
				</a>
				<a href="edit.jsp?no=<%=no%>">
					<input	type="button" value="수정">
				</a> 
				<a href="delete.do?no=<%=no%>">
					<input type="button" value="삭제">
				</a>
				<a href="list.jsp">
					<input type="button" value="목록">
				</a>
			</td>
		</tr>
	<!-- 댓글 작성 -->
		<tr>
			<td align="right">
			
			<form action="reply_insert.do" method="post">
			
<!-- 			게시글번호 -->
			<input type="hidden" name="origin" value="<%=no%>">
			
			<textarea name="content" rows="4" cols="215" required></textarea>
			
			<input type="submit" value="댓글등록">
			
			
			</form>
			
			</td>
		</tr>
		
	<!-- 댓글 목록  -->
	<%
	ReplyDao rdao = new ReplyDao();
	List<ReplyDto>list = rdao.getList(no);
	%>
    <tr>
    <td>
    <table border="1" width="100%">
    <%for(ReplyDto rdto : list){ %>
    <tr>
    <th width="100">
    <img src="http://placehold.it/100x100">
    </th>
    <td>
    	<%=rdto.getWriter()%>
    	<%=rdto.getWdate()%>
    	답글    	
    	<br><br>
    	<%=rdto.getContent()%>
    	</td>
    	</tr>
    	<%} %>
    	</table>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>