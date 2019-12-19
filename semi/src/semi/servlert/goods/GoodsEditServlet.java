package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.GoodsDao;
import semi.bean.GoodsDto;

@WebServlet(urlPatterns = "/goods/goods_edit.do")
public class GoodsEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			GoodsDto dto = new GoodsDto();
			dto.setGoods_no(Integer.parseInt(req.getParameter("goods_no")));
			dto.setGoods_category(req.getParameter("goods_category"));
			dto.setGoods_title(req.getParameter("goods_title"));
			dto.setGoods_price(Integer.parseInt(req.getParameter("goods_price")));
			dto.setGoods_content(req.getParameter("goods_content"));
			
			GoodsDao dao = new GoodsDao();
			dao.goods_edit(dto);
			
			resp.sendRedirect("content.jsp?goods_no="+dto.getGoods_no());
			
			
		
			
		} 
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
