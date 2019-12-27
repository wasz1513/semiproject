package semi.servlet.help;

import java.io.IOException;




import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.HelpReplyDao;
import semi.bean.HelpReplyDto;



@WebServlet(urlPatterns = "/help/reply_insert.do")
public class HelpReplyInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		//1.사용자정보 db에등록하고 이동
		//사용자 입력 :content,origin
		//세션:id
		String content =req.getParameter("content");
		int origin = Integer.parseInt(req.getParameter("board_no"));
		String test = req.getParameter("board_no");
		
		String customer_id = (String)req.getSession().getAttribute("customer_id");
		
		HelpReplyDto dto =new HelpReplyDto();
		dto.setContent(content);
		dto.setOrigin(origin);
		dto.setWriter(customer_id);
		
		HelpReplyDao dao =new HelpReplyDao();
		dao.write(dto);		
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		
		resp.sendRedirect("../admin/help2.jsp?pno="+pno);
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			}
		}
	}
