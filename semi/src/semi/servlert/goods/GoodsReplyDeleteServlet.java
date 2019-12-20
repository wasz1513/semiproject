package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.GoodsDao;
import semi.bean.GoodsReplyDao;
@WebServlet(urlPatterns = "/goods/goods_reply_delete.do")
public class GoodsReplyDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	int goods_reply_no = Integer.parseInt(req.getParameter("goods_reply_no"));
	int goods_no = Integer.parseInt(req.getParameter("goods_no"));
	
	GoodsReplyDao goodsreplydao = new GoodsReplyDao();
	goodsreplydao.goods_reply_delete(goods_reply_no); //댓글 삭제
	
	GoodsDao goodsdao = new GoodsDao();
	goodsdao.goods_reply_calculate(goods_no);//댓글 수 갱신
	
	resp.sendRedirect("goods_content.jsp?goods_reply_no="+goods_no);
}
catch (Exception e) {
e.printStackTrace();
resp.sendError(500);
}
	}

}
