<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
int no= Integer.parseInt((request.getParameter("no"));
GoodsDao dao= new GoodsDao();
GoodsDto dto = dao.get(no);
%> --%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">
<h2>상품등록 상세보기</h2>

<table border="1" width="70%">
<tr>
<td>제목</td>
<%-- <td><%=dto.getTitle() %></td> --%>
</tr>
<tr>
<td>작성자</td>
<%-- <td>작성자<%=dto.getCustomer_no %></td> --%>
</tr> 
<tr height="200">
<td valign="top">내용</td>
<%-- <td valign="top"><%=dto.getContent() %></td> --%>
</tr>
<!-- 댓글 수 조회수 출력줄 -->
<tr>
<td>
댓글수
조회수
</td>
<%-- <td>
댓글수<%=dto.getReplycount() %>
조회수<%=dto.getReadcount() %>

</td> --%>
</tr>
<!-- 댓글 작성칸 -->
<tr align="right">
<form action="reply_insert.do" method="post">


</form>
<td align="right">
<a href="#"><input type="button" value="글쓰기" ></a>
<a href="#"><input type="button" value="댓글쓰기" ></a>
<a href="#"><input type="button" value="수정" ></a>
<a href="#"><input type="button" value="삭제" ></a>
<a href="#"><input type="button" value="목록" ></a>
<a href="#"><input type="button" value="글쓰기" ></a>
</td>
</tr>






</table>
</div>





<jsp:include page="/template/footer.jsp"></jsp:include>