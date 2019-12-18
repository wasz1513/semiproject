package semi.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CustomerDao;
import beans.CustomerDto;

@WebServlet(urlPatterns="/customer/customer_withrawal.do")
public class WithrawalCustomer extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerDto dto = new CustomerDto();
		CustomerDao dao = new CustomerDao();
		
		
	}
}
