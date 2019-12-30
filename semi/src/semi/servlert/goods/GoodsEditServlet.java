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

@WebServlet(urlPatterns = "/goods/goods_edit.do")
public class GoodsEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String path = "D:/upload/kh23/goods";
			int size = 10*1024*1024;
			String encoding = "UTF-8";
			
			MultipartRequest mRequest = new MultipartRequest(req, path, size, encoding,new DefaultFileRenamePolicy());
			
	//	System.out.println(Integer.parseInt(req.getParameter("goods_no")));
			GoodsDto dto = new GoodsDto();
			dto.setGoods_no(Integer.parseInt(mRequest.getParameter("goods_no")));
			dto.setGoods_category(mRequest.getParameter("goods_category"));
			dto.setGoods_title(mRequest.getParameter("goods_title"));
			dto.setGoods_price(Integer.parseInt(mRequest.getParameter("goods_price")));
			dto.setGoods_content(mRequest.getParameter("goods_content"));
			
			int existence0 = Integer.parseInt(mRequest.getParameter("existence0"));
//			0> or 0=0
			int existence1 = Integer.parseInt(mRequest.getParameter("existence1"));
			int existence2 = Integer.parseInt(mRequest.getParameter("existence2"));
			int existence3 = Integer.parseInt(mRequest.getParameter("existence3"));
			int existence4 = Integer.parseInt(mRequest.getParameter("existence4"));
			
			
			
			GoodsDao dao = new GoodsDao();
			int seq = dao.getSequence();
			dto.setGoods_no(seq);
			dao.goods_edit(dto);
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
				if(existence0>0) {
					gfdao.update(gfdto);
				}else {
					gfdao.insert(gfdto);					
				}
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
				if(existence1>0) {
					gfdao.update(gfdto);
				}else {
					gfdao.insert(gfdto);					
				}
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
				if(existence2>0) {
					gfdao.update(gfdto);
				}else {
					gfdao.insert(gfdto);					
				}
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
				if(existence3>0) {
					gfdao.update(gfdto);
				}else {
					gfdao.insert(gfdto);					
				}
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
				if(existence4>0) {
					gfdao.update(gfdto);
				}else {
					gfdao.insert(gfdto);					
				}
			}
			
			
			//상세보기
			resp.sendRedirect("goods_content.jsp?goods_no="+dto.getGoods_no());
			
		} 
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
