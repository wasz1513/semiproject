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
%>


<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>상품등록 상세보기</h2>



	<table border="1" width="70%">
		<tr>

			<td><%=goodsdto.getGoods_title()%></td>
		</tr>
		<tr>

			<td>작성자<%=goodsdto.getCustomer_id()%></td>
		</tr>
		<tr height="200">
			<td valign="top"><%=goodsdto.getGoods_content()%></td>
		</tr>

		<tr>
			<td>
				<!-- 				첨부파일이미지 찍기 --> <%
 	if (flist.size() > 0) {
 %> <!-- 첨부파일 출력줄 : 있을 때만 출력 -->
		<tr>
			<td>
				<!-- 첨부파일 출력줄 : 있을 때만 출력 -->

				<ul>
					<%
						for (GoodsFilesDto gfdto : flist) {
					%>
					<li>
						<!-- 미리보기 출력 --> <img
						src="download.do?no=<%=gfdto.getGoods_files_no()%>" width="80"
						height="50"> <%=gfdto.getUploadname()%> (<%=gfdto.getFilesize()%>
						bytes) <a href="download.do?no=<%=gfdto.getGoods_files_no()%>">
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

				<table border="1" width="100%">
					<%
						for (GoodsReplyDto goodsreplydto : list) {
					%>
					<tr>
						<th width="100"><img src="http://placehold.it/100X100">
						</th>
						<td><%=goodsreplydto.getGoods_reply_writer()%> <%
 	if (isMine) {
 %> <!-- 판매글 판매자의 댓글에만 판매자 표시 --> <font color="red">(판매자)</font> <%
 	}
 %> <%=goodsreplydto.getGoods_reply_writetime()%> <%
 	if (session_id.equals(goodsreplydto.getGoods_reply_writer())) {
 %> <!-- 수정 /삭제 버튼은 본인의 댓글에만 표시 --> <a
							href="goods_content.jsp?goods_no=<%=goodsdto.getGoods_no()%>&goods_reply_no=<%=goodsreplydto.getGoods_reply_no()%>">수정</a>
							<a
							href="goods_reply_delete.do?goods_reply_no=<%=goodsreplydto.getGoods_reply_no()%>&goods_no=<%=goodsdto.getGoods_no()%>">삭제</a>
							<%
								}
							%> <br> <br> <%
 	if (goodsreplydto.getGoods_reply_no() == goods_reply_no) {
 %>
							<form action="goods_reply_edit.do" method="post">
								<input type="hidden" name="goods_no"
									value="<%=goodsdto.getGoods_no()%>"> <input
									type="hidden" name="goods_reply_no" value="<%=goods_reply_no%>">
								<textarea name="goods_reply_content" rows="4" cols="100"
									required><%=goodsreplydto.getGoods_reply_content()%></textarea>
								<input type="submit" value="댓글수정">
							</form> <%
 	} else {
 %> <%=goodsreplydto.getGoods_reply_content()%> <%
 	}
 %></td>
						<!--댓글 수정 테스트  -->
						<%
							}
						%>






					</tr>
				</table>



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

		<!-- 버튼 -->
		<tr>
			<td align="right"><a href="orders.jsp"><input type="button"
					value="구매하기"></a> 
					
					<%if(interest){ %>
					<a href="interestremove.do?goods_no=<%=goodsdto.getGoods_no()%>"><img src="../image/heart2.png" width="25" height="25"></a>
					<%}else{ %>
					<a href="interest.do?goods_no=<%=goodsdto.getGoods_no()%>"><img src="../image/heart.png" width="25" height="25"></a>
					<%} %>
					<a href="goods_write.jsp"><input
					type="button" value="글쓰기"></a>
					 <a href="goods_reply_write.jsp?goods_reply_superno=<%=goodsdto.getGoods_no()%>">
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





<jsp:include page="/template/footer.jsp"></jsp:include>