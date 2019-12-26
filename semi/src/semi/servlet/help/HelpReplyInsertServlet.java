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
		int origin = Integer.parseInt(req.getParameter("origin"));
		
		String id = (String)req.getSession().getAttribute("id");
		
		HelpReplyDto dto =new HelpReplyDto();
		dto.setContent(content);
		dto.setOrigin(origin);
		dto.setWriter(id);
		
		HelpReplyDao dao =new HelpReplyDao();
		dao.write(dto);		
		
		resp.sendRedirect("help.jsp?no="+origin);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			}
		}
	}
