package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class InterestDao {

	private static DataSource source;
	static {
		try {
			Context ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return source.getConnection();
	}
	
	public void insert(String customer_id, int goods_no) throws Exception{
		Connection con = getConnection();
		String sql = "insert into interest values(interest_seq.nextval, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.setInt(2, goods_no);
		ps.execute();
		con.close();
	}
	
	public void remove(String customer_id, int goods_no) throws Exception{
		Connection con = getConnection();
		String sql = "delete interest where goods_no=? and customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, goods_no);
		ps.setString(2, customer_id);
		ps.execute();
		con.close();
	}
	
	public List<GoodsDto> getList(String customer_id, int start, int finish) throws Exception{
		Connection con = getConnection();
		String sql = "select * from("
				+ "select * from("
				+ "select rownum R, G.* from interest I "
				+ "inner join goods G on I.goods_no = G.goods_no where I.customer_id=? order by I.interest_no desc)"
				+ " where R between ? and ?) T "
				+ "inner join customer C on T.customer_id=c.customer_id";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		List<GoodsDto> list = new ArrayList<>();
		while(rs.next()) {
			GoodsDto dto = new GoodsDto();
			dto.setCustomer_id(rs.getString("customer_id"));
			dto.setGoods_no(rs.getInt("goods_no"));
			dto.setGoods_price(rs.getInt("goods_price"));
			dto.setGoods_readcount(rs.getInt("goods_readcount"));
			dto.setGoods_replycount(rs.getInt("goods_replycount"));
			dto.setGoods_writetime(rs.getString("goods_writetime"));
			dto.setGoods_title(rs.getString("goods_title"));
			dto.setGoods_category(rs.getString("goods_category"));
			dto.setGoods_content(rs.getString("goods_content"));
			dto.setGoods_state(rs.getString("goods_state"));
			dto.setCustomer_basic_address(rs.getString("customer_basic_address"));
			list.add(dto);
		}
		con.close();
		return list;
	}
	
	public boolean check(String customer_id, int goods_no) throws Exception{
		Connection con = getConnection();
		String sql = "select * from interest where customer_id=? and goods_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.setInt(2, goods_no);
		ResultSet rs = ps.executeQuery();
		boolean result = rs.next();
		con.close();
		return result;
	}
}

