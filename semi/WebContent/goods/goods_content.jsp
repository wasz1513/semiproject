<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.CustomerFilesDto"%>
<%@page import="semi.bean.CustomerFilesDao"%>
<%@page import="semi.bean.InterestDao"%>
<%@page import="semi.bean.GoodsReplyDao"%>
<%@page import="semi.bean.GoodsReplyDto"%>
<%@page import="semi.bean.GoodsFilesDao"%>
<%@page import="semi.bean.GoodsFilesDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	int goods_no = Integer.parseInt(request.getParameter("goods_no"));

	int goods_reply_no;
	if (request.getParameter("goods_reply_no") != null) {
		goods_reply_no = Integer.parseInt(request.getParameter("goods_reply_no"));
	} else {
		goods_reply_no = 0;
	}

	GoodsDao goodsdao = new GoodsDao();
	GoodsDto goodsdto = goodsdao.get(goods_no); //게시글 불러오기
	//본인 글인지 여부과 관리자인지 여부를 미리 계산(수정/삭제)
	String session_id = (String) session.getAttribute("customer_id");
	String session_grade = (String) session.getAttribute("customer_grade");
	//  System.out.println(session_id);
	//  System.out.println(session_grade);
	boolean isMine = session_id != null && session_id.equals(goodsdto.getCustomer_id());//사용자 id ==작성자 id
	boolean isAdmin = session_grade != null && session_grade.equals("관리자");//사용자 권한 == 관리자
	//저장소를 이용하여 이미 읽은 글은 조회수 증가 방지
	Set<Integer> memory = (Set<Integer>) session.getAttribute("memory");
	if (memory == null) {
		memory = new HashSet<>();
	}
	boolean isFirst = memory.add(goods_no);
	session.setAttribute("memory", memory);
	//남의 글이라면 == !isMine
	if (!isMine && isFirst) {
		goodsdto.setGoods_readcount(goodsdto.getGoods_readcount() + 1);
		goodsdao.readcountupdate(goods_no); //조회수 증가
	}

	//첨부파일 불러오기

	GoodsFilesDao gfdao = new GoodsFilesDao();
	List<GoodsFilesDto> flist = gfdao.getList(goods_no);
	System.out.print(flist);

	//좋아요 확인
	InterestDao interestdao = new InterestDao();
	boolean interest = interestdao.check(session_id, goods_no);
	
	//작성자 프로필사진
	int customer_files_no = goodsdao.getCustomer_files_no(goods_no);
	
			
	//작성자 주소
	String Customer_basic_address = goodsdao.getCustomer_addr(goods_no);
	
	
%>


<jsp:include page="/template/header.jsp"></jsp:include>

	<style>
	.big{
	 width: 900px;
	 height: 1000px;
	}
		
		.Detail {
			font-size:x-large;
		}
	.cate {
	color: gray;
	}
	
	.title{
		padding: 50px
	}
	.imagetr{
	height: 200px;
	}
	
	.mannerline{
	padding: 10px;
	}
	
	.profile-image{
	display: inline-block;
	}
	.big-profile-cutomer{
	display: inline-block;
	}
	
	
	.profile-cutomer{
		font-size: 15px;
		font-weight: 600;
		line-height: 1.5;
    	letter-spacing: -0.6px;
    	color: #212529;
		
	}
	
	
	.addr-customer{
	font-size: 13px;
    line-height: 1.46;
    letter-spacing: -0.6px;
    color: #212529;
	}
	
	</style>





<article class="big">
<div align="center">
	<h2 class="title">상품등록 상세보기</h2>


	<div border="1" width="70%">
		
		<table>
		<tr class="imagetr">
		
			<td class="#" valign="top" align="center" >
				<%for (GoodsFilesDto gfdto : flist) {%>
			<img src="download.do?no=<%=gfdto.getGoods_files_no()%>" width="440" height="440">
				<%} %>
			</td>
			
		</tr>
