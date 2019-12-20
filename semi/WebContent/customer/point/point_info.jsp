<%@page import="java.util.List"%>
<%@page import="semi.bean.PointDto"%>
<%@page import="semi.bean.PointDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PointDto dto = new PointDto();
	PointDao dao = new PointDao();
	List<PointDto> list = dao.getList();
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
	.point{
		margin-top:10px;
	}
</style>

<!--  -->
<article>
<form action = "point_save.do">
	<input type="button" value="적립하기">
</form>
<form>
	<input type="button" value="사용하기">
</form>
	<div class="row-multi col-4">
		<div class="point">
			적립
		</div>
		<div>
			<div>적립일자 : <br>적립내용 : </div>
		</div>
		<div>
		</div>
		<div>
			<div>적립포인트</div>
			<div>내역삭제</div>
		</div>
	</div>
	<div class="row-multi col-4">
		<div class="point">
			사용
		</div>
		<div>
			<div>사용일자</div>
			<div>사용내용</div>
		</div>
		<div>
		</div>
		<div>
			<div>사용포인트</div>
			<div>내역삭제</div>
		</div>
	</div>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>