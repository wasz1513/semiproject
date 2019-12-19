package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.bean.GoodsDao;
import semi.bean.GoodsDto;

public class GoodsAuthorityCheckFilter  implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		try {
		
		int goods_no=Integer.parseInt(req.getParameter("good_no"));
		
		GoodsDao dao = new GoodsDao();
		GoodsDto dto = dao.get(goods_no);
		
		
		String customer_id = (String) session.getAttribute("customer_id");
		String customer_grade = (String) session.getAttribute("customer_grade");
		
		
		boolean isAdmin = customer_grade.equals("관리자");
		boolean isMine = customer_id.equals(dto.getCustomer_id());
		if(isAdmin || isMine) {
			chain.doFilter(request, response);
			
		}
		else {
			resp.sendError(403); //권한 없음
		}
		} 
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500); //오류
		}
		
		
		
	}	
}
