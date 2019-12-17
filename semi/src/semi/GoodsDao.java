package semi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GoodsDao {
	private static DataSource source;
	static {
		try {
			Context ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}
		catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	//목록
	public List<GoodsDto> getList() throws Exception{
		Connection con = getConnection();
		
//		String sql = "select * from ("
//							+ "select rownum rn, A.* from ("
//								+ "select * from board "
//								+ "connect by prior no=superno "
//								+ "start with superno is null "
//								+ "order siblings by groupno desc, no asc"
//							+ ")A"
//						+ ") where rn between ? and ?";
		String sql = "select * from goods order by goods_no";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<GoodsDto> list = new ArrayList<>();
		while(rs.next()) {
			GoodsDto dto = new GoodsDto();
			list.add(dto);
		}
		con.close();
		return list;
		
	}
//		//변환
//		List<GoodsDto> list = new ArrayList<>();
//		
//		while(rs.next()) {
//			//rownum을 추가로 추출
//			int rn = rs.getInt("rn");
//			
//			int no = rs.getInt("no");
//			String head = rs.getString("head");
//			String writer = rs.getString("writer");
//			String wdate = rs.getString("wdate");
//			String title = rs.getString("title");
//			String content = rs.getString("content");
//			int readcount = rs.getInt("readcount");
//			int replycount = rs.getInt("replycount");
//			
//			int groupno = rs.getInt("groupno");
//			int superno = rs.getInt("superno");
//			int depth = rs.getInt("depth");
//			
//			GoodsDto dto = new GoodsDto(
//					no, title, category, content, 
//					state, readcount, replycount, writetime);
//			list.add(dto);
//		}
//		
//		con.close();
//		
//		return list;
//	}
//	
//	//검색
//	public List<GoodsDto> search(String type, String keyword, int start, int finish) throws Exception{
//		Connection con = getConnection();
//		
//		String sql = "select * from ("
//							+ "select rownum rn, A.* from("
//								+ "select * from board "
//								+ "where "+type+" like '%'||?||'%' "
//								+ "connect by prior no=superno "
//								+ "start with superno is null "
//								+ "order siblings by groupno desc, no asc"
//							+ ")A"
//						+ ") where rn between ? and ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, keyword);
//		ps.setInt(2, start);
//		ps.setInt(3, finish);
//		ResultSet rs = ps.executeQuery();
//		
//		//변환
//		List<GoodsDto> list = new ArrayList<>();
//		
//		while(rs.next()) {
//			int rn = rs.getInt("rn");
//			int no = rs.getInt("no");
//			String head = rs.getString("head");
//			String writer = rs.getString("writer");
//			String wdate = rs.getString("wdate");
//			String title = rs.getString("title");
//			String content = rs.getString("content");
//			int readcount = rs.getInt("readcount");
//			int replycount = rs.getInt("replycount");
//			int groupno = rs.getInt("groupno");
//			int superno = rs.getInt("superno");
//			int depth = rs.getInt("depth");
//			
//			GoodsDto dto = new GoodsDto(
//					rn, no, head, title, writer, wdate, 
//					readcount, replycount, content, groupno, superno, depth);
//			list.add(dto);
//		}
//		
//		con.close();
//		
//		return list;
//	}
//
//	//등록 - 새글도 등록하고 답글도 등록해야함
//	//새글일 경우 no, head, title, content가 들어있다
//	//답글일 경우 no, groupno, superno, depth, head, title, content가 들어있다
//	public void write(GoodsDto dto) throws Exception{
//		Connection con = getConnection();
//		
//		String sql = "insert into board"
//							+ "(no, head, title, writer, content, groupno, superno, depth) "
//							+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setInt(1, dto.getNo());
//		ps.setString(2, dto.getHead());
//		ps.setString(3, dto.getTitle());
//		ps.setString(4, dto.getWriter());
//		ps.setString(5, dto.getContent());
//		if(dto.getGroupno() == 0) {//새글
//			ps.setInt(6, dto.getNo());//새글 번호
//			ps.setNull(7, Types.INTEGER);//null을 설정
//			ps.setInt(8, 0);//새글은 차수가 0
//		}
//		else {//답글
//			ps.setInt(6, dto.getGroupno());//원본글 그룹번호
//			ps.setInt(7, dto.getSuperno());//원본글 번호
//			ps.setInt(8, dto.getDepth() + 1);//원본글 차수 + 1
//		}
//		
//		ps.execute();
//		
//		con.close();
//	}
//
//	//시퀀스 생성명령
//	public int getSequence() throws Exception{
//		Connection con = getConnection();
//		
//		String sql = "select board_seq.nextval from dual";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ResultSet rs = ps.executeQuery();//결과는 무조건 1개
//		rs.next();
////		int seq = rs.getInt("board_seq.nextval");
//		int seq = rs.getInt(1);
//		
//		con.close();
//		
//		return seq;
//	}
//	
//	//단일조회
//	public GoodsDto get(int no) throws Exception{
//		Connection con = getConnection();
//		
//		String sql = "select * from board where no = ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setInt(1, no);
//		ResultSet rs = ps.executeQuery();
//		
//		//ResultSet ----> BoardDto 변환
//		GoodsDto dto;
//		if(rs.next()) {
//			int no2 = rs.getInt("no");
//			String head = rs.getString("head");
//			String writer = rs.getString("writer");
//			String wdate = rs.getString("wdate");
//			String title = rs.getString("title");
//			String content = rs.getString("content");
//			int readcount = rs.getInt("readcount");
//			int replycount = rs.getInt("replycount");
//			int groupno = rs.getInt("groupno");
//			int superno = rs.getInt("superno");
//			int depth = rs.getInt("depth");
//			
//			dto = new GoodsDto(
//					no, head, title, writer, wdate, 
//					readcount, replycount, content, groupno, superno, depth);
//		}
//		else {
//			dto = null;
//		}
//		
//		con.close();
//		return dto;
//	}
//	
//	//조회수 증가
//	public void cu(int no) throws Exception{
//		Connection con = getConnection();
//		
//		String sql = "update board set readcount = readcount + 1 where no = ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setInt(1, no);
//		ps.execute();
//		
//		con.close();
//	}
//
//	//삭제
//	public void delete(int no) throws Exception{
//		Connection con = getConnection();
//		
//		String sql = "delete board where no = ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setInt(1, no);
//		ps.execute();
//		
//		con.close();
//	}
//
//	//수정
//	public void boardEdit(GoodsDto dto) throws Exception{
//		Connection con = getConnection();
//		
//		String sql = "update board set head=?, title=?, content=? where no=?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, dto.getHead());
//		ps.setString(2, dto.getTitle());
//		ps.setString(3, dto.getContent());
//		ps.setInt(4, dto.getNo());
//		
//		ps.execute();
//		
//		con.close();
//	}
//	
//	//글 개수 구하기
//	public int getCount(String type, String keyword) throws Exception{
//		Connection con = getConnection();
//		
////		String sql = "select count(*) from board";
////		String sql = "select count(*) from board where "+type+" like '%'||?||'%'";
//		boolean isSearch = type != null && keyword != null;
//		
//		String sql = "select count(*) from board";
//		if(isSearch) {
//			sql += " where "+type+" like '%'||?||'%'";
//		}
//		
//		PreparedStatement ps = con.prepareStatement(sql);
//		if(isSearch) {
//			ps.setString(1, keyword);
//		}
//		ResultSet rs = ps.executeQuery();
//		rs.next();
////		int count = rs.getInt("count(*)");
//		int count = rs.getInt(1);
//		
//		con.close();
//		
//		return count;
//	}
//	
//	//댓글 수를 갱신하는 기능
//	//이름 : calculate
//	//매개변수 : 게시글번호(no)
//	//반환형 : void
//	public void calculate(int no) throws Exception{
//		Connection con = getConnection();
//		
//		String sql = 
//				"update board "
//				+ "set replycount = (select count(*) from reply where origin = ?) "
//				+ "where no = ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setInt(1, no);
//		ps.setInt(2, no);
//		
//		ps.execute();
//		con.close();
//	}
	
}
	


