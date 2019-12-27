<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page ="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/regist.css"> 
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
	<div id="regist">

        <header id="regist_header">
            <h2 class="regist_title">회원가입</h2>    			
        </header>
        
        <div class="regist_wrap">
        <table  class="regist_table" width="800">
            <tr>
                <td>
                    <div class="inputlabel">
                        <label for="id">아이디</label>
                    </div>
                    <input id="id" type="text" name ="customer_id" required>
                    <button class="regist_button2">중복확인</button>
                    <h5 class="inputtext"><font color="#666">*영문, 숫자, 특수문자 조합, 6자 이상 15자 이하</font></h5>
                    
                </td>  
                <td rowspan="2">
                    <div class="inputlabel">
                    <label>프로필(선택)</label>
                    </div>
                    <img id="preview" src="http://placehold.it/200x200" width="120" height="120"><br>
                    <input type="file" name="file" accept=".jpg, .png, .gif" onchange="previewImage(this);">
                </td>
                </tr>
            <tr>
                <td class="pwline">
                    <div class="inputlabel">
                    <label for="pw">비밀번호</label>
                    </div>
                    <input id="pw" type="password" name ="customer_pw" required>
                    <h5 class="inputtext"><font color="#666">*영문, 숫자, 특수문자 조합, 8자 이상 12자 이하</font></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="inputlabel">
                    <label>이름</label>
                    </div>
                    <input type="text" name ="customer_name" required>
                </td>
                <td>
                    <div class="inputlabel">
                    <label>닉네임</label>
                    </div>
                    <input type="text" name ="customer_nickname" required>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="inputlabel">
                    <label>생년월일</label>
                    </div>
                    <input type="text" name ="customer_birth" required>
                    <h5 class="inputtext"><font color="#666">*8자리 ex) 900101</font></h5>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="inputlabel">
                    <label>주소</label>
                    </div>
                    <div class="postbtn">
						<input type="text" class="a" name="customer_post" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
						<input type="button" class="regist_button2" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    </div>
						<input type="text" class="b" name="customer_basic_address" id="sample6_address" placeholder="기본주소"  readonly="readonly">
						<input type="text" class="b" name="customer_extra_address" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" class="a" id="sample6_extraAddress" placeholder="참고항목" readonly="readonly">
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="inputlabel">
                    <label>이메일<br></label>
                    </div>
                    <input type="text" name ="customer_email" required>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="inputlabel">
                    <label>휴대폰번호<br></label>
                    </div>
                    <input type="tel"  name ="customer_phone" required>
                    <h5 class="inputtext"><font color="#666">* ' - '표시 없이 11자리</font></h5>

                </td>
            </tr>
        </table>
        <div class="regist_bottom">
            <input class="regist_button" type="submit" value="회원가입">	
            <input class="regist_button" type="reset" value="초기화">	
        </div>		
      </div>  
    </div>

	</form>
      
    
    
    
    
<jsp:include page ="/template/footer.jsp"></jsp:include>
    