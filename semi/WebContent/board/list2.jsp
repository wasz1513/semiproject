<%@page import="semi.BoardDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDao dao = new BoardDao();
List<BoardDto> list2 = dao.getList();
%>


<jsp:include page="/template/header.jsp"></jsp:include>

	<div align="center">
		
		<h1>-  공지사항  -</h1>
		<br><br>
		 
		<table border="1" width="90%">
			<thead>		
				<tr>
					<th>NO</th>
					<th>HEAD</th>
					<th width="50%">TITLE</th>
					<th>DATE</th>
					<th>READS</th>
				</tr>
			</thead>
			<tbody align="center">
				<%for(BoardDto dto : list2){ %>
	                   
	                <tr>
	                    <td><%=dto.getNo()%></td>
	                    <td><%=dto.getHead()%></td>
	                    <td><%=dto.getTitle()%></td>
	                    <td><%=dto.getWdate()%></td>
	                    <td><%=dto.getReadcount()%></td>
	                  	                    
	                </tr>
	                    <%
	                      }
	                    %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9" align="right">
						<a href="write.jsp">글쓰기</a>
					</td>
				</tr>
			</tfoot>
	</table>
	<h4>[이전] 1 2 3 4 5 6 7 8 9 10 [다음]</h4>
	
<foam action="list.jsp" method="get">

<select name="type">
<option value="title">제목</option>
<option value="writer">작성자<option>
</select>

<input type="search" name="keyword" placeholder="검색어" required>
<input type="submit" value="검색">
<br><br>
		</div> 

<jsp:include page="/template/footer.jsp"></jsp:include>