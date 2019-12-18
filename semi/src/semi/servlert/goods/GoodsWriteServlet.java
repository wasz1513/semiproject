package semi.servlert.goods;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.GoodsDto;


@WebServlet(urlPatterns = "/goods/write.do")
public class GoodsWriteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			GoodsDto dto = new GoodsDto();
			dto.setCategory(req.getParameter("category"));
			dto.setTitle(req.getParameter("title"));
			dto.setContent(req.getParameter("content"));

//			String id =req.getSession().getAttribute("id");
//상세보기로
//		GoodsDao dao= new GoodsDao();
//			int no=dao.getSequence();
//			dto.setNo(no);
//			dao.write(dto)
			
	//		resp.sendRedirect("content.jsp?no="+no);
		} 
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
