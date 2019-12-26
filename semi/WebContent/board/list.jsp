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


    <div class="title">
        <br><br><br>
    <p class="maintitle">공지사항</p>
    <p class="subtitle">당근나라의 다양한 소식을 전해드립니다.</p>
  </div>
		 
 <div class="board_list_wrap">
            <table class="board_list">
                <caption>게시판 목록</caption>
                <thead>	
				<tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>글쓴이</th>    
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
	                    	<%if(dto.getReplycount() > 0){ %>
	                    	<font color="red">
	                    	[<%=dto.getReplycount()%>]
	                    	</font>
	                    </td>
	                    <%} %>
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
<form action="list.jsp" method="get">

<select class="search-drop" name="type">
	<option value="title">제목</option>
	<option value="writer">작성자</option>
</select>

<input class="search-txt" type="search" name="keyword" placeholder="검색어" required>
<input class="search-bt" type="submit" value="검색">
</form>
	<div class="paging">
           
   	 <jsp:include page="/template/navigator.jsp">
   	 	<jsp:param name="pno"  value="<%=pno %>" />
   	    <jsp:param name="count"  value="<%=count %>" />
   	    <jsp:param name="navisize"  value="<%=navsize %>" />
   	    <jsp:param name="pagesize" value="<%=pagesize %>" />
   	 </jsp:include>
   	</div>
   	 
	





    

<jsp:include page="/template/footer.jsp"></jsp:include>