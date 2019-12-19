<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<div align="center">
	
	<h2>공지 게시판</h2>
	<br>
	 
	<table border="1" width="90%">
		<thead>
			<tr>
				<th>NO</th>
				<th>HEAD</th>
				<th width="50%">TITLE</th>
				<th>WRITER</th>
				<th>DATE</th>
				<th>READS</th>
			</tr>
		</thead>
		    	<tbody align="center">
			 <%
                   for (int i = 1; i <= 20; i++) {
                     %>
                <tr>
                  <%
                   for (int j = 2; j <= 7; j++) {
                   %>
                    <td>?</td>
                    <%
                        }
                    %>
                </tr>
                    <%
                        }
                    %>
                
                   
                   
</thead>
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