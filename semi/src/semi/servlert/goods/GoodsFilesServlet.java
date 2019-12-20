package semi.servlert.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jdk.internal.org.objectweb.asm.tree.MultiANewArrayInsnNode;
import semi.bean.GoodsDto;
@WebServlet(urlPatterns = "/goods/goods_write.do")
public class GoodsFilesServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	String path = "D:/upload/kh23/goods";
	int size = 10*1024*1024;
	String encoding = "UTF-8";
	
	MultipartRequest mRequest = new MultipartRequest(req, path, size, encoding,new DefaultFileRenamePolicy());
	GoodsDto dto = new GoodsDto();
//	dto.setGoods_no(goods_no);
	
	
} catch (Exception e) {
	
}
	
}
}
