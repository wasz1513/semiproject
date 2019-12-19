<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page ="/template/header.jsp"></jsp:include>
    
    
  
	<form action = "regist.do" method="post" enctype="multipart/form-data">
		
		<article class = "w-40">
			
			<div>
			
				<h2>회원 가입</h2>
				<div class="row-multi col-2">
					<div class="col-2-first">
						<div>
							<img src="http://placehold.it/100x70?text=이미지">
						</div>
						<div>
							<input type="file" name="file" accept=".jpg, .png, .gif">
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
						<input type="text" placeholder="우편번호"  name ="customer_post" required>
						<input type="button" value="우편번호찾기">
					</div>
				</div>
				<div>
						<input type="text" placeholder="기본주소"  name ="customer_basic_address" required>
				</div>
				<div>
						<input type="text" placeholder="상세주소"   name ="customer_extra_address"  >
				</div>
				
				<div>
					<input type="submit" value="가입하기">	
				</div>
			
			</div>
		
		</article>
	
	</form>
      
    
    
    
    
<jsp:include page ="/template/footer.jsp"></jsp:include>
    