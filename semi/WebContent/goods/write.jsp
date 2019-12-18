<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>



<h2>상품 등록</h2>
<form action="write.do" method="post">
<table border="1" width="70%">
<tr>
<th>카테고리</th>
<td>
<select name="category" required>
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
<input type="text" name="title" required>
</td>
</tr>
<tr>
<th>가격</th>
<td>
<input type="text" name="price">
</td>
</tr>
<tr>
<td colspan="2">
<textarea name="content" required rows="15" cols="100"
style="resize: vertical;"></textarea>
</td>
</tr>
<tr>
<td colspan="2"  align="center">
<input type="submit"  value="등록하기">

</td>
</tr>
</table>



</form>











<jsp:include page="/template/footer.jsp"></jsp:include>