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
	
	public List<InterestDto> getList(String customer_id) throws Exception{
		Connection con = getConnection();
		String sql = "select * from interest where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ResultSet rs = ps.executeQuery();
		List<InterestDto> list = new ArrayList<>();
		while(rs.next()) {
			InterestDto dto = new InterestDto();
			dto.setCustomer_id(rs.getString("customer_id"));
			dto.setGoods_no(rs.getInt("goods_no"));	
			dto.setInterest(rs.getInt("interest_no"));
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

