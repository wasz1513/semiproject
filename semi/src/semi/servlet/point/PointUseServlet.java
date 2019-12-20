package semi.servlet.point;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.PointDao;

@WebServlet(urlPatterns="/customer/point/point_use.do")
public class PointUseServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			PointDao dao = new PointDao();
			String id = (String)req.getSession().getAttribute("customer_id");
			int customer_no = Integer.parseInt(req.getParameter("customer_no"));
			int point = Integer.parseInt(req.getParameter("point_use"));
			dao.usePoint(point, id, customer_no);
			System.out.println(id+"/"+point+"/"+customer_no);
			resp.sendRedirect(req.getContextPath()+"/customer/point/point_info.jsp");
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
