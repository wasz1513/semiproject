package semi.bean;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GoodsReplyDao {

	private static DataSource source;
	static {
		try {
			Context ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	//등록기능
	//이름 :goods_reply_write
	//매개변수:goods_reply_content,goods_reply_writer,goods_no ==ReplyDto
	public void goods_reply_write(GoodsReplyDto dto)throws Exception{
		Connection con = getConnection();
		String sql = "insert into goods_reply(goods_reply_no, goods_reply_content, goods_reply_writer,goods_no)"
				+ "values(goods_reply_seq.nextval,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getGoods_reply_content());
		ps.setString(2, dto.getGoods_reply_writer());
		ps.setInt(3, dto.getGoods_no());
		
		ps.execute();
		
		con.close();
	}
	
	//목록기능
	//	이름 :Goods_reply_getList
	//매개변수 : 게시글 번호 (googs_no)
// 
	public List<GoodsReplyDto>goods_reply_getList(int goods_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "select *from goods_reply where goods_no = ? order by goods_reply_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, goods_no);
		ResultSet rs = ps.executeQuery();
		List<GoodsReplyDto> list = new ArrayList<>();
		while(rs.next()) {
			GoodsReplyDto dto = new GoodsReplyDto();
			dto.setGoods_reply_no(rs.getInt("goods_reply_no"));
			dto.setGoods_reply_content(rs.getString("goods_reply_content"));
			dto.setGoods_reply_writetime(rs.getString("goods_reply_writetime"));
			dto.setGoods_reply_writer(rs.getString("goods_reply_writer"));
			dto.setGoods_no(rs.getInt("goods_no"));
		}
		con.close();
		return null;
		
	}
	//삭제 기능
	//이름 : Goods_reply_delete
	//매개변수:goods_reply_no
	public void goods_reply_delete(int goods_reply_no) throws Exception{
	Connection con  = getConnection();
	
	String sql = "goods_reply_delete goods_reply where goods_reply_no = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.execute();
	
	con.close();
	}
	
}