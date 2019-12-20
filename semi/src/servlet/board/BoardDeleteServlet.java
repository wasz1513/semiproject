package servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.BoardDao;

@WebServlet(urlPatterns="/board/delete.do")
public class BoardDeleteServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 try {
		 
	   int no =Integer.parseInt(req.getParameter("no"));
	   
	   BoardDao dao = new BoardDao();
	   dao.delete(no);
	   
	   resp.sendRedirect("list.jsp");
	}
	 catch(Exception e) {
		 e.printStackTrace();
		 resp.sendError(500);
		 
	}
  }
}

