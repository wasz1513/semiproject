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

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/swiper.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/swiper2.css">

<script src="<%=request.getContextPath()%>/js/swiper.js"></script>
<script>
function loadSlider(){
	 var swiper = new Swiper('.swiper-container', {
		 slidesPerView: 1,
	     loop: false,
	     pagination: {
	         el: '.swiper-pagination',
	         type: 'fraction',
	     },
	  });
}
</script>

	<style>
	section, article, aside, footer, header, nav, hgroup {
    display: block;
	}
	
	* {
    margin: 0;
    padding: 0;
    }
	
		#content {
    margin-top: 100px;
    padding-bottom: 0;
    width: 100%;
}
		
		#article-images {
    position: relative;
    width: 729px;
    margin: 0 auto;
}

div {
    display: block;
}

#image-slider .slider-wrap {
    position: relative;
}

#image-slider .slider-wrap .slider {
    border: none;
}

#article-profile {
    width: 677px;
    margin: 0 auto;
        margin-top: 50px;
}

#article-profile #article-profile-link {
    text-decoration: none;
    display: block;
    margin-top: 0px;
    padding-bottom: 0px;
    position: relative;
    border-bottom: 1px solid #e9ecef;
    left: 40px;
}

#article-profile #article-profile-image img {
    width: 40px;
    height: 40px;
	object-fit: cover;
	border-radius: 50%;
}

#article-profile #article-profile-image {
    display: inline-block;
}

#article-profile #article-profile-left {
    display: inline-block;
    margin-left: 8px;
    float: left;
}

#article-profile #article-profile-left #nickname {
    font-size: 15px;
    font-weight: 600;
    line-height: 1.5;
    letter-spacing: -0.6px;
    color: #212529;
}

#article-profile #article-profile-left #region-name {
    font-size: 13px;
    line-height: 1.46;
    letter-spacing: -0.6px;
    color: #212529;
}

#article-profile #article-profile-right {
   
     display: block; 
    margin-right: 8px; 
    float: right;
        margin-top: 57px;
}

#article-profile #article-profile-right dl {
    display: block;
    width: 100px;
}

dl {
/*     margin-block-start: 1em; */
/*     margin-block-end: 1em; */
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

#article-profile #article-profile-right dl dt {
    position: absolute;
    top: 36px;
    right: 0px;
    font-size: 12px;
    line-height: 1;
    letter-spacing: -0.6px;
    color: #868e96;
}

#article-profile #article-profile-right .text-color-03 {
       color: #1561a9;
    font-size: 16px;
    font-weight: bold;
    line-height: 1;
    letter-spacing: -0.5px;
    bottom: 40px;
    text-align: center;
    display: block;
}

#article-profile #article-profile-right dl dd {
    position: absolute;
    right: 30px;
    font-size: 16px;
    font-weight: bold;
    line-height: 1;
    letter-spacing: -0.5px;
    margin-top: 1px;
}

dd {
    display: block;
    margin-inline-start: 40px;
    
}

#article-profile #article-profile-right .meters {
    display: inline-block;
    width: 100px;
    background-color: #e9ecef;
    height: 4px;
    border-radius: 100px;
    position: sticky;
    vertical-align: middle;
    display: inline-block;
}


element.style {
    width: 37%;
}

#article-profile #article-profile-right .meters .bar-color-03 {
    background-color: #1561a9;
}

#article-profile #article-profile-right .meters .bar {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    height: 4px;
    border-radius: 100px;
}
#article-profile #article-profile-right .face {
    position: absolute;
    right: 0;
    top: 0;
}
.face-03 {
    background-position: -0px -75px;
    width: 24px;
    height: 24px;
     display: inline-block;
    overflow: hidden;
    text-indent: -9999px;
    text-align: left;
    background-size: 29px 147px;
}

.face-01, .face-02, .face-03, .face-04, .face-05, .face-06 {
    display: inline-block;
    overflow: hidden;
    
    text-indent: -9999px;
    text-align: left;
    background-size: 29px 147px;
}

