package semi.servlet.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.CustomerDao;
import semi.bean.CustomerDto;

@WebServlet(urlPatterns = "/customer/change_info.do")
public class ChangeInfoServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//회원 정보 변경(닉네임, 폰번호, post, 기본주소, 상세주소 / ID)
		try {
			req.setCharacterEncoding("UTF-8");
			CustomerDto dto = new CustomerDto();
			CustomerDao dao = new CustomerDao();
			dto.setCustomer_nickname(req.getParameter("customer_nickname"));
			dto.setCustomer_phone(req.getParameter("customer_phone"));
			dto.setCustomer_email(req.getParameter("customer_email"));
			dto.setCustomer_post(req.getParameter("customer_post"));
			dto.setCustomer_basic_address(req.getParameter("customer_basic_address"));
			dto.setCustomer_extra_address(req.getParameter("customer_extra_address"));
			//session에서 불러 오는 것 추가 후 반드시 변경할 것.
			dto.setCustomer_id((String)req.getSession().getAttribute("customer_id"));
			dao.updateCustomerInfo(dto);
			resp.sendRedirect(req.getContextPath()+"/customer/info.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
