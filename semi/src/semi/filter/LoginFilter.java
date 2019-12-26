package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns= {
		"/admin/*",
		
		"/customer/info.jsp",
		"/customer/change_info.do",
		"/customer/change_info.jsp",
		"/customer/check.do",
		"/customer/check.jsp",
		"/customer/exit.do",
		"/customer/logout.do",
		"/customer/change_pw.jsp",
		"/customer/change_pw.do",
		"/customer/change_pw_result"
		
})
public class LoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	  HttpServletRequest req = (HttpServletRequest) request;
	  HttpSession session = req.getSession();
	  
	  String id =(String) session.getAttribute("customer_id");
	  
	  if(id != null) {//로그인 상태라면 --> 통과
		  chain.doFilter(request, response);
	  }
	  else {//로그인 상태가 아니라면 --> 로그인 페이지로 리다이렉트
		  HttpServletResponse resp =(HttpServletResponse)response;
		  resp.sendRedirect(req.getContextPath()+"/customer/login.jsp");
	  }	   
	}
	
}
