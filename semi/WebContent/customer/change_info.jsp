<%@page import="semi.bean.CustomerFilesDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.CustomerFilesDao"%>
<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("customer_id");
CustomerDao dao = new CustomerDao();
CustomerDto dto = dao.get(id);

CustomerFilesDao fdao = new CustomerFilesDao();
List<CustomerFilesDto> flist = fdao.getList(dto.getCustomer_no());
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<h1>회원정보 수정</h1>
<form action="change_info.do" method="post" enctype="multipart/form-data">
<!-- get 메소드 추가시 input에 placeholder를 dto.get으로 가져와야함. -->
	<div class="row-multi col-2">
		<div class="col-2-first">
					<%if(flist.size()>0) {%>
    					<%for(CustomerFilesDto fdto : flist){ %>
    						<img src="download.do?no=<%=fdto.getCustomer_files_no()%>" width="100" height="100">
    					<%} %>
    				<%}else{ %>
    					<img src="http://placehold.it/100x100">
    				<%} %>
    				<input type="file" name="file" accept=".jpg, .png, .gif">
		</div>
		<div class="col-2-second">
			<div>
				 아이디 : <%=dto.getCustomer_id() %>
			</div>
			<div>
				 이름 : <%=dto.getCustomer_name() %>
			</div>
			<div>
				닉네임 : <input type="text" name="customer_nickname" value="<%=dto.getCustomer_nickname()%>">
			</div>
			<div>
				포인트 : <%=dto.getCustomer_point()%>
						
			</div>
		</div>
	</div>
	<div>
		폰번호 : <input type="text" name="customer_phone" value="<%=dto.getCustomer_phone() %>">
	</div>
		<div>
		이메일 : <input type="text" name="customer_email" value="<%=dto.getCustomer_email() %>">
	</div>
	<div>
		우편번호 : <input type="text" name="customer_post" value="<%=dto.getCustomer_post() %>">
	</div>
	<div>
		기본주소 : <input type="text" name="customer_basic_address" value="<%=dto.getCustomer_basic_address() %>">
	</div>
	<div>
		상세주소  : <input type="text" name="customer_extra_address" value="<%=dto.getCustomer_extra_address() %>">
	</div>
		<div>
		<input type="reset" value="초기화">
		<input type="submit" value="수정">
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>