package semi.servlet.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.InterestDao;

@WebServlet(urlPatterns = "/goods/interest.do")
public class CustomerInterestServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String customer_id = (String)req.getSession().getAttribute("customer_id");
			int goods_no = Integer.parseInt(req.getParameter("goods_no"));
			InterestDao dao = new InterestDao();
			dao.insert(customer_id, goods_no);
			
			resp.sendRedirect("goods_content.jsp?goods_no="+goods_no);
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
