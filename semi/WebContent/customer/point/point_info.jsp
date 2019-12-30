<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.CustomerDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.PointDto"%>
<%@page import="semi.bean.PointDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("customer_id");
	CustomerDao cdao = new CustomerDao();
	CustomerDto cdto = cdao.get(id);
	

	PointDao dao = new PointDao();
	int no = cdto.getCustomer_no();
	List<PointDto> plist = dao.get(no);	
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<script>
function check(){
    // confirm() : 확인창 확인/취소
        var choice = window.confirm("삭제하시겠습니까?");
        console.log(choice);
        if(choice){
        	location.replace="/semi"
        }
    }
</script>

<article id="point_wrap">

        

         <header id="pointdetail_header">

            <h2 class="point_title">포인트 내역</h2>    			

        </header>

    <div class="pointdetail_wrap">

        <div class="pwrap1">

            <ul>

                <label>보유포인트</label>

                <li>

                    <img src="<%=request.getContextPath()%>/image/pointicon.jpg">

                    <%=cdto.getCustomer_point() %>

                    point

                </li>

            </ul>

        </div>

        <div class="pwrap2">

            <ul>

                <label>회원 등급</label>

                <li>

                    <%if(cdto.getCustomer_grade().equals("오렌지")){ %>

				<img src="<%=request.getContextPath()%>/image/grade/orange2.jpg" width = "40px" height="40px">

		<%}else if(cdto.getCustomer_grade().equals("브론즈")){ %>

				<img src="<%=request.getContextPath()%>/image/grade/bronze.jpg" width = "40px" height="40px">

		<%}else if(cdto.getCustomer_grade().equals("실버")){ %>

				<img src="<%=request.getContextPath()%>/image/grade/silver.png" width = "40px" height="40px">

		<%}else if(cdto.getCustomer_grade().equals("골드")){ %>

				<img src="<%=request.getContextPath()%>/image/grade/gold.png" width = "40px" height="40px">

		<%}else{ %>

				<img src="<%=request.getContextPath()%>/image/grade/administrator.jpg" width = "40px" height="40px">

		<%} %>

		<%=cdto.getCustomer_grade() %>

                </li>

            

            </ul>

        </div>

           

    </div>

        

     

    <div class="point_list_wrap">

		 <table class="point_list">

	       

	            <thead>	

					<tr>

						<th>구분</th>      

	                    <th>적립/사용일</th>

	                    <th>적립/사용내용</th>

	                    <th>적립/사용포인트</th>

                        <th></th>

	                </tr>

				</thead>

				

				<tbody align="center">	

                    <%for(PointDto dto : plist){ %>

		              <%if(dto.getPoint_save_details() != null){ %>

						<tr>

							<td>

                                적립

							</td>

							<td>

                                <%=dto.getPoint_save_dateWithFormat() %>

							</td>

							<td>

                                <%=dto.getPoint_save_details() %>

							</td>

                            <td>

                                <%=dto.getPoint_save() %>

                            </td>

							<td><input type="button" value="삭제" onclick="check();">

							</td>

				

						</tr>

                    <%}else{ %>

                        <tr>

							<td>

                                사용

							</td>

							<td>

                                <%=dto.getPoint_save_dateWithFormat() %>

							</td>

							<td>

                                <%=dto.getPoint_save_details() %>

							</td>

                            <td>

                                <%=dto.getPoint_save() %>

                            </td>

							<td><input type="button" value="삭제" onclick="check();">

							</td>

				

						</tr>

                        <%} %>

	                   <%} %>

				</tbody>

		</table>

	</div>

               

        <!-- 테스트용 버튼키 -->

        <div class="point_test">

           <div>test </div>

        <div>

            <form action ="point_save.do" method="post">

            <input type="hidden" name="customer_no" value="<%=cdto.getCustomer_no()%>">

            <input type="text" name="point_save" placeholder="적립포인트" required>

            <input type="submit" value="적립하기">

        </form>

        </div> 

        <div>

        <form action ="point_use.do" method="post">

            <input type="hidden" name="customer_no" value="<%=cdto.getCustomer_no()%>">

            <input type="text" name="point_use" placeholder="사용포인트" required>

            <input type="submit" value="사용하기">

        </form>

        </div>

        </div>

        </article>

    

    

    

<jsp:include page="/template/footer.jsp"></jsp:include>