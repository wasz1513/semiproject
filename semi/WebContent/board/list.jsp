<%@page import="semi.GoodsDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
GoodsDao dao = new GoodsDao();
List<GoodsDto> list = dao.getList();
%>

<div align="center">
	
	<h2>공지 게시판</h2>
	<br>
	 
	<table border="1" width="90%">
		<thead>		
			<tr>
				<th>NO</th>
				<th width="50%">TITLE</th>
				<th>DATE</th>
				<th>READS</th>
			</tr>
		</thead>
		    	<tbody align="center">
			<%for(GoodsDto dto : list){ %>
                   
                <tr>
                    <td><%=dto.getGOODS_no()%></td>
                    <td><%=dto.getGOODS_title()%></td>
                    <td><%=dto.getGOODS_writetime()%></td>
                    <td><%=dto.getGOODS_readcount()%></td>
                    <td align="left">?</td>
                    
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

</select>
</foam>
</div>
</body>
</html>