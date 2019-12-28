<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.PointDao"%>
<%@page import="semi.bean.PointDto"%>
<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>
<%@page import="semi.bean.GoodsFilesDao"%>
<%@page import="semi.bean.GoodsFilesDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("customer_id");
	int goods_no;
	if(request.getParameter("goods_no")==null){
		goods_no=0;
	}else{
		goods_no=Integer.parseInt(request.getParameter("goods_no"));
	}
	System.out.println(goods_no);
	CustomerDao cdao = new CustomerDao();
	CustomerDto cdto = cdao.get(id);
	int customer_no=cdto.getCustomer_no();
	GoodsDao gdao = new GoodsDao();
	GoodsDto gdto = gdao.get(goods_no);
	
	//첨부파일 불러오기

	GoodsFilesDao gfdao = new GoodsFilesDao();
	List<GoodsFilesDto> flist = gfdao.getList(goods_no);
	System.out.print(flist);

%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
function point_use(){
	var use_point = document.selectQuery('use_point');
}

</script>


<jsp:include page = "/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/orders.css">



 <div class="orders_wrap">
        <h2 class="goods_buy">상품 구매하기</h2>
       <!-- 구매할 상품 정보 -->	
      <div class="order_wrap1">
       <div class="order_table">
        <p class="ofont">구매번호:
		       <%if(gdto.getGoods_title()!=null){ %>
		           <%=gdto.getGoods_title() %>
		       <%}else{ %>	
		             -
		       <%} %></p>
       </div>
       <div class="order_table">
           <p class="ofont">상품번호:
           <%=gdto.getGoods_title() %>_<%=gdto.getGoods_no() %></p>
       </div>
       
       <div class="order_table">
        <p class="ofont">판매자:
       <%=gdto.getCustomer_id() %></p>
       </div>

<!--        <div class="row-multi col-2"> -->
<!--            <div class="row-multi col-2"> -->
               <div>
               <P>상품 이미지 </P>
      
                	<div class="orders_img">	
	<%if (flist.size() > 0) {%> 
 <!-- 첨부파일 출력줄 : 있을 때만 출력 -->

<article class="w-50">
	 <h2>상품 구매하기</h2>
	<!-- 구매할 상품 정보 -->	
	<div class="order_table">
	<%if(gdto.getGoods_title()!=null){ %>
		구매번호 : <%=gdto.getGoods_title() %>
	<%}else{ %>	
		구매번호 : -
	<%} %>
	</div>
	<div class="order_table">
		상품번호 : <%=gdto.getGoods_title() %>_<%=gdto.getGoods_no() %>
	</div>
	<div class="order_table">
		판매자 : <%=gdto.getCustomer_id() %>
	</div>
				<ul>
					<%
						for (GoodsFilesDto gfdto : flist) {
					%>
					<li>
						<!-- 미리보기 출력 --> <img
						src="download.do?no=<%=gfdto.getGoods_files_no()%>" width="200" height="150"> 
						<%=gfdto.getUploadname()%> (<%=gfdto.getFilesize()%>bytes)
					
												</li>
												<%
												}
											%>
									</ul>
								<%
								}
						%>
			</div>
		<br>
         
         
            <!--    <div class="order_table2">
                   <div class="order_table3"> -->
                    <p class="ofont" >판매물품:
                    <%=gdto.getGoods_title() %></p> 
                      </div>
                   
                   <div>
                    <p class="ofont">판매금액:
                       <%=gdto.getGoods_price() %>원</p> 
                    </div>
<!--           </div> -->
<!--                </div> -->
           <div>
            <p class="ofont">결제금액:
               <%=gdto.getGoods_price() %>원</p> 
           </div>
            </div>
    <!--    </div>
      </div>  -->
       <br><br>

   <form action="orders.do" method="get">
   <input type="hidden" name="customer_no" value="<%=cdto.getCustomer_no()%>">
   <input type="hidden" name="customer_point" value="<%=cdto.getCustomer_point() %>">
   <input type="hidden" name="final_amount" value="<%=gdto.getGoods_price()-cdto.getCustomer_point() %>">
   <input type="hidden" name="orders_goods_title" value="<%=gdto.getGoods_title()%>">
   <input type="hidden" name="orders_goods_seller" value="<%=gdto.getCustomer_id() %>">
   <input type="hidden" name="goods_no" value="<%=gdto.getGoods_no() %>">
       <div class="adrress_info">
          
           <div style="text-align: center;">
               <P class="info">배송지 정보</P>
             <label>직거래  <input type="radio" name="orders_type" value="직거래" required></label> 
             <label> Escrow 결제(중계)  <input type="radio" name="orders_type" value="배송" required></label> 
            </div>
               <div style="text-align: center;">
                   <ul>
                   <li class="orders_p">
                       <label class="ofont">우편번호</orders_label>
                       <input type="text" name="orders_post" id="sample6_postcode" placeholder="우편번호" readonly="readonly" required>
                       <input  class="post_button" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" required>
                   </li>
                   <li class="orders_addr">
                       <label  class="ofont">기본주소</label>
                       <input type="text" name="orders_basic_address" id="sample6_address" placeholder="기본주소"  readonly="readonly" required>
                   </liclass="orders_addr">
                   <li class="orders_addr">
                       <label  class="ofont">상세주소</label>
                       <input class="ex_addr" type="text" name="orders_extra_address" id="sample6_detailAddress" placeholder="상세주소" required>
                       <input class="e_address" type="text" id="sample6_extraAddress" placeholder="참고항목" readonly="readonly" required>
                   </li>		
                   </ul>		
               </div>
           </div>
           <br><br>
           <div style="text-align: center">
               <p class="info">결제 방법</p>
               <label  >신용카드
                   <input type="radio" name="orders_payment" value="신용카드" required></label>
               <label>실시간 계좌이체
                   <input type="radio" name="orders_payment" value="실시간 계좌이체" required></label>
               <label>무통장 입금
                   <input type="radio" name="orders_payment" value="무통장 입금" required></label>
               <label>만나서 결제
                   <input type="radio" name="orders_payment" value="만나서 결제" required></label>
           </div>
           <br><br>
           <div>
               <P class="info">사용할 포인트 정보</P>
               <P class="ofont2">사용 가능 포인트 : <input class="p_point" type="text"name=customer_point value=" <%=cdto.getCustomer_point() %>">

               <input class="point_button" onclick="true" id="use_point" type="button" value="사용하기"></p>
           </div>
           <div>
               <p class="ofont3">최종 결제 금액 : <%=gdto.getGoods_price()-cdto.getCustomer_point() %>원</p>
         
           </div>
           <br><br>
           <div class="orders_button" >
               <input type="submit"value="결제하기">
           </div>	
           
       
   </form>	
   </div>
 
<jsp:include page = "/template/footer.jsp"></jsp:include>