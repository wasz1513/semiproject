<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



		</section>
<!-- 		푸터 -->
<section class="footer_wrap">

		<footer>
			<div class="footer_con">
				<div class="logo_black">
					<img src="<%=request.getContextPath()%>/image/logo_black.png">
				</div>
				<div class="footer_menu">
					<div class="footmenu">
						<a href="#">이용약관</a>
						<a href="#">개인정보처리방침</a>
						<a href="#">문의하기</a>
						<a href="#">신고하기</a>
					</div>
				</div>
			<div class="foot_address">
				(주) 당근나라 <span>|</span>
				서울시 영등포구 당산동 이레빌딩 <span>|</span>
				대표 : 쮸니왕자님
			</div>				
			</div>
			
			    <% 
					String id = (String)session.getAttribute("customer_id"); 
					String grade = (String)session.getAttribute("customer_grade");
				%>
				<div class="test">
					<h5>id = <%= id %></h5>
					<h5>grade = <%= grade %></h5>
					<h5>로그인 상태 = <%= id != null %></h5>	
				</div>
		</footer>
</section>

	</main>

</body>
</html>