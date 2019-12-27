<%@page import="semi.bean.HelpfilesDto"%>
<%@page import="semi.bean.HelpfilesDao"%>
<%@page import="semi.bean.HelpDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.HelpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<%  
		 //페이징추가
		int pno;
		try{
			pno=Integer.parseInt(request.getParameter("pno"));
			if(pno<=0) throw new Exception();			
		}
		catch(Exception e){
			pno=1;
		}

		//페이지 크기
		int pagesize=10;
		
		int finish =pno*pagesize;
		int start =finish-(pagesize-1);
		
		String type=request.getParameter("type");
		String keyword =request.getParameter("keyword");
		
		boolean isSearch = type != null && keyword != null;
	
	
	
	//검색 1.검ㅁ색어를받고 dao생성 -> dto 얻어내서->출력

	//dao가져오기  관리자 목록
	HelpDao dao = new HelpDao();
	//List<HelpDto>list= 목록 or 검색
	List<HelpDto> list;
	if(isSearch){
		list=dao.search(type, keyword, start, finish);
	}
	else{
		list= dao.getAdminList(start,finish);
	}//나중에 뒤에 매개변수 start,finish 추가
	
	HelpfilesDao fdao = new HelpfilesDao();
	
	
	
	///하단 네비게이터 계산하기
	//시작블록 = (현페=1/1)  10*10+1
	int count=dao.getCount(type,keyword);
	int navsize=10;
	int pagecount=(count+pagesize)/pagesize;
	
	int startBlock =(pno-1)/navsize*navsize+1;
	int finishBlock =startBlock+(navsize-1);
	
	//
	if(finishBlock>pagecount){
		finishBlock=pagecount;
	}
	
%>

<jsp:include page="/template/header.jsp"></jsp:include>



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
	
	
			<!-- 네비게이터 ***************************-->
		<h4>
		<%if(startBlock > 1){ %>
			<%if(isSearch){ %>
				<a href="help2.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">[이전]</a>  
			<%}else{ %>
				<a href="help2.jsp?pno=<%=startBlock - 1%>">[이전]</a>
			<%} %>
		<%} %>
		
		<%for(int i=startBlock; i <= finishBlock; i++){ %>
			<%if(i == pno){ %>
				<%=i%>
			<%}else{ %>
				<%if(isSearch){ %>
					<a href="help2.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=i%>"><%=i%></a>
				<%}else{ %>
					<a href="help2.jsp?pno=<%=i%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<%if(finishBlock < pagecount){ %>
			<%if(isSearch){ %>
				<a href="help2.jsp?type=<%=type%>&keyword=<%=keyword%>&pno=<%=finishBlock + 1%>">[다음]</a>
			<%}else{ %>
				<a href="help2.jsp?pno=<%=finishBlock + 1%>">[다음]</a>
			<%} %>
		<%} %>
		</h4>
		
		<form action ="help2.jsp" method="get">
		
		<select name="type">
		<option vlaue="write">작성자</option>
		<option value="content">내용 키워드</option>
		</select>
		
		<input type="seach" name="keyword" placeholder="검색어" required>
		
		<input type="submit" value="검색">
		
		</form>
		<br><br>
	<h5>pno = <%=pno%>, type = <%=type%>, keyword = <%=keyword%></h5>
	<h5>pagecount = <%=pagecount%>, pagesize = <%=pagesize%></h5>
	<h5>start = <%=start%>, finish = <%=finish%></h5>
	<h5>startBlock = <%=startBlock%>, finishBlock = <%=finishBlock%></h5>
		
		
		
</article>



<jsp:include page="/template/footer.jsp"></jsp:include>

