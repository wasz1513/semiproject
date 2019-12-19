package semi.servlet.customer;

import java.io.File;
import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.bean.CustomerDao;
import semi.bean.CustomerDto;
import semi.bean.CustomerFilesDao;
import semi.bean.CustomerFilesDto;

@WebServlet(urlPatterns = "/customer/regist.do")
public class CustomerRegistServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String path = "D:/upload/kh23/customer";
			int size = 10*1024*1024;
			String encoding = "UTF-8";
			
			MultipartRequest mRequest = new MultipartRequest(req, path, size, encoding, new DefaultFileRenamePolicy());
			
			
			req.setCharacterEncoding("UTF-8");
			
			CustomerDto dto = new CustomerDto();
			dto.setCustomer_id(req.getParameter("customer_id"));
			dto.setCustomer_pw(req.getParameter("customer_pw"));
			dto.setCustomer_name(req.getParameter("customer_name"));
			dto.setCustomer_nickname(req.getParameter("customer_nickname"));
			dto.setCustomer_birth(req.getParameter("customer_birth"));
			dto.setCustomer_email(req.getParameter("customer_email"));
			dto.setCustomer_phone(req.getParameter("customer_phone"));
			dto.setCustomer_post(req.getParameter("customer_post"));
			dto.setCustomer_basic_address(req.getParameter("customer_basic_address"));
			dto.setCustomer_extra_address(req.getParameter("customer_extra_address"));
			
			CustomerDao dao = new CustomerDao();
			int seq = dao.getSequence();
			dto.setCustomer_no(seq);
			dao.regist(dto);
			
			File file = mRequest.getFile("file");
			if(file!=null) {
				CustomerFilesDto fdto = new CustomerFilesDto();
				fdto.setOrigin(seq);
				fdto.setUploadname(mRequest.getOriginalFileName("file"));
				fdto.setSavename(mRequest.getFilesystemName("file"));
				fdto.setFiletype(mRequest.getContentType("file"));
				fdto.setFilesize(file.length());		
				
				CustomerFilesDao fdao = new CustomerFilesDao();
				fdao.edit(fdto);
			}
			
			
			resp.sendRedirect("regist_success.jsp");
		
		}catch(SQLIntegrityConstraintViolationException e) {
			resp.sendRedirect("regist_fail.jsp");
		
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
	
}
