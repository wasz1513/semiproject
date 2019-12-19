package semi.servlet.help;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/help/write.do")
public class HelpWriteServlet extends HttpServlet {
	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{ 
		try {
			
			HelpDto dto= new HelpDto();
			dto.setBoard_NO(Integer.parseInt(req.getParameter("board_no")));;
			dto.setHdate(req.getParameter("hdate"));
			dto.setContent(req.getParameter("content"));
			dto.setHead(req.getParameter("head"));
			
			String id=(String) req.getSession().getAttribute("id");
			dto.setWrite(id);
			
			HelpDao dao= new HelpDao();
			dao.write(dto);
			
			resp.sendRedirect("list.jsp");
			

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
