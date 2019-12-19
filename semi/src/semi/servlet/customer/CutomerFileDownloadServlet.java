package semi.servlet.customer;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import semi.bean.CustomerFilesDao;
import semi.bean.CustomerFilesDto;

@WebServlet(urlPatterns = "/customer/download.do")
public class CutomerFileDownloadServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int no = Integer.parseInt(req.getParameter("no"));
			
			CustomerFilesDao dao = new CustomerFilesDao();
			CustomerFilesDto dto = dao.filesInfo(no);
			
			File target = new File("D:\\upload\\kh23\\customer", dto.getSavename());
			byte[] data = FileUtils.readFileToByteArray(target);
		

			resp.setHeader("Content-Type", "application/octet=stream; charset=UTF-8");
			resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(dto.getUploadname(), "UTF-8")+"\"");
			resp.setHeader("Content-Length", String.valueOf(dto.getFilesize()));
			

			resp.getOutputStream().write(data);
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
