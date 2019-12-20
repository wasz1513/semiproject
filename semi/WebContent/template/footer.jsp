<%@page import="semi.bean.SessionVisitDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	SessionVisitDao dao = new SessionVisitDao();
	int total = dao.total();
	int today = dao.today();

%>


		</section>
<!-- 		푸터 -->
		<footer>
			<div class="row-left">
				<div>
					당근나라
				</div>
				<div>
					kh2 b class
				</div>
				<div>
					team 3
				</div>
				<div>
					총 방문자 : <%=total %>  오늘 방문자 : <%=today %>
				</div>
			</div>
			    <% 
					String id = (String)session.getAttribute("customer_id"); 
					String grade = (String)session.getAttribute("customer_grade");
				%>
				
				<h5>id = <%= id %></h5>
				<h5>grade = <%= grade %></h5>
				<h5>로그인 상태 = <%= id != null %></h5>
		</footer>
	</main>

</body>
</html>

