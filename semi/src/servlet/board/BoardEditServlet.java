package servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.BoardDao;
import semi.bean.BoardDto;

@WebServlet(urlPatterns="/board/edit.do")
public class BoardEditServlet extends HttpServlet{
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
   try{
	  BoardDto dto = new BoardDto();
	  dto.setNo(Integer.parseInt(req.getParameter("no")));
	  dto.setHead(req.getParameter("head"));
	  dto.setTitle(req.getParameter("title"));
	  dto.setContent(req.getParameter("content"));
	  
	  BoardDao dao = new BoardDao();
	  dao.boardEdit(dto);
	  
	  resp.sendRedirect("content.jsp?no="+dto.getNo());
	  
  }
   catch(Exception e) {
	   e.printStackTrace();
	   resp.sendError(500);
   }
	}
}
