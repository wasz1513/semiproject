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
 
 <h2> 게시글 보기</h2>
 
 <table border="1"width="70%">
 <tr>
 <td><%=dto.getTitle()%></td>
  </tr>
 <tr>
 <td><%=dto.getWriter()%></td>
 </tr>
 <tr height="200">
 <td valign="top">
 <%=dto.getContent()%>
 </td>
 </tr>
 <tr>
 <td>
 댓글수  <%=dto.getReplycount()%>
 조회수 <%=dto.getReadcount()%>
 </td>
 </tr>
 <tr>
  <td align="right">
  <a href="write.jsp"><input type="button"value="글쓰기">
  <a href="#"><input type="button"value="답글쓰기">
  <a href="edit.jsp?no=<%=dto.getNo()%>"><input type="button"value="수정">
  <a href="delete.do?no=<%=dto.getNo()%>"><input type="button"value="삭제">
  <a href="list.jsp"><input type="button"value="목록">
  
    </td>
   </tr>
   
 </table>
  
 </div>
 <jsp:include page="/template/footer.jsp"></jsp:include>