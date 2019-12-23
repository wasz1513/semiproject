<%@page import="semi.bean.BoardDto"%>
<%@page import="semi.bean.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//	페이지 크기
int pagesize = 20;
//	네비게이터 크기
int navsize = 10;
//	페이징 추가
int pno;
try{
	pno = Integer.parseInt(request.getParameter("pno"));
	if(pno <= 0) throw new Exception();
}
catch(Exception e){
	pno = 1;
}
int finish = pno * pagesize;
int start = finish - (pagesize - 1);
String type = request.getParameter("type");
String keyword = request.getParameter("keyword");
boolean isSearch = type != null && keyword != null;
BoardDao dao = new BoardDao();
List<BoardDto> list;
if(isSearch){
	list = dao.search(type, keyword, start, finish); 
}
else{
	list = dao.getList(start, finish);
}
int count = dao.getCount(type, keyword);
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
						<a href="write.jsp">WRITE</a>
					</td>
				</tr>
			</tfoot>
	</table>

	<!-- 네비게이터 -->
							 <div align="center">
   	 <jsp:include page="/template/navigator.jsp">
   	 	<jsp:param name="pno"  value="<%=pno %>" />
   	    <jsp:param name="count"  value="<%=count %>" />
   	    <jsp:param name="navisize"  value="<%=navsize %>" />
   	    <jsp:param name="pagesize" value="<%=pagesize %>" />
   	 </jsp:include>
	

<form action="list.jsp" method="get">
<select name="type">
<option value="title">제목</option>
<option value="writer">작성자</option>
</select>

<input type="search" name="keyword" placeholder="검색어" required>
<input type="submit" value="검색">
</form>

<br><br>
		</div> 

<jsp:include page="/template/footer.jsp"></jsp:include>