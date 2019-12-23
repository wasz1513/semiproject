package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.GoodsReplyDao;

@WebServlet(urlPatterns = "/goods/goods_reply_edit.do")
public class GoodsReplyeditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
		int goods_no = Integer.parseInt(req.getParameter("goods_no"));
		
		int goods_reply_no = Integer.parseInt(req.getParameter("goods_reply_no"));
		String goods_reply_content = req.getParameter("goods_reply_content");
		
		GoodsReplyDao dao = new GoodsReplyDao();
		dao.edit(goods_reply_no, goods_reply_content);
		
		resp.sendRedirect("/goods_content.jsp?goods_no="+goods_no);
		
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	
	}

}
