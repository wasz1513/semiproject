
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<% 
int goods_no= Integer.parseInt((request.getParameter("goods_no"))); 
 GoodsDao goodsdao= new GoodsDao(); 
 GoodsDto goodsdto = goodsdao.get(goods_no); //게시글 불러오기
 
 String customer_id = (String)session.getAttribute("customer_id");
 String customer_grade = (String)session.getAttribute("customer_grade");

 boolean isMine = customer_id.equals(goodsdto.getCustomer_id());
 boolean isAdmin = customer_grade.equals("관리자");
 
 Set<Integer> memory = (Set<Integer>) session.getAttribute("memory");
	if(memory == null){	 
memory = new HashSet<>();
	}
 
	boolean isFirst = memory.add(goods_no);
	
 session.setAttribute("memory", memory);
 
 //남의 글이라면 == !isMine
 if(!isMine && isFirst ){
 goodsdto.setGoods_readcount(goodsdto.getGoods_readcount() + 1);
 goodsdao.readcountupdate(goods_no); //조회수 증가
 }
%>


<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">
	<h2>상품등록 상세보기</h2>

	<table border="1" width="70%">
		<tr>

			<td><%=goodsdto.getGoods_title() %></td>
		</tr>
		<tr>

			<td>작성자<%=goodsdto.getCustomer_id() %></td>
		</tr>
		<tr height="200">
			<td valign="top">내용</td>
			<td valign="top"><%=goodsdto.getGoods_content() %></td>
		</tr>
		<!-- 댓글 수 조회수 출력줄 -->
		<tr>

			<td>댓글수<%=goodsdto.getGoods_replycount() %> 조회수<%=goodsdto.getGoods_readcount() %>

			</td>
		</tr>
		<!-- 댓글 작성칸 -->
		<tr align="right">
			<form action="#" method="post"></form>
			<td align="right"><a href="#"><input type="button"
					value="글쓰기"></a> <a href="#"><input type="button"
					value="댓글쓰기"></a> <a href="#"><input type="button"
					value="수정"></a> <a href="#"><input type="button" value="삭제"></a>
				<a href="#"><input type="button" value="목록"></a> <a href="#"><input
					type="button" value="글쓰기"></a></td>
		</tr>






	</table>
</div>





<jsp:include page="/template/footer.jsp"></jsp:include>