package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.GoodsDao;
import semi.bean.GoodsDto;
@WebServlet(urlPatterns = "/goods/goods_delete.do")
public class GoodsDeleteServlet extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int goods_no = Integer.parseInt(req.getParameter("goods_no"));

			GoodsDao dao = new GoodsDao();
			GoodsDto dto = dao.get(goods_no);
			String session_id = (String) req.getSession().getAttribute("customer_id");
			String session_grade = (String) req.getSession().getAttribute("customer_grade");
			boolean isAdmin = session_grade.equals("관리자");
			boolean isMine = session_grade.equals(dto.getCustomer_id());

			if (isAdmin || isMine) {
				dao.goods_delete(goods_no);
			} else {
				resp.sendError(403);
			}

			resp.sendRedirect("goods_list.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
