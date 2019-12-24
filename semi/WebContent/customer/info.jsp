<%@page import="java.util.List"%>
<%@page import="semi.bean.CustomerFilesDto"%>
<%@page import="semi.bean.CustomerFilesDao"%>
<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String customer_id = (String)session.getAttribute("customer_id");
	CustomerDao dao = new CustomerDao();
	CustomerDto dto = dao.get(customer_id);
	
	CustomerFilesDao fdao = new CustomerFilesDao();
	List<CustomerFilesDto> flist = fdao.getList(dto.getCustomer_no());
%>

<jsp:include page="/template/header.jsp"></jsp:include>

    
    <article class ="w-40">
    	
    	<div>
    		
    		<h2><%=dto.getCustomer_name()%>님의 회원 정보</h2>
    			<div class="row-multi col-2">
    				<div class="col-2-first">
    				<%if(flist.size()>0) {%>
    					<%for(CustomerFilesDto fdto : flist){ %>
    						<img src="download.do?no=<%=fdto.getCustomer_files_no()%>" width="100" height="100">
    						<%=fdto.getCustomer_files_no() %>
    					<%} %>
    				<%}else{ %>
    					<img src="http://placehold.it/100x100">
    				<%} %>
    				</div>
    				<div class="col-2-first">
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
							<a href="<%=request.getContextPath()%>/customer/point/point_info.jsp">포인트</a>
							<%=dto.getCustomer_point()%>
						</div>
    				</div>
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
