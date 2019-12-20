package semi.servlet.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.BuyDao;
import semi.bean.BuyDto;



@WebServlet(urlPatterns = "/customer/buy.do")
public class CustomerBuyServlet extends HttpServlet{

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			try {
				
				BuyDto dto = new BuyDto();
				dto.setBuy_post(req.getParameter("buy_post"));
				dto.setBuy_extra_address(req.getParameter("buy_basic_address"));
				dto.setBuy_extra_address(req.getParameter("buy_extra_address"));
				
				BuyDao dao = new BuyDao();
				dao.buyNewAddress(dto);
				
				resp.sendRedirect("buy_success.jsp");
				
			} catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
		
		}
	
	
}
