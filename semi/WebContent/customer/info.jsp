<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String customer_id = (String)session.getAttribute("customer_id");
	CustomerDao dao = new CustomerDao();
	CustomerDto dto = dao.get(customer_id);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

    
    <article class ="w-40">
    	
    	<div>
    		
    		<h2><%=dto.getCustomer_name()%>님의 회원 정보</h2>
    		<div>
    			아이디
				<%=dto.getCustomer_id()%>
    		</div>
		
			<div>
				이름
				<%=dto.getCustomer_name()%>
			</div>
			
			<div>
				등급
				<%=dto.getCustomer_grade()%>
			</div>
			
			<div>
				전화번호
				<%=dto.getCustomer_phone()%>
			</div>
		
			<div>
				이메일
				<%=dto.getCustomer_email()%>
			</div>
			
			<div>
				주소
				<%=dto.getCustomer_address() %>
			</div>
		
			<div>
				가입일
				<%=dto.getCustomer_joindateWithFormat()%>
			</div>
		
			<div>
				최종로그인
				<%=dto.getCustomer_lastloginWithFormat()%>
			</div>

    		<div>
    				<a href="check_pw.jsp?go=/customer/change_pw.jsp"><input type="submit" value="비밀번호 변경"></a>
					<a href="check_pw.jsp?go=/customer/change_info.jsp"><input type="submit" value="회원정보 수정">	</a>
					<a href="check_pw.jsp?go=/customer/customer_withrawal.do"><input type="submit" value="회원탈퇴"></a>
				</div>
    </div>    
    
    </article>
    

<jsp:include page="/template/footer.jsp"></jsp:include>
