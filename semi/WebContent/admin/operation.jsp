<%@page import="semi.bean.SessionVisitDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	SessionVisitDao dao = new SessionVisitDao();
	int total = dao.total();
	int today = dao.today();
%>

<style>
.info_wrap .info_table tr th {
    width: 200px;
    padding-left: 20px;
    text-align: center;
}

.info_wrap .info_table tr td {
    width: 200px;
    padding-left: 20px;
    text-align: center;
}

.info_wrap{
	margin-bottom: 100px;
}	

</style>
<article>

	<div id="info">
	
		<header id="header">
            <h2 class="info_title">운영현황</h2>    			
        </header>
	
		<div class="info_wrap">
			<table  class="info_table">
				<tr>
					<th>
						<a href="list.jsp">회원리스트</a>
					</th>
					<th>
						<a href="../goods/goods_list.jsp">게시글리스트</a>
					</th>
					<th>
						<a href="../board/list.jsp">공지게시판</a>
					</th>
					<th>
						<a href="help2.jsp">신고게시판</a>
					</th>
				</tr>
				<tr>
					<th colspan="2" align="center">
						총 방문자
					</th>
					<td colspan="2">
						<%= total %>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						오늘 방문자
					</th>
					<td colspan="2">
						<%= today %>
					</td>
				</tr>
			</table>
		</div>
	
	</div>

</article>

<jsp:include page="/template/footer.jsp"></jsp:include>