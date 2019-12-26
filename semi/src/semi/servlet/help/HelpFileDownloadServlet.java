package semi.servlet.help;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import semi.bean.HelpfilesDao;
import semi.bean.HelpfilesDto;

@WebServlet(urlPatterns = "/help/download.do")
public class HelpFileDownloadServlet extends HttpServlet {
  @Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		HelpfilesDao dao = new HelpfilesDao();
		HelpfilesDto dto = dao.filesInfo(board_no);
		
		File target = new File("D:\\upload\\kh23\\help", dto.getSavename());
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
