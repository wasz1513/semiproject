package semi.servlet.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.CustomerDao;
import semi.bean.CustomerDto;

@WebServlet(urlPatterns = "/customer/change_pw.do")
public class ChangePasswordServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			CustomerDao dao = new CustomerDao();
			CustomerDto dto = new CustomerDto();		
			dto.setCustomer_id((String)req.getSession().getAttribute("customer_id"));
			dto.setCustomer_pw(req.getParameter("customer_pw"));
			dao.ChangePassword(dto);
			resp.sendRedirect(req.getContextPath()+"/customer/change_pw_result.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
