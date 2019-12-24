package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrdersDao {
	
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


	//배송지 저장
//	public void orderAddress(OrdersDto odto) throws Exception{
//
//		Connection con = getConnection();
//		
//		String sql = "update orders set orders_post=?, orders_basic_address=?, orders_extra_address=? where customer_id=?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, odto.getOrders_post());
//		ps.setString(2, odto.getOrders_goods_title());
//		ps.setString(3, dto.get);
//		
//		con.close();
//	}

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