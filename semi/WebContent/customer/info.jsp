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

    
  	
    <div id="info">

        <header id="header">
            <h2 class="info_title"><%=dto.getCustomer_name()%>님의 회원 정보</h2>    			
        </header>
        
        <div class="info_wrap">
        <table  class="info_table" >
            <tr>
                <th>프로필</th>
                <td>
                    <%if(flist.size()>0) {%>
                        <%for(CustomerFilesDto fdto : flist){ %>
                            <img src="download.do?no=<%=fdto.getCustomer_files_no()%>" width="100" height="100">
                            <%} %>
                        <%}else{ %>
                            <img src="http://placehold.it/100x100">
                        <%} %>
            </tr>
            <tr>
                <th width="25%">아이디</th>
                <td><%=dto.getCustomer_id()%></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><%=dto.getCustomer_name()%></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td><%=dto.getCustomer_nickname()%></td>
            </tr>
            <tr>
                <th>등급</th>
                <td><%=dto.getCustomer_grade()%></td>
            </tr>
            <tr>
                <th>포인트</th>
                <td><a href="<%=request.getContextPath()%>/customer/point/point_info.jsp"></a>
                    <%=dto.getCustomer_point()%>p</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><%=dto.getCustomer_phone()%></td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <%=dto.getCustomer_address()%>
                </td>
            </tr>
            <tr>
                <th>가입일</th>
                <td><%=dto.getCustomer_joindateWithFormat()%></td>
            </tr>
            <tr>
                <th>최종로그인</th>
                <td><%=dto.getCustomer_lastloginWithFormat()%></td>
            </tr>
        </table>
                <div class="info_bottom">
                    <li>- 아이디, 이름은 수정이 불가능합니다.</li>
                    <li>- 닉네임은 변경 후 1개월간 재변경이 불가능합니다.</li>
                    <li>- 이메일, 휴대전화 번호 변경 시 반드시 인증을 거쳐야 합니다.(중고장터의 사기방지 조치)</li>
                </div>
                <div class="info_btn">
                        <a href="#"><input class="sellproduct" type="submit" value="판매중인 물품보기"></a>
                        <a href="check_pw.jsp?go=/customer/change_pw.jsp"><input class="change_password" type="submit" value="비밀번호 변경"></a>
                        <a href="check_pw.jsp?go=/customer/change_info.jsp"><input class="change_info" type="submit" value="회원정보 수정">	</a>
                        <a href="check_pw.jsp?go=/customer/customer_withrawal.do"><input class="withdraw" type="submit" value="탈퇴"></a>
                </div>
      </div>  
    </div>


<jsp:include page="/template/footer.jsp"></jsp:include>