#article-description {
    padding: 32px 0;
    width: 677px;
    margin: 0 auto;
    border-bottom: 1px solid #e9ecef;
}

#article-description #article-title {
 
    font-size: 20px;
    font-weight: 600;
    line-height: 1.5;
    letter-spacing: -0.6px;
}

#article-description #article-category {
    margin-top: 4px;
    font-size: 13px;
    line-height: 1.46;
    letter-spacing: -0.6px;
    color: #868e96;
}

p {
    display: block;
    margin-block-start: 1em; 
     margin-block-end: 1em; 
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

element.style {
    font-size: 18px;
    font-weight: bold;
}


#article-description #article-price {
    margin-top: 4px;
    line-height: 1.76;
    letter-spacing: -0.6px;
}


#article-description #article-counts {
    font-size: 13px;
    line-height: 1.46;
    letter-spacing: -0.6px;
    color: #868e96;
}
	
	.goods-title{
		text-align: center;
		padding: 50px;
	}
	
	.swiper-container{
		width:400px;
		height:400px;
	}
	
	.swiper-wrapper{
	    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    list-style: none;
    padding: 0;
    margin-bottom: 100px;
    z-index: 1;
}

/* #article-profile #space-between { */
    
/*     display: flex; */
   
/*     align-items: center; */
/*     justify-content: space-between; */
/*      margin-top: 50px; */
/*     } */





.space-between::after{
            content: "";
            display: block;
            clear: both;
             margin-top: 50px;
             padding: 30px;
        }
.mannerimg{
display: inline-block;

}
.manner-font{
	text-align: end;
    display: block;
    font-size: 12px;
    color: gray;
}

.goods-reply{
	width:677px;
	margin:auto;
}

.filesview .reply-td{
	text-align:left;
	padding-left:20px;
}

#reply-submit{
	text-align: right;
}
	</style>




<div id = "content">
	<h2 class="goods-title" >상품등록 상세보기</h2>
	

	<!-- 이미지 올라오는 부분 -->
<div id="article-images">
<div> 
			<div class="main-banner">
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				    <%for (GoodsFilesDto gfdto : flist) {%>
				      <div class="swiper-slide"><img src="download.do?no=<%=gfdto.getGoods_files_no()%>" width="100%" height="100%"></div>
				      <%} %>
				    </div>
				    <div class="swiper-pagination"></div>
				</div>
	</div>
