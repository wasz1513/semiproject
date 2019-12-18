package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CustomerDao;

@WebServlet(urlPatterns = "/customer/change_pw.do")
public class CustomerChangePwServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			req.setCharacterEncoding("UTF-8");
			
			String customer_id = (String)req.getSession().getAttribute("customer_id");
			String customer_pw = req.getParameter("customer_pw");
			
			CustomerDao dao = new CustomerDao();
//			dao.changePw(customer_pw);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
	
}
