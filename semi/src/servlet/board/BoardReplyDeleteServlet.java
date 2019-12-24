package servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.BoardDao;
import semi.bean.ReplyDao;

@WebServlet(urlPatterns = "/board/reply_delete.do")
public class BoardReplyDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			[1] 수신하고 [2] 처리하고 [3] 이동하고
			int no = Integer.parseInt(req.getParameter("no"));
			int origin = Integer.parseInt(req.getParameter("origin"));
			
			ReplyDao rdao = new ReplyDao();
			rdao.delete(no);//댓글 삭제
			
			BoardDao bdao = new BoardDao();
			bdao.calculate(origin);//댓글 수 갱신
			
			resp.sendRedirect("content.jsp?no=" + origin);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}