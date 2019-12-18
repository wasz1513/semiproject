<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	int goods_no = Integer.parseInt(request.getParameter("goods_no"));
	GoodsDao dao = new GoodsDao();
	GoodsDto dto = dao.get(goods_no);
	
	%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class=row align="center">

<h2>상품 등록 수정</h2>
<form action="goods_edit.do" method="post">

<input type="hidden"  name="goods_no" value="<%=dto.getGoods_no()%>">
	
	<table border="1" width="70%">
		<tr>
			<th>카테고리</th>
			<td>
				<select name="goods_category" required>
						<option value="">카테고리</option>
						<option>패션의류</option>
						<option>패션잡화</option>
						<option>화장품/미용</option>
						<option>디지털/가전</option>
						<option>가구/인테리어</option>
						<option>출산/육아</option>
						<option>식품</option>
						<option>스포츠/레저</option>
						<option>생활/건강</option>
						<option>여행/문화</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="goods_title" value="<%=dto.getGoods_title() %>" required>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>
				<input type="text" name="goods_price">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="goods_content" required rows="15"cols="100" 
				style="resize: vertical;"><%=dto.getGoods_content() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정하기">
				<a href="goods_list.jsp">
				<input type="button" value="목록보기">
				</a>
			</td>
		</tr>
	</table>



</form>

</div>










<jsp:include page="/template/footer.jsp"></jsp:include>