package semi.servlet.customer;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.bean.CustomerDao;
import semi.bean.CustomerDto;
import semi.bean.CustomerFilesDao;
import semi.bean.CustomerFilesDto;

@WebServlet(urlPatterns = "/customer/change_info.do")
public class ChangeInfoServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//회원 정보 변경(닉네임, 폰번호, post, 기본주소, 상세주소 / ID)
		try {
			String path = "D:/upload/kh23/customer";
			int size = 10*1024*1024;
			String encoding = "UTF-8";
			
			MultipartRequest mRequest = new MultipartRequest(req, path, size, encoding, new DefaultFileRenamePolicy());
			
			req.setCharacterEncoding("UTF-8");
			CustomerDto dto = new CustomerDto();
			CustomerDao dao = new CustomerDao();
			dto.setCustomer_nickname(mRequest.getParameter("customer_nickname"));
			dto.setCustomer_phone(mRequest.getParameter("customer_phone"));
			dto.setCustomer_email(mRequest.getParameter("customer_email"));
			dto.setCustomer_post(mRequest.getParameter("customer_post"));
			dto.setCustomer_basic_address(mRequest.getParameter("customer_basic_address"));
			dto.setCustomer_extra_address(mRequest.getParameter("customer_extra_address"));
			dto.setKeyword_first(mRequest.getParameter("keyword_first"));
			dto.setKeyword_second(mRequest.getParameter("keyword_second"));
			dto.setKeyword_third(mRequest.getParameter("keyword_third"));
			dto.setKeyword_fourth(mRequest.getParameter("keyword_fourth"));
			dto.setKeyword_fifth(mRequest.getParameter("keyword_fifth"));

			int asd = Integer.parseInt(mRequest.getParameter("existence"));
			
			System.out.println(asd);
			
			//session에서 불러 오는 것 추가 후 반드시 변경할 것.
			dto.setCustomer_id((String)req.getSession().getAttribute("customer_id"));
			dao.updateCustomerInfo(dto);
			
			CustomerDto cdto = dao.get((String)req.getSession().getAttribute("customer_id"));
			
			File file = mRequest.getFile("file");
			
			if(file!=null) {
				CustomerFilesDto fdto = new CustomerFilesDto();
				fdto.setOrigin(cdto.getCustomer_no());
				fdto.setUploadname(mRequest.getOriginalFileName("file"));
				fdto.setSavename(mRequest.getFilesystemName("file"));
				fdto.setFiletype(mRequest.getContentType("file"));
				fdto.setFilesize(file.length());		
				
				CustomerFilesDao fdao = new CustomerFilesDao();
				if(asd > 0) {
					fdao.update(fdto);
				}else {
					fdao.edit(fdto);
				}
			}
			
			
			resp.sendRedirect(req.getContextPath()+"/customer/info.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
