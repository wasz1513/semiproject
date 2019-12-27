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
		String sql="insert into orders values(?,sysdate,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, dto.getOrders_no());
		ps.setString(2, dto.getOrders_goods_title());
		ps.setString(3, dto.getOrders_goods_seller());
		ps.setString(4, dto.getOrders_type());
		ps.setString(5, dto.getOrders_post());
		ps.setString(6, dto.getOrders_basic_address());
		ps.setString(7, dto.getOrders_extra_address());
		ps.setString(8, dto.getOrders_payment());
		ps.setInt(9, dto.getOrders_amount());
		ps.setInt(10, dto.getGoods_no());
		ps.setString(11, dto.getCustomer_id());
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
		
		String sql4="update goods set goods_buy=1 where goods_no=?";
		PreparedStatement ps4 = con.prepareStatement(sql4);
		ps4.setInt(1, dto.getGoods_no());
		ps4.execute();
		
		con.close();
	}
	
	
	//2. 구매목록 조회()
	public List<OrdersDto> history_order(String id) throws Exception{
		Connection con = getConnection();
		String sql = "select * from orders where orders_goods_buyer=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,id);
		ResultSet rs = ps.executeQuery();
		List<OrdersDto> list = new ArrayList<>();
		OrdersDto dto = null;
		while(rs.next()) {
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
			list.add(dto);
		}		
		con.close();
		return list;
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
			dto.setOrders_goods_buyer(rs.getString("orders_goods_buyer"));
			list.add(dto);
		}
		
		con.close();
		return list;
	}
	//4. id별 구매목록 출력용 메소드(전체)
	public List<OrdersDto> history_order_all(String customer_id) throws Exception{
		Connection con = getConnection();
		String sql = "select * from orders where orders_goods_buyer=? order by orders_date desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
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
			dto.setOrders_goods_buyer(rs.getString("orders_goods_buyer"));
			list.add(dto);
		}
		
		con.close();
		return list;
	}
	//4. id별 구매목록 출력용 메소드(전체)
	public List<OrdersDto> history_order_all(String start, String finish, String customer_id, String date) throws Exception{
		Connection con = getConnection();
		PreparedStatement ps = null; 		
		if(date==null) {
		String sql = "select * from(select rownum rn, a.* from(select * from orders where orders_goods_buyer=? order by orders_no desc)a) where orders_date between ? and ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.setString(2, start);
		ps.setString(3, finish);
		}else {
		String sql = "select * from(select rownum rn, a.* from(select * from orders where orders_goods_buyer=? order by orders_no desc)a) where orders_date between sysdate-? and sysdate";
		ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.setString(2, date);	
		}
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
			dto.setOrders_goods_buyer(rs.getString("orders_goods_buyer"));
			list.add(dto);
		}
		
		con.close();
		return list;
	}
	
	//4.판매목록조회
	public List<OrdersDto> history_sale(String id) throws Exception{
		Connection con = getConnection();
		String sql = "select * from goods_orders where orders_goods_seller=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,id);
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
			dto.setOrders_goods_buyer(rs.getString("orders_goods_buyer"));
			dto.setGoods_sale(rs.getInt("goods_sale"));
			list.add(dto);
		}
		
		con.close();
		return list;
	}
	
	//5. 판매요청받은 리스트
	public List<OrdersDto> history_salerequest(String id) throws Exception{
		Connection con = getConnection();
		String sql = "select * from goods_orders where orders_goods_seller=? and goods_sale=0 order by orders_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,id);
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
			dto.setGoods_sale(rs.getInt("goods_sale"));
			dto.setGoods_price(rs.getInt("goods_price"));
			dto.setOrders_goods_buyer(rs.getString("orders_goods_buyer"));
			list.add(dto);
		}
		
		con.close();
		return list;
	}
	//6. 시퀀스 생성명령
	public int seq() throws Exception{
		Connection con = getConnection();
		String sql = "select orders_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq_no = rs.getInt(1);
		con.close();
		return seq_no;
	}
	//7. 구매목록 단일조회
	public OrdersDto getOrder(int no) throws Exception{
		Connection con = getConnection();
		String sql = "select * from goods_orders where orders_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();
		OrdersDto dto = new OrdersDto();
		if(rs.next()) {
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
			dto.setGoods_sale(rs.getInt("goods_sale"));
			dto.setGoods_price(rs.getInt("goods_price"));
			dto.setOrders_goods_buyer(rs.getString("orders_goods_buyer"));
		}
		con.close();
		return dto;
	}	
}
