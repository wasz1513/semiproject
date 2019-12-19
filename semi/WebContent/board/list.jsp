
<%@page import="semi.bean.BoardDto"%>
<%@page import="semi.bean.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDao dao = new BoardDao();
List<BoardDto> list = dao.getList();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

	<div align="center">
		
		<h1>  N O T I C E  </h1>
		<br><br>
		 
		<table border="1" width="45%">
			<thead>		
				<tr>
					<th>NO</th>
					<th>HEAD</th>
					<th width="50%">TITLE</th>
					<th>DATE</th>
					<th>WRITER</th>
					<th>READS</th>
				</tr>
			</thead>
			<tbody align="center">
				<%for(BoardDto dto : list){ %>
	                   
	                <tr>
	                    <td><%=dto.getNo()%></td>
	                    
	                    <td>
	                    <font color="Orange">
	                    <%=dto.getHead()%>
	                    </font>
	                    </td>
	                    
	                    <td>
	                   	 	<a href="content.jsp?no=<%=dto.getNo()%>">
	                    		<%=dto.getTitle()%>
	                    	</a>
	                    </td>
	                    
	                    <td><%=dto.getWdate()%></td>
	                    <td><%=dto.getWriter()%></td>
	                    <td><%=dto.getReadcount()%></td>
	                  	                    
	                </tr>
	                    <%
	                      }
	                    %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9" align="right">
						<a href="write.jsp">write</a>
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