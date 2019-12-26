<%@page import="semi.bean.HelpfilesDto"%>
<%@page import="semi.bean.HelpfilesDao"%>
<%@page import="semi.bean.HelpDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.HelpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>

<%
	
	
	
	//검색 1.검ㅁ색어를받고 dao생성 -> dto 얻어내서->출력

	//dao가져오기  관리자 목록
	HelpDao dao = new HelpDao();
	List<HelpDto> list = dao.getAdminList();
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
	
		<br><br>
		
		<h2>관리자 문의/신고 내역</h2>
		<h5>※ 댓글창 만들기 싫ㅇ다ㅜ</h5>
	</div>


	<!-- 		<table border="1" width="90%"> -->
	<!-- 			<thead> -->
	<!-- 				<tr> -->
	<!-- 					<th width="5%">번호</th> -->
	<!-- 					<th>날짜</th> -->
	<!-- 					<th>유형</th> -->
	<!-- 					<th width="70%">내용</th> -->
	<!-- 				</tr> -->
	<!-- 			</thead> -->
	<!-- 			<tbody align="center"> -->
	<%-- 			<%for(HelpDto dto : list){ %> --%>
	<!-- 		  	<tr> -->
	<%-- 				<td><%=dto.getBoard_NO()%></td> --%>
	<%-- 				<td><%=dto.getHdate()%></td> --%>
	<%-- 				<td><%=dto.getHead()%></td> --%>
	<%-- 				<td align="left"><%=dto.getContent()%></td> --%>

	<!-- 			</tr> -->
	<%-- 			<%} %> --%>
	<!-- 			</tbody> -->
	<!-- 		</table> -->
		<br><br>
	<div>
		<%
			for (HelpDto adto : list) {
		%>
		<div>
		
			<label for="show-<%=adto.getBoard_NO()%>" class="help-list">
				<div>
				rn:<%= adto.getRn() %>
				</div>
				<div>
				아이디 : <%= adto.getWrite() %>
				</div>
				
				<div>
				<%if(adto.getHead()!=null){%>
				유형 : [<%= adto.getHead() %>]
				<%} %>
				</div>
				
				<div>
				날짜  : <%= adto.getHdate() %>
				</div>

			</label> 
			<input id="show-<%=adto.getBoard_NO()%>" type="checkbox" class="togglebox">
			
			<div class="help-content">
				내용 : <%= adto.getContent() %><br>
				첨부파일 :<img src="download.do?board_no=<%=fdao.getfilesNo(adto.getBoard_NO())%>" width="100" height="100">
			</div>
			
			<div aligh="right"></div>
			<form action = "reply_insert.do"method="post">
				<input type="hidden" name="origin" value="origin" value="">
				<textarea name="content"rows="4" cols="100"required></textarea>
				<input type ="submit" value="등록"> 
				</form>
				
			</div>
		</div>
		<%
			}
		%>
		
		
	</div>

		<h4>[이전] 1 2 3 4 5 6 7 8 9 10 [다음]</h4>
		
		<form action ="help.jsp" method="get">
		
		<select name="type">
		<option vlaue="write">작성자</option>
		<option value="content">내용 키워드</option>
		</select>
		
		<input type="seach" name="keyword" placeholder="검색어" required>
		
		<input type="submit" value="검색">
		
		</form>
		<br><br>
		
		
		
</article>



<jsp:include page="/template/footer.jsp"></jsp:include>

