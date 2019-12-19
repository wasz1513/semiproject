<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%
   String type =request.getParameter("type");
   String keyword = request.getParameter("keyword");
   boolean isSearch = type != null && keyword != null;
   int pno = Integer.parseInt(request.getParameter("pno"));
   int count = Integer.parseInt(request.getParameter("count"));
   int navisize= Integer.parseInt(request.getParameter("navisize"));
	int pagesize = Integer.parseInt(request.getParameter("pagesize"));
	int pagecount = (count + pagesize) / pagesize;
	int startblock = (pno - 1) / navisize * navisize + 1;
	int finishblock = startblock + (navisize - 1);
	//만약 마지막 블록이 페이지 수보다 크다면 수정 처리
	if(finishblock > pagecount){
		finishblock = pagecount;
	}
   
   %>
     

    
    		<!-- 네비게이터 -->
   
   	 
   	 <%if(startblock >1){ %>
   	 	<%if(isSearch){ %>
   	 <a href="<%=request.getRequestURI() %>?type=<%=type %>&keyword=<%=keyword%>&pno=<%=startblock -1%>">[이전]</a>
   	 		<%}else{ %>
   	 <a href="<%=request.getRequestURI() %>?pno=<%=startblock -1%>">[이전]</a>
   	 	<%} %>
   	  <%} %>
   	  
   	  
   	 <%for(int i = startblock ; i <= finishblock; i++) {%>
   	 <%if( i == pno){ %>
   	 <%=i %>
   	 <%}else{ %>
   	 	<%if(isSearch){ %>
   		<a href="<%=request.getRequestURI() %>?type=<%=type %>&keyword=<%=keyword%>&pno=<%=i%>"><%=i%></a>
   		<%}else{ %>
   		<a href="<%=request.getRequestURI() %>?pno=<%=i%>"><%=i%></a> 
   			 	<%} %>
   	 		<%} %>
   	 	<%} %>
   	 	
   	 	  
   	 <%if(finishblock < pagecount){ %>
   	 <%if(isSearch){ %>
   	<a href="<%=request.getRequestURI() %>?type=<%=type %>&keyword=<%=keyword%>&pno=<%=finishblock +1%>">[다음] </a>
   	 <%}else{ %>
   	 	<a href="<%=request.getRequestURI() %>?pno=<%=finishblock +1%>">[다음] </a>
   		 <%} %>
   	 <%} %>
   	
    
  
    
    
    