<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<h2>�α���������</h2>
	<form action="login.do" method="post">
		<table width="450">
			<tr>
				<th>ID</th>
				<td align="right">
					<input type="text" name="id" required size="35">
				</td>
			</tr>
			<tr>
				<th>PASSWORD</th>
				<td align="right">
					<input type="password" name="pw" required size="35">
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" value="?">ID ����
				</td>
				<td align="right">
					<input type="submit" value="�α���">
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	<table width="450">
		<tbody align="center">
			<tr>
				<td>
					<a href="#">ȸ������</a>
				</td>
				<td>
					<a href="#">ID ã��</a>
				</td>
				<td>
					<a href="#">PW ã��</a>
				</td>
			</tr>
		</tbody>
	</table>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>