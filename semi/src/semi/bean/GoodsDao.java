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

		String sql = "insert into goods(goods_no,goods_category,goods_title,goods_content,goods_price,customer_id, goods_readcount, goods_replycount)"
				+ " values(?,?,?,?,?,?, 0, 0)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getGoods_no());
		ps.setString(2, dto.getGoods_category());
		ps.setString(3, dto.getGoods_title());
		ps.setString(4, dto.getGoods_content());
		ps.setInt(5, dto.getGoods_price());
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

			dto = new GoodsDto(goods_no2, goods_title, goods_category, goods_content, goods_state, goods_price,
					goods_readcount, goods_replycount, goods_writetime, customer_id);

		} else {
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
		ps.setInt(1, goods_no);
		ps.execute();
		con.close();
	}
	// 상품 등록삭제
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
		String sql = "update goods set goods_category=?, goods_title=?, goods_price=?, goods_content=? where goods_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getGoods_category());
		ps.setString(2, dto.getGoods_title());
		ps.setInt(3, dto.getGoods_price());
		ps.setString(4, dto.getGoods_content());
		ps.setInt(5, dto.getGoods_no());

		ps.execute();
		con.close();

	}
	// 기본목록(인기게시글)
	public List<GoodsDto> getList(int start, int finish) throws Exception {
		Connection con = getConnection();
		String sql = "select * from(" + "select rownum rn, J.* from("
				+ " select (goods_readcount + goods_replycount) g, customer_goods.* from customer_goods"
				+ " ORDER BY G DESC)J"
				+ " )where rn between ? and ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		ResultSet rs = ps.executeQuery();
		// 변환
		List<GoodsDto> list = new ArrayList<>();
		while (rs.next()) {
			GoodsDto dto = new GoodsDto();
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
			dto.setCustomer_basic_address(rs.getString("customer_basic_address"));
			list.add(dto);
		}

		con.close();

		return list;
	}

	// 검색 + 목록
	public List<GoodsDto> search(int start, int finish, String type, String keyword) throws Exception {
		Connection con = getConnection();

		String sql = "select * from(" 
					+ "select rownum rn, A.* from(" 
					+ "select * from customer_goods where " + type
					+ " like '%'||?||'%' order by goods_no desc"
					+ ")A"
					+ ")where rn between ? and ? ";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();

		// 변환
		List<GoodsDto> list = new ArrayList<>();

		while (rs.next()) {
			GoodsDto dto = new GoodsDto();
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
			dto.setCustomer_basic_address(rs.getString("customer_basic_address"));

			list.add(dto);
		}

		con.close();

		return list;
	}

	// (기본검색)index 페이지 header부분 search 기능
	// 하나의 키워드로 상품제목, 내용, 회원 주소를 검색하여 상품 리스트를 출력하는 것.
	public List<GoodsDto> search(int start, int finish, String keyword) throws Exception {
		Connection con = getConnection();
		String sql = "select * from ("
				+ "select rownum rn, a.* from ("
				+ "select * from goods g join customer c on g.customer_id=c.customer_id)a where goods_title like '%'||?||'%' or goods_content like '%'||?||'%' or customer_basic_address like '%'||?||'%' order by goods_no desc) where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setString(2, keyword);
		ps.setString(3, keyword);
		ps.setInt(4, start);
		ps.setInt(5, finish);
		ResultSet rs = ps.executeQuery();
		List<GoodsDto> list = new ArrayList<>();
		while (rs.next()) {
			GoodsDto dto = new GoodsDto();
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
			dto.setCustomer_basic_address(rs.getString("customer_basic_address"));

			list.add(dto);
		}
		con.close();
		return list;
	}

	// 게시글 검색 글 개수 구하기
	public int getCount(String type, String keyword) throws Exception {
		Connection con = getConnection();
		boolean isSearch = type != null && keyword != null;
		String sql = "select count(*) from goods";
		if (isSearch) {
			sql += " where " + type + " like '%'||?||'%'order by goods_no desc";
		}
		PreparedStatement ps = con.prepareStatement(sql);
		if (isSearch) {
			ps.setString(1, keyword);
		}
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		return count;
	}

	public List<GoodsDto> CategorySearch(String goods_category, int start, int finish) throws Exception {
		Connection con = getConnection();

		String sql = "select * from(" 
				+ "select rownum rn, A.* from("
				+ "select * from customer_goods where goods_category=? order by goods_no desc" + ")A"
				+ ")where rn between ? and ? ";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, goods_category);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();

		// 변환
		List<GoodsDto> list = new ArrayList<>();

		while (rs.next()) {
			GoodsDto dto = new GoodsDto();
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
			dto.setCustomer_basic_address(rs.getString("Customer_basic_address"));

			list.add(dto);
		}

		con.close();

		return list;
	}
	// 댓글 수를 갱신하는 기능
	public void goods_reply_calculate(int goods_no) throws Exception {
		Connection con = getConnection();

		String sql = "update goods" + " set goods_replycount =(select count(*) from goods_reply where goods_no =?)"
				+ " where goods_no =?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, goods_no);
		ps.setInt(2, goods_no);

		ps.execute();
		con.close();
	}
	
	//키워드 검색! (관심 상품)
	public List<GoodsDto> keywordsearch(String keyword_search , int start , int finish)throws Exception{
		Connection con = getConnection();
		
		
		String	sql = "select * from(" 
				+ "select rownum rn, A.* from("
				+ "select * from customer_goods where goods_title like '%'||?||'%' order by goods_no desc" 
				+ ")A"
				+ ")where rn between ? and ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword_search);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		
		ResultSet rs = ps.executeQuery();
		
		List<GoodsDto> list = new ArrayList<>();

		while (rs.next()) {
			GoodsDto dto = new GoodsDto();
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
			dto.setCustomer_basic_address(rs.getString("customer_basic_address"));

			list.add(dto);
		}
		con.close();
		return list;
		
	}
	
	
	
	
	//키워드 검색(관심상품) 글개수 구하기
	
	public int getCount(String keyword_search) throws Exception {
		Connection con = getConnection();

//		String sql = "select count(*) from goods";
//		String sql = "select count(*) from goods where "+type+"like '%'||?||'%'" ;
		boolean isSearch = keyword_search !=null;

		String sql = "select count(*) from goods";

		if (isSearch) {
			sql += " where goods_title like '%'||?||'%'order by goods_no desc";
		}
		
		PreparedStatement ps = con.prepareStatement(sql);
	
		if (isSearch) {
			ps.setString(1, keyword_search);
		}

		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);

		con.close();

		return count;
	}
	

	public int getCustomer_files_no(int goods_no) throws Exception{
		Connection con = getConnection();
		String sql = "select * from customer_goods where goods_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, goods_no);
		ResultSet rs = ps.executeQuery();
		int customer_files_no = 0;		
		if(rs.next()) {
			int customer_no = rs.getInt("customer_no");			
			String sql2 = "select * from customer_files where origin=?";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setInt(1, customer_no);
			ResultSet rs2 = ps2.executeQuery();
			if(rs2.next()) {
				customer_files_no = rs2.getInt("customer_files_no");			
			}else {
				customer_files_no = 0;
			}
		}
		
		con.close();
		return customer_files_no;
	}

	//전체글개수
	public int getCount() throws Exception{
		Connection con = getConnection();
		String sql = "select count(*) from goods";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		return count;
	}
	
	//카테고리검색 글개수
	public int categoryCount(String goods_category) throws Exception{
		Connection con = getConnection();
		String sql = "select count(*) from goods where goods_category=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, goods_category);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		return count;
	}
	
	//메인검색창검색 글개수
	public int mainSearch(String key) throws Exception{
		Connection con = getConnection();
		String sql = "select * from goods g join customer c on g.customer_id=c.customer_id where goods_title like '%'||?||'%' or goods_content like '%'||?||'%' or customer_basic_address like '%'||?||'%'";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, key);
		ps.setString(2, key);
		ps.setString(3, key);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		return count;
	}
	
	//찜 글개수
	public int interestCount(String customer_id) throws Exception{
		Connection con = getConnection();
		String sql = "select count(*) from interest where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		return count;
	}
	
}
