<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<h2>로그인페이지</h2>
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
					<input type="checkbox" value="?">ID 저장
				</td>
				<td align="right">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	<table width="450">
		<tbody align="center">
			<tr>
				<td>
					<a href="#">회원가입</a>
				</td>
				<td>
					<a href="#">ID 찾기</a>
				</td>
				<td>
					<a href="#">PW 찾기</a>
				</td>
			</tr>
		</tbody>
	</table>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>