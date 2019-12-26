<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



		</section>
<!-- 		푸터 -->

<section id="footer">
    <footer class="footer_wrap">
        <div class="footer_con">
            <div class="footer_menu">
                <li>
                        <a href="#">이용약관</a>
                    </li>
                    <li class="line">
                        <a href="#">개인정보처리방침</a>
                    </li>
                    <li class="line">
                        <a href="#">신고하기</a>
                    </li>
            </div>
            <div class="logo_black">
                <img src="<%=request.getContextPath()%>/image/logo_black.png">
                <div class="foot_address">
                    <span>(주) 당근나라 서울시 영등포구 당산동 이레빌딩 </span>
                    <span>대표 : 쮸니왕자님  고객센터 : 02-000-0000</span>
                    <p>Copyrightⓒ CARROT. All Rights Reserved.</p>
                </div>				
            </div>
        </div>

</section>
		
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


	</main>

</body>
</html>

