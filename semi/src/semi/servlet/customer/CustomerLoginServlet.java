package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CustomerDao;
import beans.CustomerDto;

@WebServlet(urlPatterns = "/customer/login.do")
public class CustomerLoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			req.setCharacterEncoding("UTF-8");
			String customer_id = req.getParameter("customer_id");
			String customer_pw = req.getParameter("customer_pw");
			
			CustomerDao dao = new CustomerDao();
			boolean result = dao.login(customer_id, customer_pw);
			
			if(result) {
				
				CustomerDto dto = new CustomerDto();
				req.getSession().setAttribute("customer_id", customer_id);
				req.getSession().setAttribute("customer_grade", dto.getCustomer_grade());
				
				//최종로그인시간
				dao.updateLastLogin(customer_id);
				
				
				resp.sendRedirect(req.getContextPath());
				
			}
			else {
				resp.sendRedirect("login.jsp?error");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	
	}
	
}
