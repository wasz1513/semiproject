<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<% 
int no= Integer.parseInt((request.getParameter("no"))); 
 GoodsDao goodsdao= new GoodsDao(); 
 goodsdao.readcountupdate(); //조회수 증가
 GoodsDto goodsdto = goodsdao.get(no); //게시글 불러오기
%>


<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">
	<h2>상품등록 상세보기</h2>

	<table border="1" width="70%">
		<tr>
			<td>제목</td>
			<td><%=goodsdto.getTitle() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>작성자<%=goodsdto.getCustomer_id() %></td>
		</tr>
		<tr height="200">
			<td valign="top">내용</td>
			<td valign="top"><%=goodsdto.getContent() %></td>
		</tr>
		<!-- 댓글 수 조회수 출력줄 -->
		<tr>
			<td>댓글수 조회수</td>
			 <td>
댓글수<%=goodsdto.getReplycount() %>
조회수<%=goodsdto.getReadcount() %>

</td> 
		</tr>
		<!-- 댓글 작성칸 -->
		<tr align="right">
			<form action="reply_insert.do" method="post"></form>
			<td align="right"><a href="#"><input type="button"
					value="글쓰기"></a> <a href="#"><input type="button"
					value="댓글쓰기"></a> <a href="#"><input type="button"
					value="수정"></a> <a href="#"><input type="button"
					value="삭제"></a> <a href="#"><input type="button"
					value="목록"></a> <a href="#"><input type="button"
					value="글쓰기"></a></td>
		</tr>






	</table>
</div>





<jsp:include page="/template/footer.jsp"></jsp:include>