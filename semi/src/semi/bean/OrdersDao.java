package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

//	필요한 기능
//	1. 구매시 구매 히스토리 전량 저장
	public void insert_buy(OrdersDto dto) throws Exception{
		Connection con = getConnection();
		String sql="insert into orders values(orders_seq.nextval,sysdate,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getOrders_goods_title());
		ps.setString(2, dto.getOrders_goods_seller());
		ps.setString(3, dto.getOrders_type());
		ps.setString(4, dto.getOrders_post());
		ps.setString(5, dto.getOrders_basic_address());
		ps.setString(6, dto.getOrders_extra_address());
		ps.setString(7, dto.getOrders_payment());
		ps.setInt(8, dto.getOrders_amount());
		ps.setInt(9, dto.getGoods_no());
		ps.setString(10, dto.getCustomer_id());
		ps.execute();
		
		ps.close();
		
		String sql2="update customer set customer_point=customer_point-? where customer_id=?";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setInt(1, dto.getCustomer_point());
		ps2.setString(2, dto.getCustomer_id());
		ps2.execute();
		
		ps2.close();
		
		String sql3="insert into point values(point_seq.nextval,0,null,null,?,sysdate,'포인트사용',?)";
		PreparedStatement ps3 = con.prepareStatement(sql3);
		ps3.setInt(1, dto.getCustomer_point());
		ps3.setInt(2, dto.getCustomer_no());
		ps3.execute();
		
		con.close();
		
	}
	//2. 단일목록 조회()
	public OrdersDto history_order(String id) throws Exception{
		Connection con = getConnection();
		String sql = "select * from orders where orders_goods_buyer=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,id);
		ResultSet rs = ps.executeQuery();
		OrdersDto dto = null;
		if(rs.next()) {
			dto = new OrdersDto();
			dto.setOrders_no(rs.getInt("orders_no"));
			dto.setOrders_goods_buyer(rs.getString("orders_goods_buyer"));
			dto.setOrders_goods_title(rs.getString("orders_goods_title"));
			dto.setOrders_goods_seller(rs.getString("orders_goods_seller"));
			dto.setOrders_date(rs.getString("orders_date"));
			dto.setOrders_type(rs.getString("orders_type"));
			dto.setOrders_post(rs.getString("orders_post"));
			dto.setOrders_basic_address(rs.getString("orders_basic_address"));
			dto.setOrders_extra_address(rs.getString("orders_extra_address"));
			dto.setOrders_payment(rs.getString("orders_payment"));
			dto.setOrders_amount(rs.getInt("orders_amount"));
			dto.setGoods_no(rs.getInt("goods_no"));
		}
		
		con.close();
		return dto;
	}
	//3. 전체 목록 조회
	public List<OrdersDto> history_order_all() throws Exception{
		Connection con = getConnection();
		String sql = "select * from orders";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<OrdersDto> list = new ArrayList<>();
		
		while(rs.next()) {
			OrdersDto dto = new OrdersDto();
			dto.setOrders_no(rs.getInt("orders_no"));
			dto.setOrders_goods_title(rs.getString("orders_goods_title"));
			dto.setOrders_goods_seller(rs.getString("orders_goods_seller"));
			dto.setOrders_date(rs.getString("orders_date"));
			dto.setOrders_type(rs.getString("orders_type"));
			dto.setOrders_post(rs.getString("orders_post"));
			dto.setOrders_basic_address(rs.getString("orders_basic_address"));
			dto.setOrders_extra_address(rs.getString("orders_extra_address"));
			dto.setOrders_payment(rs.getString("orders_payment"));
			dto.setOrders_amount(rs.getInt("orders_amount"));
			dto.setGoods_no(rs.getInt("goods_no"));
			dto.setCustomer_id(rs.getString("customer_id"));
			list.add(dto);
		}
		
		con.close();
		return list;
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
