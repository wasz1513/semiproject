<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
create table member(<br>
	회원코드 primary key / (member_seq.nextval)<br>
	전화번호  not null<br>
	닉네임 not null<br>
	주소(위치정보) not null<br>
	활동뱃지 default 0<br>
	매너온도 default 36.5<br>
	판매상품 default 0<br>
	받은 매너 평가 default null<br>
	받은 거래 후기 default null<br>
	)
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>	