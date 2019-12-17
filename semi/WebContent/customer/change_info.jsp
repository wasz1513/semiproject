<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!-- get 메소드를 이용하여 전체 데이터를 불러와야 함. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보 수정</h1>
<form action="change_info.do" method="post">

<!-- get 메소드 추가시 input에 placeholder를 dto.get으로 가져와야함. -->
	<div>
		 아이디(수정안됨)
	</div>
	<div>
		 이름(수정안됨)
	</div>
	<div>
		닉네임(수정)
		<input type="text" name="customer_nickname">
	</div>
	<div>
		폰번호(수정)
		<input type="text" name="customer_phone">
	</div>
		<div>
		이메일(수정)
		<input type="text" name="customer_email">
	</div>
	<div>
		우편번호(수정)
		<input type="text" name="customer_post">
	</div>
	<div>
		기본주소(수정)
		<input type="text" name="customer_basic_address">
	</div>
	<div>
		상세주소(수정)
		<input type="text" name="customer_extra_address">
	</div>
		<div>
		<input type="reset" value="초기화">
		<input type="submit" value="수정">
	</div>
</form>
</body>
</html>