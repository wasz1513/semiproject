package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.GoodsDao;
import semi.bean.GoodsReplyDao;
import semi.bean.GoodsReplyDto;

@WebServlet(urlPatterns = "/goods/goods_reply_insert.do")
public class GoodsReplyInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String goods_reply_content =req.getParameter("goods_reply_content");
			int goods_no = Integer.parseInt(req.getParameter("goods_no"));
			
			String session_id = (String)req.getSession().getAttribute("customer_id");
			
					GoodsReplyDto dto = new GoodsReplyDto();
					dto.setGoods_reply_content(goods_reply_content);
					dto.setGoods_no(goods_no);
					dto.setGoods_reply_writer(session_id);
					
					GoodsReplyDao goodsreplydao = new GoodsReplyDao();
					goodsreplydao.goods_reply_write(dto);//댓글 등록
					
					GoodsDao goodsdao = new GoodsDao();
					goodsdao.goods_reply_calculate(goods_no);//댓글 수 갱신
					
					resp.sendRedirect("goods_content.jsp?goods_no="+goods_no);
					
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
