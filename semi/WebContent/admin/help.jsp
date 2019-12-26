<%@page import="semi.bean.HelpReplyDao"%>
<%@page import="semi.bean.HelpReplyDto"%>
<%@page import="semi.bean.HelpfilesDto"%>
<%@page import="semi.bean.HelpfilesDao"%>
<%@page import="semi.bean.HelpDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.HelpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>

<%

	int origin =  Integer.parseInt(request.getParameter("origin"));

	//dao가져오기
	String write = (String) request.getSession().getAttribute("customer_id");
	HelpDao dao = new HelpDao();
	List<HelpDto> list = dao.getList(write);
	HelpfilesDao fdao = new HelpfilesDao();
	

%>

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


.help-list{
	padding:0;
	margin:0;
}

.togglebox {
 	display: none;
}

.togglebox+.help-content {
	max-height:0;
	overflow:hidden;
	/*
		transition 속성은 애니메이션과 관련된 수치들을 설정하는 속성이다.
		- all : 모든 상태변화에 적용(모든 스타일 속성 설정 가능)
		- 1s : 애니메이션 시간
		- linear : 애니메이션 함수(직선), ease-in , ease-out, ease-in-out
		
	*/
	transition: max-height .5s ease-in-out;
}

.togglebox:checked+.help-content {
	max-height:1000px;
}


</style>

<article>

	<div align="center">
			 
			<h2> 관리자 문의/신고 페이지</h2>
		
		</div>
		<h2>문의/신고 내역</h2>
		<h5>※아 댓글창 만들기 싫다</h5>
	</div>



	<div>
		<%
			for (HelpDto dto : list) {
		%>
		<div>
		
			<label for="show-<%=dto.getBoard_NO()%>" class="help-list">

				<div>
				유형 : <%= dto.getHead() %></div>
				</div>
				
				<div>
				날짜  : <%= dto.getHdate() %>
				</div>

			</label> 
			<input id="show-<%=dto.getBoard_NO()%>" type="checkbox" class="togglebox">
			
			<div class="help-content">
				내용 : <%= dto.getContent() %><br>
				첨부파일 :<img src="download.do?board_no=<%=fdao.getfilesNo(dto.getBoard_NO())%>" width="100" height="100">
			</div>
			<%}%>
			
			
			<!-- 댓글창 -->
		
				<form action = "reply_insert.do"method="post">
				<input type="hidden" name="origin" value="origin" value="">
				<testarea name="content"rows="4" cols="100"required></testarea>
				<input type ="submit" value="등록"> 
				</form>
					
		</div>
		
	</div>



</article>



<jsp:include page="/template/footer.jsp"></jsp:include>

