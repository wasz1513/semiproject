package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CustomerDao;

@WebServlet(urlPatterns = "/customer/find.do")
public class CustomerFindServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			req.setCharacterEncoding("UTF-8");
			
			String customer_name= req.getParameter("customer_name");
			String customer_phone = req.getParameter("customer_phone");
			
			CustomerDao dao = new CustomerDao();
			String customer_id = dao.find(customer_name, customer_phone);
			
			if(customer_id == null) {
				resp.sendRedirect("find_result.jsp");
			}
			else {
				resp.sendRedirect("find_result.jsp?customer_id=" + customer_id);
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
	
}
