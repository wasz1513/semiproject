package bean;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/board/write.do")
public class BoardWriteServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  try {
		  req.setCharacterEncoding("UTF-8");
		  BoardDto dto = new BoardDto();
		  
		  dto.setHead(req.getParameter("head"));
		  dto.setTitle(req.getParameter("title"));
		  dto.setContent(req.getParameter("content"));
		
		  dto.setWriter(req.getParameter("Writer"));
		  
		  
		  String id = (String)req.getSession().getAttribute("id");
		  dto.setWriter(id);
		  
		  BoardDao dao = new BoardDao();
		  int no = dao.getSequence();
		  dto.setNo(no);;
		  dao.write(dto);
		  
//		 resp.sendRedirect("list2.jsp");
		 resp.sendRedirect("content.jsp?no="+no); 
	}
	  catch(Exception e) {
		  e.printStackTrace();
		  resp.sendError(500);
	  }

	}
	
}
