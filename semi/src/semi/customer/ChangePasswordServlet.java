package semi.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CustomerDao;
import beans.CustomerDto;

@WebServlet(urlPatterns = "/customer/change_pw.do")
public class ChangePasswordServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			CustomerDao dao = new CustomerDao();
			CustomerDto dto = new CustomerDto();
//          세션이 아직 구현되지 않아 아래 더미 데이터를 이용하여 테스트 완료함.				
			dto.setCustomer_id("fbguswls");
//			(String)req.getSession().getAttribute("customer_id")
			dto.setCustomer_pw(req.getParameter("customer_pw"));
			System.out.println(dto.getCustomer_id()+"/"+dto.getCustomer_pw());
			dao.ChangePassword(dto);
			resp.sendRedirect(req.getContextPath()+"/customer/change_pw.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}