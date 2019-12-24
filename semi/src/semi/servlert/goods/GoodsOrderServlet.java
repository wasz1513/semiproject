package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import semi.bean.CustomerDao;
import semi.bean.CustomerDto;
import semi.bean.GoodsDao;
import semi.bean.GoodsDto;
import semi.bean.OrdersDao;
import semi.bean.OrdersDto;



@WebServlet(urlPatterns = "/goods/orders.do")
public class GoodsOrderServlet extends HttpServlet{

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			try {
				
				CustomerDao cdao = new CustomerDao();
				GoodsDao gdao = new GoodsDao();
				GoodsDto gdto = new GoodsDto();
				CustomerDto cdto = cdao.get((String)req.getSession().getAttribute("customer_id"));
				OrdersDao odao = new OrdersDao();
				OrdersDto odto = new OrdersDto();
				
				//상품정보 불러오기
				gdto.setGoods_title(req.getParameter("goods_title"));
				gdto.setGoods_price(Integer.parseInt(req.getParameter("goods_price")));
				gdto.setCustomer_id(req.getParameter("goods_seller"));
				gdto.setGoods_no(Integer.parseInt(req.getParameter("goods_no")));
				
			
				
				//주소 불러오기
				cdto.setCustomer_post(req.getParameter("customer_post"));
				cdto.setCustomer_basic_address(req.getParameter("customer_basic_address"));
				cdto.setCustomer_extra_address(req.getParameter("customer_extra_address"));
				
			
							
				resp.sendRedirect("orders_success.jsp");
				
			} catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
		
		}
	
	
}

