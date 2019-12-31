package semi.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.CustomerDao;
import semi.bean.CustomerDto;

@WebServlet(urlPatterns = "/customer/check_pw.do")
public class PwCheckServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String id = (String)req.getSession().getAttribute("customer_id");
			String pw = req.getParameter("customer_pw");
			String go = req.getParameter("go");

//			System.out.println(id+"/"+pw+"/"+go);
//			System.out.println("pw : "+pw);
			CustomerDao dao = new CustomerDao();
			boolean result = dao.login(id, pw);
			
			if(result) {
				resp.sendRedirect(req.getContextPath()+go);
			}else {
				resp.sendRedirect("check_pw.jsp?error");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
		
	}
}