</div>
 </div>
 
 
 <!-- 이미지 올라오는 부분 끝 -->
 
 
 	 
 		
 <div id="article-profile">
 			
 			<div class="space-between">
 				
 			
 			<div id="article-profile-left">
 			
 				<a id="article-profile-link" href="유저상세정보창이동">
 				<div id = "article-profile-image">
 				<%if (customer_files_no>0) {%>
				<img class="profile-img" src="<%=request.getContextPath()%>/customer/download.do?no=<%=customer_files_no%>" width="30" height="30">
				<%}else{ %>
				<img class="profile-img" src="http://placehoid.it/100x100">
				<%} %>
				</div>
 				<p id="nickname"><%=goodsdto.getCustomer_id()%></p>
 			    <p id="region-name"><%= Customer_basic_address%>  </p>
 			    </a>
 		</div>
 			
 		
 		
 		<div id="article-profile-right">
 			
               <div class="text-color-03"> 36.5° 
 		 <div class="meters">
 			<div class="bar bar-color-03" style="width: 37%;"></div>
 		</div>
 		
 			<div class="mannerimg">
 			<img  src="../image/매너온도.png" width="40" height="40">
 			</div>
               
               <div class="manner-font">매너온도</div>
               </div>
               
 			
 		
 		</div>
 		
 		
 			</div>
 	</div>
 	
 	<div id="article-description">
 		 <h1 property="schema:name" id="article-title"  style="margin-top:0px;">
 		 <%=goodsdto.getGoods_title()%>
 		 </h1>
 		 
 		<p id="article-category">
 		<%=goodsdto.getGoods_category() %>
 		</p>
 		
 		<p id="article-price" content="50000.0" style="font-size:18px; font-weight:bold;">
           <%=goodsdto.getGoods_price() %>원
        </p>
 		
 		 <div id="article-detail">
 			<p>
 			<%=goodsdto.getGoods_content()%>
			</p>
 		</div>
 		
 		<p id="article-counts">
          댓글 <%=goodsdto.getGoods_replycount()%> ∙ 관심 13 ∙ 조회 <%=goodsdto.getGoods_readcount()%>
        </p>
 		
 		
 	
 	</div>
 	</div>
 	
 	
 	<div>
 		<div align="center">
 			
	<%if (flist.size() > 0) {%> 
 <!-- 첨부파일 출력줄 : 있을 때만 출력 -->
		
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

		
		<%
			}
		%>
 		</div>
 	</div>
 	
 	<div class="row">
 		<div class="goods-reply">
 		
				<%
					GoodsReplyDao goodsreplydao = new GoodsReplyDao();
					List<GoodsReplyDto> list = goodsreplydao.goods_reply_getList(goods_no);
					//  		System.out.println(list);
				%>

		<% if(session_id !=null){ %>
				<table class="filesview"  width="100%"  style="margin-left: auto; margin-right: auto;">
					<% for (GoodsReplyDto goodsreplydto : list) { %>
					<tr>
						<th class="reply-th" width="100"><img src="http://placehold.it/100X100">
						</th>
						<td class="reply-td">
						<%=goodsreplydto.getGoods_reply_writer()%> 
							<!--  판매글 판매자의 댓글에만 판매자 표시-->
							<% if (isMine) { %> 
							 	<font color="red">(판매자)</font> 
							<% } %> 
								<%=goodsreplydto.getGoods_reply_writetime()%>
							
<!-- 							 수정 /삭제 버튼은 본인의 댓글에만 표시  -->
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
								<br><br>
								<%=goodsreplydto.getGoods_reply_content()%>
							<% } %>
							</td>
					<% } %>
					</tr>
			



 		
 		
 		<!-- 댓글 작성칸 -->
		<tr>
			<td align="center" colspan="2">
				<form action="goods_reply_insert.do" method="post">
					<input type="hidden" name="goods_no"
						value="<%=goodsdto.getGoods_no()%>">
					<textarea name="goods_reply_content" rows="4" cols="120" required></textarea>
					<div id="reply-submit">
					<input type="submit" value="등록">
					</div>

				</form>
			</td>
		</tr>
		<%} %>


		<!-- 버튼 -->
		<tr class="button-tr">
			<td align="center" colspan="2">
				<a href="orders.jsp?goods_no=<%=goodsdto.getGoods_no()%>">
					<input type="button"value="구매하기">
				</a> 
			
			<%if (interest) {%> 
				<a href="interestremove.do?goods_no=<%=goodsdto.getGoods_no()%>">
					<img src="../image/heart2.png" width="25" height="25">
				</a> 
			<%} else {%> 
				<a href="interest.do?goods_no=<%=goodsdto.getGoods_no()%>">
					<img src="../image/heart.png" width="25" height="25">
				</a> 
			<%}%> 
			<a href="goods_write.jsp">
				<input type="button" value="글쓰기">
			</a>
			
			<a href="goods_reply_write.jsp?goods_reply_superno=<%=goodsdto.getGoods_no()%>">
					<input type="button" value="답글쓰기">
			</a> 
			<%if (isAdmin || isMine) {%> <!-- 수정/삭제 버튼은 관리자이거나 본인 글에만 표시 --> 
 				<a href="goods_edit.jsp?goods_no=<%=goodsdto.getGoods_no()%>">
					<input type="button" value="수정">
				</a> 
				
				<a href="goods_delete.do?goods_no=<%=goodsdto.getGoods_no()%>">
					 <input type="button" value="삭제">
				</a> 
			<%}%> 
			<a href="goods_list.jsp">
				<input type="button" value="목록">
			</a>
		</td>
		</tr>
	</table>
 		
 		</div>
 	
 	
 	
 	</div>
 	


<jsp:include page="/template/footer.jsp"></jsp:include>