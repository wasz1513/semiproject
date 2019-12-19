package semi.bean;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	public void goods_write(GoodsDto dto) throws Exception {
		Connection con = this.getConnection();


		String sql = "insert into goods(goods_no,goods_category,goods_title,goods_content,goods_price,customer_id) values(goods_seq.nextval,?,?,?,?,?)";

	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getGoods_category());
		ps.setString(2, dto.getGoods_title());
		ps.setString(3, dto.getGoods_content());
		ps.setInt(4, dto.getGoods_price());
		ps.setString(5, dto.getCustomer_id());
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
	public GoodsDto get(int goods_no) throws Exception {
		Connection con = getConnection();

		String sql = "select * from goods where goods_no=? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, goods_no);

		ResultSet rs = ps.executeQuery();

		GoodsDto dto;
		if (rs.next()) {
			int goods_no2 = rs.getInt("goods_no");
			String goods_title = rs.getString("goods_title");
			String goods_category = rs.getString("goods_category");
			String goods_content = rs.getString("goods_content");
			String goods_state = rs.getString("goods_state");
			int goods_price = rs.getInt("goods_price");
			int goods_readcount = rs.getInt("goods_readcount");
			int goods_replycount = rs.getInt("goods_replycount");
			String goods_writetime = rs.getString("goods_writetime");
			String customer_id = rs.getString("customer_id");
			
			dto = new GoodsDto(
					goods_no, goods_title, goods_category, goods_content, 
					goods_state, goods_price, goods_readcount, 
					goods_replycount, goods_writetime, customer_id);
												
		}
		else {
			dto = null;
		}
		con.close();
		return dto;
	}


//상품 등록 조회수 증가
	public void readcountupdate(int goods_no) throws Exception {

		Connection con = getConnection();

		String sql = "update goods set goods_readcount = goods_readcount+1 where goods_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);

	ps.setInt(1,goods_no);

		ps.execute();

		con.close();
	}
	//상품 등록삭제

	public void goods_delete(int goods_no) throws Exception {
	Connection con = getConnection();
	String sql = "delete goods where goods_no =?";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, goods_no);
	ps.execute();
	
	con.close();
		
	}
//상품등록 수정
	public void goods_edit(GoodsDto dto) throws Exception {
	Connection con = getConnection();
	String sql ="update goods set goods_category=?, goods_title=?, goods_price=?, goods_content=? where goods_no=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, dto.getGoods_category());
	ps.setString(2, dto.getGoods_title());
	ps.setInt(3, dto.getGoods_price());
	ps.setString(4, dto.getGoods_content());
	ps.setInt(5, dto.getGoods_no());
	
	ps.execute();
	
	con.close();
	
		
	}

	
	//목록
	
		public List<GoodsDto> getList(int start , int finish) throws Exception{
			Connection con = getConnection();
		
		
			
		String sql =  "select * from("
				+ "select rownum rn, A.* from("
				+ "select * from goods order by goods_no desc"
				+ ")A"
				+ ")where rn between ? and ? "; 
			
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, finish);
			ResultSet rs = ps.executeQuery();
			
			//변환
			List<GoodsDto> list = new ArrayList<>() ;
			
			
			while(rs.next()) {			
				GoodsDto dto =new GoodsDto();
				dto.setRn(rs.getInt("rn"));
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
			
				list.add(dto);
			}
			
			con.close();
			
			return list;
		}
	
	
		
		//검색 + 목록
		public List<GoodsDto> search( int start , int finish , String type , String keyword) throws Exception{
			Connection con = getConnection();
		
		String sql = "select * from("
				+ "select rownum rn, A.* from("
				+ "select * from goods "
				+ "where "+type+" like '%'||?||'%' order by goods_no desc"
				+ ")A"
				+ ")where rn between ? and ? "; 
		
		
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, keyword);
				ps.setInt(2, start);
				ps.setInt(3, finish);
				ResultSet rs = ps.executeQuery();
				
				//변환
				List<GoodsDto> list = new ArrayList<>() ;
				
				
				while(rs.next()) {			
					GoodsDto dto =new GoodsDto();
					dto.setRn(rs.getInt("rn"));
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
				
					list.add(dto);
				}
				
				con.close();
				
				return list;
			}
		
		
		
			
			//페이지 카운트
			public int getCount(String type , String keyword) throws Exception{
				Connection con = getConnection();
				
//				String sql = "select count(*) from goods";
//				String sql = "select count(*) from goods where "+type+"like '%'||?||'%'" ;
				boolean isSearch = type != null && keyword != null;
				
				String sql = "select count(*) from goods";
				
				if(isSearch) {
					sql += "where"+type+"like '%'||?||'%'" ;
				}
				
				PreparedStatement ps = con.prepareStatement(sql);
				if(isSearch) {
				ps.setString(1, keyword);
				}
				
				ResultSet rs = ps.executeQuery();
				rs.next();
				int count = rs.getInt(1);
				
				con.close();
				
				return count;
			}
		
		
		
		
}
