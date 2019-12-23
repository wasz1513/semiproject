//package semi.servlet.customer;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import semi.bean.OrdersDao;
//import semi.bean.OrdersDto;
//import semi.bean.CustomerDao;
//
//
//
//@WebServlet(urlPatterns = "/customer/buy.do")
//public class CustomerBuyServlet extends HttpServlet{
//
//		@Override
//		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//			
//			try {
//				
//				String customer_id=(String)req.getSession().getAttribute("customer_id");
//				CustomerDao customerDao = new CustomerDao();
//				
//				OrdersDto dto = new OrdersDto();
//				dto.setBuy_extra_address(req.getParameter("buy_extra_address"));
//				
//				OrdersDao dao = new OrdersDao();
////				dao.addExtraAddress(dto);
//				
//				resp.sendRedirect("buy_success.jsp");
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//				resp.sendError(500);
//			}
//		
//		}
//	
//	
//}
