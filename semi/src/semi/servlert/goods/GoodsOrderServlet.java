package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.OrdersDao;
import semi.bean.OrdersDto;

@WebServlet(urlPatterns = "/goods/orders.do")
public class GoodsOrderServlet extends HttpServlet{
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {			
			try {
		
				OrdersDto dto = new OrdersDto();
				dto.setCustomer_point(Integer.parseInt(req.getParameter("customer_point")));
				dto.setCustomer_no(Integer.parseInt(req.getParameter("customer_no")));
				dto.setCustomer_id((String)req.getSession().getAttribute("customer_id"));
				dto.setOrders_post(req.getParameter("orders_post"));
				dto.setOrders_basic_address(req.getParameter("orders_basic_address"));
				dto.setOrders_extra_address(req.getParameter("orders_extra_address"));
				dto.setOrders_amount(Integer.parseInt(req.getParameter("final_amount")));
				dto.setOrders_goods_title(req.getParameter("orders_goods_title"));
				dto.setOrders_goods_seller(req.getParameter("orders_goods_seller"));
				dto.setOrders_type(req.getParameter("orders_type"));
				dto.setOrders_payment(req.getParameter("orders_payment"));
				dto.setGoods_no(Integer.parseInt(req.getParameter("goods_no")));
				dto.setGoods_price(Integer.parseInt(req.getParameter("goods_price")));
				
				OrdersDao dao = new OrdersDao();
				int seq_no = dao.seq();
				dto.setOrders_no(seq_no);
				dao.insert_buy(dto);
				
				resp.sendRedirect(req.getContextPath()+"/goods/orders_success.jsp?no="+seq_no);
				
			} catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
		
		}
	
	
}

