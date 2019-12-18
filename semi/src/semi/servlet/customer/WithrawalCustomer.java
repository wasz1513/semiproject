package semi.servlet.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.CustomerDao;
import semi.bean.CustomerDto;

@WebServlet(urlPatterns="/customer/customer_withrawal.do")
public class WithrawalCustomer extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			CustomerDto dto = new CustomerDto();
			CustomerDao dao = new CustomerDao();
			String id = (String)req.getSession().getAttribute("customer_id");
			dao.get(id);
			dao.withdrawal(dto.getCustomer_no());
			resp.sendRedirect(req.getContextPath());
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
}
