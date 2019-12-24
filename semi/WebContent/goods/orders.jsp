<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@page import="semi.bean.PointDao"%>
<%@page import="semi.bean.PointDto"%>
<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("customer_id");
	int goods_no=Integer.parseInt(request.getParameter("goods_no"));
	CustomerDao cdao = new CustomerDao();
	CustomerDto cdto = cdao.get(id);
	int customer_no=cdto.getCustomer_no();
	GoodsDao gdao = new GoodsDao();
	GoodsDto gdto = gdao.get(goods_no);
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

<style>
	.order_table{
		text-align: right;
	}
	.order_table2{
		margin-top:10px;
	}
	.order_table3{
		text-align: left;
	}
	.order_table4{
		margin-top:40px;
		text-align: right;
	}
</style>
<jsp:include page = "/template/header.jsp"></jsp:include>
<article class="w-50">
	
	<!-- 구매할 상품 정보 -->	
	<div class="order_table">
		구매번호 : <%=gdto.getGoods_title() %>
	</div>
	<div class="order_table">
		상품번호 : <%=gdto.getGoods_title() %>_<%=gdto.getGoods_no() %>
	</div>
	<div class="order_table">
		판매자 : <%=gdto.getCustomer_id() %>
	</div>
	<div class="row-multi col-2">
		<div class="row-multi col-2">
			<div>
				<img id = "product_sell" src = "../image/pointicon.jpg" width="80px" height="80px">
			</div>
			<div class="order_table2">
				<div class="order_table3">판매 물품명 : <%=gdto.getGoods_title() %></div>
				<div class="order_table3">판매 금액 : <%=gdto.getGoods_price() %></div>
			</div>
		</div>
		<div class="order_table4">
			결제 금액 : <%=gdto.getGoods_price() %>
		</div>
	</div>
	
	<!-- 구매할 상품 정보 -->
<form action="" method="get">
	<div>
		<div>배송지 정보<br>
			직거래<input type="radio" name="order_method" value="direct" required>
			Escrow 결제(중계)<input type="radio" name="order_method" value="escrow" required>
			<div>
				<ul>
				<li>
					<label>우편번호</label>
					<input type="text" name="customer_post" id="sample6_postcode" placeholder="우편번호" readonly="readonly" required>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" required>
				</li>
				<li>
					<label>기본주소</label>
					<input type="text" name="customer_basic_address" id="sample6_address" placeholder="기본주소"  readonly="readonly" required>
				</li>
				<li>
					<label>상세주소</label>
					<input type="text" name="customer_extra_address" id="sample6_detailAddress" placeholder="상세주소" required>
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" readonly="readonly" required>
				</li>		
				</ul>		
			</div>
		</div>
		<div>결제 방법<br>
			<label>신용카드</label>
				<input type="radio" name="buy_method" value="신용카드" required>
			<label>실시간 계좌이체</label>
				<input type="radio" name="buy_method" value="계좌이체" required>
			<label>무통장 입금</label>
				<input type="radio" name="buy_method" value="무통장" required>
			<label>만나서 결제</label>
				<input type="radio" name="buy_method" value="직거래" required>
		</div>
		
		<div>사용할 포인트 정보<br>
			사용 가능 포인트 : <%=cdto.getCustomer_point() %>
			<input onclick="true" id="use_point" type="button" value="사용하기">
		</div>
		<div>
			최종 결제 금액 : <%=gdto.getGoods_price()-cdto.getCustomer_point() %>
		</div>
		<div>
			<input type="submit" value="결제하기">
		</div>	
		
	</div>
</form>	
</article>
<jsp:include page = "/template/footer.jsp"></jsp:include>