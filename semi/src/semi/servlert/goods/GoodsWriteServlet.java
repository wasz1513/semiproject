package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.GoodsDao;
import semi.bean.GoodsDto;


@WebServlet(urlPatterns = "/goods/goods_write.do")
public class GoodsWriteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			GoodsDto dto = new GoodsDto();
			dto.setGoods_category(req.getParameter("goods_category"));
			dto.setGoods_title(req.getParameter("goods_title"));
			dto.setGoods_price (Integer.parseInt(req.getParameter("goods_price")));
			dto.setGoods_content(req.getParameter("goods_content"));
			

			String session_id =(String)req.getSession().getAttribute("customer_id");
			dto.setCustomer_id(session_id);
			
//상세보기로
		GoodsDao dao = new GoodsDao();
			int goods_no=dao.getSequence();
			
			dto.setGoods_no(goods_no);
			
			dao.goods_write(dto);
			
			resp.sendRedirect("goods_content.jsp?goods_no="+goods_no);
		} 
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
