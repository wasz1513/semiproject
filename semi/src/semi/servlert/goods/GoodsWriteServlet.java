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

import semi.bean.CustomerDao;
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
			dto.setGoods_no(seq);
			
			goodsdao.goods_write(dto);
			
			//파일등록
			File file = mRequest.getFile("file");
			if(file!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file"));
				gfdto.setSavename(mRequest.getFilesystemName("file"));
				gfdto.setFiletype(mRequest.getContentType("file"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.insert(gfdto);
			}
			
			File file2 = mRequest.getFile("file2");
			if(file2!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file2"));
				gfdto.setSavename(mRequest.getFilesystemName("file2"));
				gfdto.setFiletype(mRequest.getContentType("file2"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.insert(gfdto);
			}
			
			File file3 = mRequest.getFile("file3");
			if(file3!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file3"));
				gfdto.setSavename(mRequest.getFilesystemName("file3"));
				gfdto.setFiletype(mRequest.getContentType("file3"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.insert(gfdto);
			}
			File file4 = mRequest.getFile("file4");
			if(file4!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file4"));
				gfdto.setSavename(mRequest.getFilesystemName("file4"));
				gfdto.setFiletype(mRequest.getContentType("file4"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.insert(gfdto);
			}
			File file5 = mRequest.getFile("file5");
			if(file5!=null) {
				GoodsFilesDto gfdto = new GoodsFilesDto();
				gfdto.setOrigin(seq);
				gfdto.setUploadname(mRequest.getOriginalFileName("file5"));
				gfdto.setSavename(mRequest.getFilesystemName("file5"));
				gfdto.setFiletype(mRequest.getContentType("file5"));
				gfdto.setFilesize(file.length());		
				
			GoodsFilesDao gfdao = new GoodsFilesDao();
				gfdao.insert(gfdto);
			}

		
	
//상세보기로

			resp.sendRedirect("goods_content.jsp?goods_no="+seq);
		}
		
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}