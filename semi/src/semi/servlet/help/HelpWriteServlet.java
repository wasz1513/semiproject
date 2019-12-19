package semi.servlet.help;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.CustomerDao;
import semi.bean.HelpDao;
import semi.bean.HelpDto;

@WebServlet(urlPatterns = "/help/write.do")
public class HelpWriteServlet extends HttpServlet {
	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{ 
		try {
			
			HelpDto dto= new HelpDto();
			dto.setContent(req.getParameter("content"));
			dto.setHead(req.getParameter("head"));
			
			String id=(String) req.getSession().getAttribute("customer_id");
			dto.setWrite(id);
		
			HelpDao dao=new HelpDao();
			dao.write(dto);
			
	
			resp.sendRedirect("list.jsp");
			

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
