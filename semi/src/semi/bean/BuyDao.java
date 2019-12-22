package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BuyDao {
	
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

	public void paymentFinish(BuyDto dto) throws Exception{

		Connection con = getConnection();
		
		String sql = "update goods set goods_state='판매완료' where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, dto.c());
		
		con.close();
	}

	//구매 신규배송 주소
//	public void buyNewAddress(BuyDto dto) throws Exception{
//		
//		Connection con = getConnection();
//		
//		String sql = "update buytest set buy_post=?, buy_basic_address=?,buy_extra_address=? where customer_no =?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1,dto.getBuy_post());
//		ps.setString(2, dto.getBuy_basic_address());
//		ps.setString(3, dto.getBuy_extra_address());
//		ps.setInt(4, dto.getCustomer_no());
//		
//	
//		
//		con.close();
//			
//	}

	
	
	

}
