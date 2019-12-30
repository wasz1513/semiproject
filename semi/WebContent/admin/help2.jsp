<%@page import="semi.bean.HelpReplyDto"%>
<%@page import="java.awt.PageAttributes.OriginType"%>
<%@page import="semi.bean.ReplyDto"%>
<%@page import="semi.bean.HelpReplyDao"%>
<%@page import="semi.bean.HelpfilesDto"%>
<%@page import="semi.bean.HelpfilesDao"%>
<%@page import="semi.bean.HelpDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.HelpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%  
			//페이지 크기
		int pagesize=10;
		int navsize=10;
		
		
		 //페이징추가
		int pno;
		try{
			pno=Integer.parseInt(request.getParameter("pno"));
			if(pno<=0) throw new Exception();			
		}
		catch(Exception e){
			pno=1;
		}

		
		
		int finish =pno*pagesize;
		int start =finish-(pagesize-1);
		
		String type=request.getParameter("type");
		String keyword =request.getParameter("keyword");
		
		boolean isSearch = type != null && keyword != null;

	//검색 1.검ㅁ색어를받고 dao생성 -> dto 얻어내서->출력

	//dao가져오기  관리자 목록
	HelpReplyDao hrdao =new HelpReplyDao();	
// 	List<HelpReplyDto> getlist =hrdao.getList(origin,start,finish);
	
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
	int count=dao.getCount(type,keyword);

	
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/help2.css">



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

	<div class="h2_wrap" align="center">
	  <div>
	
		<br><br>
		
		<h2>관리자 문의/신고 내역</h2>
		<h4>※ 회원분들께 친절한 상담을 합시다</h4>
		

	</div>
		<br><br>
		<div class="help2_list_wrap">

	<div>
		<%
			for (HelpDto adto : list) {
		%>
		<div>
		
			<label for="show-<%=adto.getBoard_NO()%>" class="help-list">
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
			<div class="hline">
				문의/신고 내용 : <%= adto.getContent() %><br>
				
				
				<%if(fdao.getfilesNo(adto.getBoard_NO())>0){ %>
				첨부파일 :<img src="../help/download.do?board_no=<%=fdao.getfilesNo(adto.getBoard_NO())%>" width="100" height="100">
				
				<%} %>
				</div>
				
				
				<br>
				<div>당근나라 운영센터 답변</div>
				<%=adto.getReply_content() %>
				
			</div>
			<hr>
			<%if(adto.getReply_content()!=null){ %>
				<div>
					
				</div>
			<%}else{ %>
				<div>
					<form action="../help/reply_insert.do" method="post">
						<input type="hidden" name="pno" value=<%=pno%>>
					  	<input type="hidden" name="board_no" value=<%=adto.getBoard_NO()%>>
						<textarea name="content" rows="4" cols="100"required></textarea>
						<input type ="submit" value="등록"> 
					</form>
				</div>
			<%} %>
			
		</div>
		<br><br>
		<%
			}
		%>
		
		
	</div>
	</div>
	
			<!-- 네비게이터 *************************** -->	


<div class="paging">
           
   	 <jsp:include page="/template/navigator.jsp">
   	 	<jsp:param name="pno"  value="<%=pno %>" />
   	    <jsp:param name="count"  value="<%=count %>" />
   	    <jsp:param name="navisize"  value="<%=navsize %>" />
   	    <jsp:param name="pagesize" value="<%=pagesize %>" />
   	 </jsp:include>
   	</div>
   	 

		<br>
		<!-- 검색 -->
	
		
		<form action ="help2.jsp" method="get">
		
		<select name="type">
		<option value="write">작성자</option>
		<option value="content">내용 키워드</option>
		</select>
		
		<input class="search-txt" type="seach" name="keyword" placeholder="검색어" required>
		<input class="search-bt"input type="submit" value="검색">
		
		</form>
		<br><br>
	
		
		</div>
		
</article>





<jsp:include page="/template/footer.jsp"></jsp:include>
