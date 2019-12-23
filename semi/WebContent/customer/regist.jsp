<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page ="/template/header.jsp"></jsp:include>
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


//첨부파일 이미지 미리보기
        //target은 이벤트가 발생한 태그의 정보가 들어가는 변수
        function previewImage(target){
            
            //[1] target에 선택된 파일의 목록을 불러온다.
            // - 구조상 파일선택은 복수개가 가능하다(현재는 불가)
            // - 따라서 target.files는 배열의 형태를 띈다(0번 인덱스만 사용)
            //console.log(target.files);
            //[2] 선택된 파일이 있는지 확인한 뒤 읽기 작업 실행
            // - 목록이 있는지 검사하고 있다면 0번 인덱스에 파일이 있는지 검사
            // - 파일을 선택하지 않아도 이벤트가 발생하기 때문에 문제를 사전 차단
            
            if(target.files && target.files[0]){
                
                //[3] 읽기 도구 생성(자바스크립트 내장형태)
                var reader = new FileReader();
                //[4] 읽기 완료시 할 작업을 예약 설정(콜백이라 부름)
                reader.onload = function(data){//data는 읽은 파일의 정보
                    //[6] 파일 읽기가 완료되면 내용을 img 태그의 src에 설정
                    // - 상황에 맞게 본인이 원하는 대상으로 변경하여 사용
                    var img = document.querySelector("#preview");
                    img.src = data.target.result;
                    
                }
                //[5] 실제 읽기 명령을 수행
                reader.readAsDataURL(target.files[0]);
            }
        }
</script>

 
	<form action = "regist.do" method="post" enctype="multipart/form-data">
		
		<article class = "w-40">
			
			<div>
			
				<h2>회원 가입</h2>
				<div class="row-multi col-2">
					<div class="col-2-first">
						<div>
							<img id="preview" src="http://placehold.it/100x100" width="100" height="100">
						</div>
						<div>
							<input type="file" name="file" accept=".jpg, .png, .gif" onchange="previewImage(this);">
						</div>
					</div>
					<div class="col-2-second">
						<div>
							<label for="id">아이디</label>
							<input id="id" type="text" name ="customer_id" required>
						</div>
						<div>
							<label for="pw">비밀번호</label>
							<input type="password" name ="customer_pw" required>
						</div>
						<div>
							<label>이름</label>
							<input type="text" name ="customer_name" required>
						</div>
						<div>
							<label>닉네임</label>
							<input type="text" name ="customer_nickname" required>
						</div>
					</div>
				</div>
				<div>
					<label>생년월일</label>
					<input type="text" name ="customer_birth" placeholder="생년월일" required>
				</div>
<!-- 				<div> -->
<!-- 					<input type="text" placeholder="월" required> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<input type="text" placeholder="일" required> -->
<!-- 				</div> -->
				<div>
					<label>이메일</label>
					<input type="text" name ="customer_email" required>
				</div>
				<div>
					<label>휴대폰번호</label>
					<input type="text"  name ="customer_phone" required>
				</div>
				<div>
					<label>우편번호</label>
					<div>
						<input type="text" name="customer_post" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</div>
				</div>
				<div>
						<input type="text" name="customer_basic_address" id="sample6_address" placeholder="기본주소"  readonly="readonly">
				</div>
				<div>
						<input type="text" name="customer_extra_address" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목" readonly="readonly">
				</div>
				
				<div>
					<input type="submit" value="가입하기">	
				</div>
			
			</div>
		
		</article>
	
	</form>
      
    
    
    
    
<jsp:include page ="/template/footer.jsp"></jsp:include>
    