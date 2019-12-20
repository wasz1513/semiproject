package servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.ReplyDao;
import semi.bean.ReplyDto;

@WebServlet(urlPatterns = "/board/reply_insert.do")
public class BoardReplyInsertServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	try {
    	  String content = req.getParameter("content");
    	  int origin = Integer.parseInt(req.getParameter("origin"));
    	  
    	  String id = (String) req.getSession().getAttribute("id");
    	  
    	  ReplyDto dto = new ReplyDto();
    	  dto.setContent(content);
    	  dto.setOrigin(origin);
    	  dto.setWriter(id);
    	  
    	  ReplyDao dao = new ReplyDao();
    	  dao.write(dto);
    	  
    	  resp.sendRedirect("content.jsp?no="+origin);
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    		resp.sendError(500);
    	}
    }
}