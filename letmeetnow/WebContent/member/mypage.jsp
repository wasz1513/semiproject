<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
<table>
	<tbody border="1" width="700">
	
		<tr>
			<td>
				프로필 사진
			</td>
			<td>
				닉네임 / 주소 / 회원코드
			</td>
			<td>
				<a href="profile.jsp">프로필보기</a>
			</td>
		</tr>
	
		<tr>
			<td><a href="buy.jsp">판매내역</a></td>
			<td><a href="sale.jsp">구매내역</a></td>
			<td><a href="interestlist.jsp">관심목록</a></td>
		</tr>
		
		<tr>
			<td colspan="3">
				<a href="changeinfo.jsp">내 동네 설정 / 인증</a>
			</td>
		</tr>
		
		<tr>
			<td colspan="3">
				<a href="keyword.jsp">키워드 등록</a>
			</td>
		</tr>
		
		<tr>
			<td colspan="3">
				모아보기
			</td>
		</tr>
		
		<tr>
			<td colspan="3">
				친구초대
			</td>
		</tr>
		
		<tr>
			<td colspan="3">
				당근마켓 공유
			</td>
		</tr>
		
		<tr>
			<td colspan="3">
				공지사항
			</td>
		</tr>
		
		<tr>
			<td colspan="3">
				문의하기
			</td>
		</tr>
		
	</tbody>
</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>	