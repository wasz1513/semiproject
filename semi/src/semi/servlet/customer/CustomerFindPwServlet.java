package semi.servlet.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.CustomerDao;
import semi.bean.CustomerDto;

@WebServlet(urlPatterns = "/customer/find_pw.do")
public class CustomerFindPwServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			CustomerDto dto = new CustomerDto();
			CustomerDao dao = new CustomerDao();
			dto.setCustomer_id(req.getParameter("customer_id"));
			dto.setCustomer_name(req.getParameter("customer_name"));
			dto.setCustomer_phone(req.getParameter("customer_phone"));
			dto.setCustomer_email(req.getParameter("customer_email"));
			boolean result = dao.find_pw(dto);
			String encrypte = dao.random_pw(dto);
			if(result) {
				req.getSession().setAttribute("temp_pw", encrypte);
				resp.sendRedirect(req.getContextPath()+"/customer/temp_pw.jsp");
				
			}else {
				resp.sendRedirect(req.getContextPath()+"/customer/find_pw.jsp?error");
			}

		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
