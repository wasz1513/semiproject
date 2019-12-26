<%@page import="semi.bean.BoardDto"%>
<%@page import="semi.bean.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//	페이지 크기
int pagesize = 10;
//	네비게이터 크기
int navsize = 5;
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
			
			  <title>게시판 목록</title>

    <br><br><br>
    <div class="title">
        <br><br><br>
    <h2 align=center style="color:#444040">공지사항</h2>
  </div>
		 
 <div class="board_list_wrap">
            <table class="board_list">
                <caption>게시판 목록</caption>
                <thead>	
				<tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>작성일</th>    
                    <th>조회</th>
                </tr>
			</thead>
			<tbody align="center">
				<%for(BoardDto dto : list){ %>
	                   
	                <tr>
	                    <td><%=dto.getNo()%></td>
	                    
	                   
	                    
	                    <td>
	                   	 	<a href="content.jsp?no=<%=dto.getNo()%>">
	                    		<%=dto.getTitle()%>
	                    	</a>
	                    	[<%=dto.getReplycount()%>]
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
				
			</tfoot>
	</table>
	<div class="write" align=right>
                <a href="write.jsp" class="bt">글작성</a>
            </div>

	<!-- 네비게이터 -->
							<div class="paging">
            <a href="#" class="bt">이전 페이지</a>
            <a href="#" class="num on">1</a>
            <a href="#" class="num">2</a>
            <a href="#" class="num">3</a>
            <a href="#" class="bt">다음 페이지</a>
        
   	 <jsp:include page="/template/navigator.jsp">
   	 	<jsp:param name="pno"  value="<%=pno %>" />
   	    <jsp:param name="count"  value="<%=count %>" />
   	    <jsp:param name="navisize"  value="<%=navsize %>" />
   	    <jsp:param name="pagesize" value="<%=pagesize %>" />
   	 </jsp:include>
   	</div>
   	 
	

<form action="list.jsp" method="get">

<select name="type">
<option value="title">제목</option>
<option value="writer">작성자</option>
</select>

<input type="search" name="keyword" placeholder="검색어" required>
<input type="submit" value="검색">
</form>




    

<jsp:include page="/template/footer.jsp"></jsp:include>