<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/regist.css"> 
<form action="find.do" method="post">
	 <div id="idfind">
            <header id="idfind_header">
                <h2 class="idfind_title">아이디 찾기</h2>    			
            </header>
           
            <div class="idfind_wrap">
                <div class="idfind_name">
                    <label>이름</label>
                    <input type="text" name="customer_name" required>
                </div>
                <div class="idfind_phone">
                    <label>휴대폰번호</label>
                    <input type="text"  name ="customer_phone" required>
                </div>
            
                <div class="idfind_btn">
                    <input type="submit" value="확인">
                </div>
                <div>
                    <a href="<%=request.getContextPath()%>/customer/login.jsp">로그인</a>
                    <span>|</span>
                    <a href="<%=request.getContextPath()%>/customer/find_pw.jsp">비밀번호 찾기</a>
                </div>

            </div>
    </div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>