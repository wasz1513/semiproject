<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String error = request.getParameter("error");
    
    %>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="find_pw.do" method="post">

    <div id="pwfind">

        <header id="pwfind_header">
            <h2 class="pwfind_title">비밀번호 찾기</h2>    			
        </header>
<div class="pwfind_wrap">
<div class="pwfind_type">

    <ul class="phone_find">
        <h4 class="pw_subtitle">핸드폰 번호로 찾기</h4>
            <div>
              <label>이름</label> 
             <input type="text" name="customer_name" required>
            </div>
            <div>
                <label>아이디</label> 
                 <input type="text" name="customer_id" required>
            </div>
            <div>
                <label>휴대폰 번호</label> 
                  <input type="text" name="customer_phone" required>
            </div>
        
 
                <input type="submit" value="찾기">
        </ul>
    </form>

    <form action="find_pw.do" method="post">

        <ul class="email_find">

        <h4 class="pw_subtitle">이메일로 찾기</h4>
            <div>
                <label>이름</label> 
                 <input type="text" name="customer_name" required>
            </div>
            <div>
                <label>아이디</label> 
                <input type="text" name="customer_id" required>
            </div>
            <div>
                <label>이메일</label> 
                <input type="email" name="customer_email" required>
            </div>
            </form>
          
            <input type="submit" value="찾기">
     	     
    </ul>
      
</div>
 				<%if(error!=null){ %>
   					<h4 class="pwfind_inputerror"><font color = "red"> 입력하신 정보가 일치하지 않습니다.</font></h4>
   	    	 	<%} %>
            <div class="login_idfind">
                <a href="<%=request.getContextPath()%>/customer/login.jsp">로그인</a>
                <span>|</span>
                <a href="<%=request.getContextPath()%>/customer/find.jsp">아이디 찾기</a>
            </div>
            
    </div>
</div>
		
		
		
		
		
<jsp:include page="/template/footer.jsp"></jsp:include>