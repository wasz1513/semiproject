package semi.servlert.goods;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.bean.GoodsDao;
import semi.bean.GoodsDto;
import semi.bean.GoodsFilesDao;
import semi.bean.GoodsFilesDto;


@WebServlet(urlPatterns = "/goods/goods_write.do")
public class GoodsWriteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String path = "D:/upload/kh23/goods";
			int size = 10*1024*1024;
			String encoding = "UTF-8";
			
			MultipartRequest mRequest = new MultipartRequest(req, path, size, encoding,new DefaultFileRenamePolicy());
			
			
			GoodsDto dto = new GoodsDto();
			dto.setGoods_category(mRequest.getParameter("goods_category"));
			dto.setGoods_title(mRequest.getParameter("goods_title"));
			dto.setGoods_price (Integer.parseInt(mRequest.getParameter("goods_price")));
			dto.setGoods_content(mRequest.getParameter("goods_content"));
			
			GoodsDao goodsdao = new GoodsDao();
			int seq = goodsdao.getSequence();
			goodsdao.goods_write(dto);
			
			String session_id =(String)req.getSession().getAttribute("customer_id");
			dto.setCustomer_id(session_id);
			
			
			File file = mRequest.getFile("file");
			if(file!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file"));
				gfdto.setSavename(mRequest.getFilesystemName("file"));
				gfdto.setFiletype(mRequest.getContentType("file"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.edit(gfdto);
			}
			File file2 = mRequest.getFile("file2");
			if(file!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file"));
				gfdto.setSavename(mRequest.getFilesystemName("file"));
				gfdto.setFiletype(mRequest.getContentType("file"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.edit(gfdto);
			}
			File file3 = mRequest.getFile("file3");
			if(file!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file"));
				gfdto.setSavename(mRequest.getFilesystemName("file"));
				gfdto.setFiletype(mRequest.getContentType("file"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.edit(gfdto);
			}
			File file4 = mRequest.getFile("file4");
			if(file!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file"));
				gfdto.setSavename(mRequest.getFilesystemName("file"));
				gfdto.setFiletype(mRequest.getContentType("file"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.edit(gfdto);
			}
			File file5 = mRequest.getFile("file5");
			if(file!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file"));
				gfdto.setSavename(mRequest.getFilesystemName("file"));
				gfdto.setFiletype(mRequest.getContentType("file"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.edit(gfdto);
			}
			resp.sendRedirect("goods_content.jsp");
		
	
//상세보기로
			GoodsDao dao = new GoodsDao();
			int goods_no=dao.getSequence();
			
			dto.setGoods_no(goods_no);
			
			dao.goods_write(dto);
			
			resp.sendRedirect("goods_content.jsp?goods_no="+goods_no);
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
