package servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.BoardDao;
import semi.bean.BoardDto;
import semi.bean.CustomerDao;
import semi.bean.CustomerDto;

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
		
//		  dto.setWriter(Integer.parseInt(req.getParameter("Writer")));
		  
		  
		  String id = (String)req.getSession().getAttribute("customer_id");
		  
		  CustomerDao dao2 = new CustomerDao();
		  CustomerDto dto2 = dao2.get(id);
		  System.out.println(dto2);
		  dto.setWriter(dto2.getCustomer_no());
		  
		  BoardDao dao = new BoardDao();
		  int no = dao.getSequence();
		  
		  dto.setNo(no);
		  
		  dao.write(dto);
		  
//		 resp.sendRedirect("list.jsp");
		 resp.sendRedirect("content.jsp?no="+dto.getNo()); 
	}
	  catch(Exception e) {
		  e.printStackTrace();
		  resp.sendError(500);
	  }

	}
	
}
