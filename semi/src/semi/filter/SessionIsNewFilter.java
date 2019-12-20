package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.bean.SessionVisitDao;

public class SessionIsNewFilter implements Filter{

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		boolean visit = req.getSession().isNew();
		
		if(visit) {
			SessionVisitDao sessiondao = new SessionVisitDao();
			try {
				sessiondao.count();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				chain.doFilter(request, response);
			}
		}
		
		chain.doFilter(request, response);
	}
}
