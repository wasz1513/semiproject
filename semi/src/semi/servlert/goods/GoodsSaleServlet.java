package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/goods/sale.do")
public class GoodsSaleServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int no = Integer.parseInt(req.getParameter("goods_no"));
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
