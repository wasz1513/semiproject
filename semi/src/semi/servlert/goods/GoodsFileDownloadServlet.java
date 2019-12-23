package semi.servlert.goods;

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
import semi.bean.GoodsFilesDao;
import semi.bean.GoodsFilesDto;
@WebServlet(urlPatterns = "/goods/download.do")
public class GoodsFileDownloadServlet  extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int no = Integer.parseInt(req.getParameter("no"));
		GoodsFilesDao dao = new GoodsFilesDao();
		GoodsFilesDto dto = dao.filesInfo(no);
		
		File target = new File("D:\\upload\\kh23\\goods", dto.getSavename());
		byte[] data = FileUtils.readFileToByteArray(target);
	

		resp.setHeader("Content-Type", "application/octet=stream; charset=UTF-8");
		resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(dto.getUploadname(), "UTF-8")+"\"");
		resp.setHeader("Content-Length", String.valueOf(dto.getFilesize()));

		resp.getOutputStream().write(data);
		
		
	} catch (Exception e) {
	 e.printStackTrace();
	 resp.sendError(500);
	}
}
}
