package semi.servlet.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.bean.CustomerDao;
import semi.bean.CustomerDto;

@WebServlet(urlPatterns="/customer/customer_withrawal.do")
public class WithrawalCustomer extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			
			req.setCharacterEncoding("UTF-8");
			
			HttpSession session = req.getSession();
			String id = (String)session.getAttribute("customer_id");
			
			session.removeAttribute("customer_id");
			session.removeAttribute("customer_grade");

	

			CustomerDao dao = new CustomerDao();
			dao.withrawal(id);
			
			resp.sendRedirect("withrawal.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
}
