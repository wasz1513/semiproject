<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="semi.bean.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="java.awt.PageAttributes.OriginType"%>
<%@page import="semi.bean.ReplyDao"%>
<%@page import="semi.bean.BoardDto"%>
<%@page import="semi.bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	//int Origin = Integer.parseInt(request.getParameter("Origin"));

	BoardDao bdao = new BoardDao();
	BoardDto bdto = bdao.get(no);
	

	
	String userId = (String)session.getAttribute("customer_id");
	String grade = (String)session.getAttribute("customer_grade");
	
	boolean isMine = userId.equals(bdto.getWriter());//사용자ID == 작성자ID
	boolean isAdmin = grade.equals("관리자");//사용자권한==관리자
	
	//추가 : Set<Integer> 형태의 저장소를 이용하여 이미 읽은 글은 조회수 증가를 방지
	//[1] 세션에 있는 저장소를 꺼내고 없으면 신규 생성한다.
	Set<Integer> memory = (Set<Integer>)session.getAttribute("memory");
	//memory가 없는 경우에는 null 값을 가진다
	if(memory == null){
		memory = new HashSet<>();
	}
	//[2] 처리를 수행한다.
	boolean isFirst = memory.add(no);
	System.out.println(memory);
	
	//[3] 처리를 마치고 저장소를 다시 세션에 저장한다
	session.setAttribute("memory", memory);
	
	//남의글이라면 == !isMine
	//처음읽는 글이라면 == isFirst
	if(!isMine && isFirst){
		bdto.setReadcount(bdto.getReadcount() + 1);
		bdao.cu(no);//조회수 증가
	}
	
	ReplyDao rdao = new ReplyDao();
	List<ReplyDto> list = rdao.getList(no);
	
	
%>


<jsp:include page="/template/header.jsp"></jsp:include>




<div align="center">

	<body>
    <br><br>
    <div class="board_content_wrap" align="center">
              
    
   <table border="1" width="60%">
       <div class="board_content_body">
       <tr>
           <td><%=bdto.getTitle()%></td>
       </tr>
       <tr>
           <td><%=bdto.getWriter()%></td>
       </tr>
       <tr height="200">
           <td valign="top"><%=bdto.getContent()%></td>
       </tr>
       <tr>
           <td align="right">댓글수 <%=bdto.getReplycount()%> 조회수 <%=bdto.getReadcount()%>
           </td>
       </tr>
    
       
       <tr>
           <td align="right">
               <a href="write.jsp">
                   <input type="button" value="글쓰기" style="height:30px; width:50px;">
               </a>
               <a href="edit.jsp?no=<%=no%>">
                   <input	type="button" value="수정" style="height:30px; width:50px;">
               </a> 
               <a href="delete.do?no=<%=no%>">
                   <input type="button" value="삭제" style="height:30px; width:50px;">
               </a>
               <a href="list.jsp">
                   <input type="button" value="목록" style="height:30px; width:50px;">
               </a>
           </td>
       </tr>
    </div>
</table>   
</table>
        
  
   <!-- 댓글 목록  -->
   
   <tr>
   <td>
   <table border="1" width="60%">
   <%for(ReplyDto rdto : list){ %>
   <tr>
   <th width="100">
   <img src="http://placehold.it/100x100">
   </th>
   <td>
       <%=rdto.getWriter()%>
       <%if(bdto.getWriter().equals(rdto.getWriter())) %>
       <font color="red">(작성자)</font>
       
       <%=rdto.getWdate()%>
       답글    	
       <%if(userId.equals(rdto.getWriter())){%>
       <a href="#">수정</a>
       <a href="reply_delete.do?no=<%=rdto.getNo()%>&origin=<%=bdto.getNo()%>">삭제</a>
       <br><br>
       <%} %>
       <%=rdto.getContent()%>
       </td>
       </tr>
       <%} %>
       </table>
     <!-- 댓글 작성 -->
       <tr>
           <td align="right" >
           
           <form action="reply_insert.do" method="post">
           
<!-- 			게시글번호 -->
			
           <input type="hidden" name="origin" value="<%=no%>">
           
           <textarea name="content" rows="5" cols="188" align="center" required></textarea>
           <input type="submit" value="등록" style="height:50px; width:70px;">
           
           
           </form>
           
           </td>
       </tr>
    </div>
    
    
</div>
</body>
</html>




<jsp:include page="/template/footer.jsp"></jsp:include>