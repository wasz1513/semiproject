package semi.servlet.point;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.PointDao;
import semi.bean.PointDto;

@WebServlet(urlPatterns="/customer/point_save.do")
public class PointSaveServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			PointDto dto = new PointDto();
			PointDao dao = new PointDao();
			String id = (String)req.getSession().getAttribute("customer_id");
			int point=Integer.parseInt(req.getParameter("point_save"));
			int customer_no = Integer.parseInt(req.getParameter("customer_no"));
			System.out.println(id+"/"+point+"/"+customer_no);
			dao.savePoint(point, id, customer_no);
			resp.sendRedirect(req.getContextPath()+"/point/point_info.jsp");
		}catch(Exception e) {
			
		}
	}
}