</table>

	<div class="mannerline" >
		<div>
			<a class="profile-image">
				<%if (customer_files_no>0) {%>
				<img src="<%=request.getContextPath()%>/customer/download.do?no=<%=customer_files_no%>" width="30" height="30">
				<%}else{ %>
				<img src="http://placehoid.it/100x100">
				<%} %>
			<div class="big-profile-cutomer">
					<div class="profile-cutomer  align="left">
						<%=goodsdto.getCustomer_id()%>
					</div>
					<div class="addr-customer">
						<%= Customer_basic_address%>  
					</div>
			</div>
		</div>
			</a>
			
			<div align="right"> <img src="../image/매너온도.png" width="40" height="40">매너온도 36.5˚C</div>
			
			
			
		<hr width="900">
		
	
			
			<div class="Detail" align="center">
		<tr>
			<td><h1 align="left"><%=goodsdto.getGoods_title()%></h1></td>
			<td><h6 class="cate" align="left"><%=goodsdto.getGoods_category() %></h6></td>
		</tr>
	
		
		
		<p align="left">
			<%=goodsdto.getGoods_content()%>
			</p>
			</div>

				<!-- 				첨부파일이미지 찍기 --> 
	
		
		<table border="1" wid>	
	<%if (flist.size() > 0) {%> 
 <!-- 첨부파일 출력줄 : 있을 때만 출력 -->
		<tr>
			<td>
				<!-- 첨부파일 출력줄 : 있을 때만 출력 -->

				<ul>
					<%
						for (GoodsFilesDto gfdto : flist) {
					%>
					<li>
						<!-- 미리보기 출력 --> <img
						src="download.do?no=<%=gfdto.getGoods_files_no()%>" width="80" height="50"> 
						<%=gfdto.getUploadname()%> (<%=gfdto.getFilesize()%>bytes)
						 <a href="download.do?no=<%=gfdto.getGoods_files_no()%>">
							<img src="../image/download.png" width="15" height="15">
					</a>
					</li>
					<%
						}
					%>
				</ul>

			</td>
		</tr>
		<%
			}
		%>
		<!-- 댓글 수 조회수 출력줄 -->
		</table>
		
		
		
		<tr>

			<td>댓글수<%=goodsdto.getGoods_replycount()%> 조회수<%=goodsdto.getGoods_readcount()%>

			</td>
		</tr>

		<tr>
			<td>
				<%
					GoodsReplyDao goodsreplydao = new GoodsReplyDao();
					List<GoodsReplyDto> list = goodsreplydao.goods_reply_getList(goods_no);
					//  		System.out.println(list);
				%>

		<% if(session_id !=null){ %>
				<table border="1" width="100%">
					<% for (GoodsReplyDto goodsreplydto : list) { %>
					<tr>
						<th width="100"><img src="http://placehold.it/100X100">
						</th>
						<td>
						<%=goodsreplydto.getGoods_reply_writer()%> 
							<!-- 판매글 판매자의 댓글에만 판매자 표시 -->
							<% if (isMine) { %> 
							 	<font color="red">(판매자)</font> 
							<% } %> 
								<%=goodsreplydto.getGoods_reply_writetime()%>
							
							 <!-- 수정 /삭제 버튼은 본인의 댓글에만 표시 --> 
							<% if (session_id.equals(goodsreplydto.getGoods_reply_writer()) && session_id != null) { %>
								<a href="goods_content.jsp?goods_no=<%=goodsdto.getGoods_no()%>&goods_reply_no=<%=goodsreplydto.getGoods_reply_no()%>">수정</a>
								<a href="goods_reply_delete.do?goods_reply_no=<%=goodsreplydto.getGoods_reply_no()%>&goods_no=<%=goodsdto.getGoods_no()%>">삭제</a>
							<% } %> 
						
							<% if (goodsreplydto.getGoods_reply_no() == goods_reply_no) { %>
								<form action="goods_reply_edit.do" method="post">
									<input type="hidden" name="goods_no" value="<%=goodsdto.getGoods_no()%>"> 
									<input type="hidden" name="goods_reply_no" value="<%=goods_reply_no%>">
									<textarea name="goods_reply_content" rows="4" cols="100" required><%=goodsreplydto.getGoods_reply_content()%></textarea>
									<input type="submit" value="댓글수정">
								</form> 
							<% } else { %>
								<%=goodsreplydto.getGoods_reply_content()%>
							<% } %>
							</td>
					<% } %>
					</tr>
				</div>



			</td>
		</tr>


		<!-- 댓글 작성칸 -->
		<tr>
			<td align="right">
				<form action="goods_reply_insert.do" method="post">
					<input type="hidden" name="goods_no"
						value="<%=goodsdto.getGoods_no()%>">
					<textarea name="goods_reply_content" rows="4" cols="100" required></textarea>
					<input type="submit" value="등록">

				</form>
			</td>
		</tr>
		<%} %>


		<!-- 버튼 -->
		<tr>
			<td align="right"><a href="orders.jsp?goods_no=<%=goodsdto.getGoods_no()%>"><input type="button"
					value="구매하기"></a> <%
 	if (interest) {
 %> <a
				href="interestremove.do?goods_no=<%=goodsdto.getGoods_no()%>"><img
					src="../image/heart2.png" width="25" height="25"></a> <%
 	} else {
 %> <a
				href="interest.do?goods_no=<%=goodsdto.getGoods_no()%>"><img
					src="../image/heart.png" width="25" height="25"></a> <%
 	}
 %> <a
				href="goods_write.jsp"><input type="button" value="글쓰기"></a>
				<a
				href="goods_reply_write.jsp?goods_reply_superno=<%=goodsdto.getGoods_no()%>">
					<input type="button" value="답글쓰기">
			</a> <%
 	if (isAdmin || isMine) {
 %> <!-- 수정/삭제 버튼은 관리자이거나 본인 글에만 표시 --> <a
				href="goods_edit.jsp?goods_no=<%=goodsdto.getGoods_no()%>"> <input
					type="button" value="수정"></a> <a
				href="goods_delete.do?goods_no=<%=goodsdto.getGoods_no()%>"> <input
					type="button" value="삭제"></a> <%
 	}
 %> <a href="goods_list.jsp"><input type="button" value="목록"></a></td>
		</tr>
	</table>

</div>


</article>


<jsp:include page="/template/footer.jsp"></jsp:include>