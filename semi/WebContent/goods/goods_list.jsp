<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    //페이지 크기
    	int pagesize = 28;
    	int navisize = 10;
    	
    	
    	//페이징 추가
  	int pno;
    try{
    	pno = Integer.parseInt(request.getParameter("pno"));
    	if(pno <=0) throw new Exception();
    }
    catch(Exception e){
    	pno = 1;
    }
    
    
    	int finish = pno * pagesize;
    	int start = finish - (pagesize -1);
    	
    	String type = request.getParameter("type");
    	String keyword = request.getParameter("keyword");
  
    	
    	
    	
    	
    	
    	
    	boolean isSearch = type != null && keyword != null;
    	
    	GoodsDao dao = new GoodsDao();
    	
   		 List<GoodsDto> list;
   		 
    	if(isSearch){
    		list = dao.search(start , finish ,type , keyword);
    	}
    	else{
    		list  = dao.getList(start , finish);
    	}
    	
    	
    	int count = dao.getCount(type , keyword);
    	
    %>
    
    
    
    
    
<jsp:include page="/template/header.jsp"></jsp:include>

    <style>
        
        *{
            box-sizing: border-box;
        }
        
        .gallary::after{
            content: "";
            display: block;
            clear: both;
        }
    
        .gallary > .gallary-item{
            float: left;
            width: 25%;
            padding: 10px;
            }
        
        .gallary > .gallary-item img{
            width: 100%;
        }
        
        
/*        폭이 720px 이하면 2단으로 표시*/
        @media screen and (max-width:720px){
            
            .gallary > .gallary-item{
                width: 50%;
            }
            
        }
        
        
        
        @media screen and (max-width:540px){
            
            .gallary > .gallary-item{
                width: 100%;
            }
            
        }
        
    </style>
    
<article>

    <div align="center">
   		<h2>상품리스트</h2>
   		</div>
   	

    <div class="gallary">
        <%for(GoodsDto dto : list){ %>
        <div class="gallary-item">
            <img src="http://placehold.it/200x200">
            		<h4>카테고리 :  <%=dto.getGoods_category() %></h4>
      				<h3>제목:<%=dto.getGoods_title() %></h3>
      				<h5>동네 : rn=<%=dto.getRn() %></h5>
      				<h3>가격 : <%=dto.getGoods_price() %></h3>
      				<div align="right">조회수 : <%=dto.getGoods_readcount() %> 댓글 : <%=dto.getGoods_replycount() %></div>
      				
             </div>
        <%} %>
        
	</div>
        <div align="center" >
					<a href="goods_write.jsp">
					<input  class="btn" type="button" value="상품 등록하기">
					</a>
		</div>


<br>

        <div align="right">

		<form action="goods_list.jsp" method="get">
		
			<select name="type" class="input-item">
				<option value="goods_title">제목</option>
				<option value="goods_category">카테고리</option>
			</select>
			
			<input class="input-item" type="search" name="keyword" placeholder="검색어" required>
			
			<input class="btn" type="submit" value="검색">
			
		</form>
		
   	 
							<!-- 네비게이터 -->
							 <div align="center">
   	 <jsp:include page="/template/navigator.jsp">
   	 	<jsp:param name="pno"  value="<%=pno %>" />
   	    <jsp:param name="count"  value="<%=count %>" />
   	    <jsp:param name="navisize"  value="<%=navisize %>" />
   	    <jsp:param name="pagesize" value="<%=pagesize %>" />
   	 </jsp:include>
   	   </div> 
    
	</div>
	<br>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>