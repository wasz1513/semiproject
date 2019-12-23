package semi.servlet.help;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.bean.HelpDao;
import semi.bean.HelpDto;
import semi.bean.HelpfilesDao;
import semi.bean.HelpfilesDto;

@WebServlet(urlPatterns = "/help/help_write.do")
public class HelpWriteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{ 
		try {
			String path = "D:/upload/kh23/help";
			int size = 10 * 1024 * 1024;
			String encoding = "UTF-8";

			MultipartRequest mRequest = 
					new MultipartRequest(req, path, size, encoding, new DefaultFileRenamePolicy());
						
			HelpDto dto= new HelpDto();
			dto.setContent(mRequest.getParameter("content"));
			dto.setHead(mRequest.getParameter("head"));
			
			HelpDao helpdao = new HelpDao();			
			int seq = helpdao.getSequence();			
			dto.setBoard_NO(seq);
			
			String customer_id=(String)req.getSession().getAttribute("customer_id");
			
			dto.setWrite(customer_id);
			helpdao.write(dto);

//			String customer_id =(String)req.getSession().getAttribute("customer_id");
//			CustomerDao cdao = new CustomerDao();
//			CustomerDto cdto = cdao.get(customer_id);
//			int cno = cdto.getCustomer_no();					
//			파일등록

			
			HelpfilesDao hfdao = new HelpfilesDao(); 
			File file =mRequest.getFile("file");
			if(file != null) {
				HelpfilesDto hfdto =new HelpfilesDto();
				hfdto.setOrigin(seq);
				hfdto.setUploadname(mRequest.getOriginalFileName("file"));
				hfdto.setSavename(mRequest.getFilesystemName("file"));
				hfdto.setFiletype(mRequest.getContentType("file"));
				hfdto.setFilesize(file.length());
//				System.out.println(hfdto.getOrigin()+"/"+hfdto.getUploadname()+"/"+hfdto.getSavename()+"/"+hfdto.getFiletype()+"/"+hfdto.getFilesize());
				hfdao.edit(hfdto);
			}
//			
//			File file2 =mRequest.getFile("file");
//			if(file2 != null) {
//				HelpfilesDto hfdto =new HelpfilesDto();
//				hfdto.setOrigin(seq);
//				hfdto.setUploadname(mRequest.getOriginalFileName("file"));
//				hfdto.setSavename(mRequest.getFilesystemName("file"));
//				hfdto.setFiletype(mRequest.getContentType("file"));
//				hfdto.setFilesize(file.length());
//				
//				HelpfilesDao hfdao = new HelpfilesDao();
//				hfdao.edit(hfdto);
//			}
//			
//			File file3 =mRequest.getFile("file");
//			if(file3 != null) {
//				HelpfilesDto hfdto =new HelpfilesDto();
//				hfdto.setOrigin(seq);
//				hfdto.setUploadname(mRequest.getOriginalFileName("file"));
//				hfdto.setSavename(mRequest.getFilesystemName("file"));
//				hfdto.setFiletype(mRequest.getContentType("file"));
//				hfdto.setFilesize(file.length());
//				
//				HelpfilesDao hfdao = new HelpfilesDao();
//				hfdao.edit(hfdto);
//			}
//			
//			File file4 =mRequest.getFile("file");
//			if(file4 != null) {
//				HelpfilesDto hfdto =new HelpfilesDto();
//				hfdto.setOrigin(seq);
//				hfdto.setUploadname(mRequest.getOriginalFileName("file"));
//				hfdto.setSavename(mRequest.getFilesystemName("file"));
//				hfdto.setFiletype(mRequest.getContentType("file"));
//				hfdto.setFilesize(file.length());
//				
//				HelpfilesDao hfdao = new HelpfilesDao();
//				hfdao.edit(hfdto);
//			}
//		
//			File file5 =mRequest.getFile("file");
//			if(file5 != null) {
//				HelpfilesDto hfdto =new HelpfilesDto();
//				hfdto.setOrigin(seq);
//				hfdto.setUploadname(mRequest.getOriginalFileName("file"));
//				hfdto.setSavename(mRequest.getFilesystemName("file"));
//				hfdto.setFiletype(mRequest.getContentType("file"));
//				hfdto.setFilesize(file.length());
//				
//				HelpfilesDao hfdao = new HelpfilesDao();
//				hfdao.edit(hfdto);
//			}
//			
//			
			resp.sendRedirect("help_list.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
