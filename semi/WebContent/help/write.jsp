<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

<title>신고/문의하기</title>
<style>
.row.row-multi::after {
	content: "";
	display: block;
	clear: both;
}

.row.row-multi>* {
	float: left;
}

.row.row-multi.col-2>* {
	width: 50%
}

.row.row-multi.col-3>* {
	width: 33.3333%
}

.row.row-multi.col-4>* {
	width: 25%
}

.row.row-multi.col-5>* {
	width: 20%
}
</style>


		<div align="center" class="row row-multi col-2" >
			<form action ="write.do" method="post">
				<input type="button" style="WIDTH: 300pt; HEIGHT: 44pt" value="1:1문의/신고">
				<a href="list.jsp">
				<input type="button" style="WIDTH: 300pt; HEIGHT: 44pt" value="문의/신고내역">
				</a>			
				</div>
			<br><br><br>
			<div>※ 신고/문의내용에 욕설, 성희롱 등의 내용이 포함된 경우 상담이 제한될 수 있습니다.</div>
			
			
			
			<br>
		
			<div class="row row-multi col-2">
				<div>문의/신고</div>
				<div>
					<select name="head">
						<option class="row-multi col5" value="">선택하세요</option>
						<option>거래신고</option>
						<option>서비스장애</option>
					</select>
				</div>
			</div>
		
			<div>
			
				<textarea name="content" required rows="20" cols="100"
					style="resize: vertical;"></textarea>
			</div>



			<div class="row row-multi col-2">
			<div align="left">
				<input type="button" value="사진 첨부하기">
			</div>
			<div align="right">
				<input type="submit" value="상담 신청">
				
			</div>
			</div>



				</form>
		</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
