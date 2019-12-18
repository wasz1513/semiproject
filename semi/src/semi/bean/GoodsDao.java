package semi.bean;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GoodsDao {

	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection() throws Exception {
		return source.getConnection();
	}

//상품 등록 기능
	public void write(GoodsDto dto) throws Exception {
		Connection con = this.getConnection();

		String sql = "insert into goods(goods_no,goods_category,goods_title,goods_content,goods_price,customer_id) values(?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getNo());
		ps.setString(2, dto.getCategory());
		ps.setString(3, dto.getTitle());
		ps.setString(4, dto.getContent());
		ps.setInt(5, dto.getPrice());
		ps.setString(6, dto.getCustomer_id());
		ps.execute();
		con.close();
	}

//시퀀스 생성명령
	public int getSequence() throws Exception {
		Connection con = getConnection();

		String sqlString = "select goods_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sqlString);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		con.close();
		return seq;
	}

//단일 조회
	public GoodsDto get(int no) throws Exception {
		Connection con = getConnection();

		String sql = "select *from where no=? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();

		GoodsDto dto;
		if (rs.next()) {
			dto = new GoodsDto();
			dto.setNo(rs.getInt("goods_no"));
			dto.setTitle(rs.getString("goods_title"));
			dto.setCategory(rs.getString("goods_category"));
			dto.setContent(rs.getString("goods_content"));
			dto.setState(rs.getString("goods_state"));
			dto.setPrice(rs.getInt("goods_price"));
			dto.setReadcount(rs.getInt("goods_readcount"));
			dto.setReplycount(rs.getInt("goods_replycount"));
			dto.setWritetime(rs.getString("goods_writetime"));
			dto.setCustomer_id(rs.getString("customer_id"));
		} else {
			dto = null;
		}
		con.close();
		return dto;
	}
////조회수 증가
//public void readcountupdate()

}
