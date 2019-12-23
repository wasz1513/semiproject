<%@page import="semi.bean.GoodsFilesDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.bean.GoodsFilesDao"%>
<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>
<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("customer_id");

	CustomerDao cdao = new CustomerDao();
	CustomerDto cdto = cdao.get(id);
	
	GoodsDao gdao = new GoodsDao();
	int goods_no = Integer.parseInt(request.getParameter("goods_no"));
	gdao.get(goods_no);
	GoodsDto gdto = gdao.get(goods_no);
	
	//썸네일
	String file = request.getParameter("file");
	GoodsFilesDao gfdao = new GoodsFilesDao();

%>


<jsp:include page = "/template/header.jsp"></jsp:include>
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


</script>


<article class="w-50">
	<form action="orders.do" method="post">
	
	<table>
		<thead>
			<tr>
				<th width="700px">상품정보</th>			
				<th>판매자</th>
			</tr>
		</thead>
		<tbody>
			<tr>					
			
				<td>
					 <a href="goods_content.jsp?goods_no=<%=gdto.getGoods_no()%>">
						 <img src="download.do?no=<%=gfdao.get(gdto.getGoods_no())%>"  width="100" height="100">
					 </a>
					<%=gdto.getGoods_title()%>
				</td>
			
				<td>
					<%=gdto.getCustomer_id()%>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div>
		<h5>배송지 정보</h5>
		<input type ="radio" >
		<label>직거래</label>
		<input type ="radio" >
		<label>배송</label>
		<div>
			<ul>
				<li>
					<label>우편번호</label>
					<input type="text" name="customer_post" id="sample6_postcode" value="<%=cdto.getCustomer_post()%>" readonly="readonly">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				</li>
				<li>
					<label>기본주소</label>
						<input type="text" name="customer_basic_address" id="sample6_address" value="<%=cdto.getCustomer_basic_address()%>"  readonly="readonly">
				</li>
				<li>
					<label>상세주소</label>
						<input type="text" name="customer_extra_address" id="sample6_detailAddress" value="<%=cdto.getCustomer_extra_address()%>">
				</li>
				<li>
						<input type="text" id="sample6_extraAddress" placeholder="참고항목" readonly="readonly">
				</li>
<!-- 				<li> -->
<!-- 					<input type ="radio" > -->
<!-- 					<label>신규배송지</label> -->
<!-- 				</li> -->
			</ul>
		</div>	
	</div>
	
	<div>
		<h5>결제 방법</h5>	
		<input type="radio">
		<label>신용카드</label>
		<input type="radio">
		<label>실시간 계좌이체</label>
		<input type="radio">
		<label>무통장 입금</label>
		<input type="radio">
		<label>만나서 결제</label>
	</div>
	<div>
		<h5>최종 결제 금액</h5>
		<%=gdto.getGoods_price() %>원
	</div>
	<div>
		<input type="button" value="결제하기">
	</div>
	
	</form>

</article>











<jsp:include page = "/template/footer.jsp"></jsp:include>
