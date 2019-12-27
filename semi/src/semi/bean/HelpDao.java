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

public class HelpDao {
	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return source.getConnection();
	}

	

	// 등록
	public void write(HelpDto dto) throws Exception {
		Connection con = getConnection();

		String sql = "insert into help(board_NO,head,reply,write,content,hdate) "
				+ "values(?,?,null,?,?,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getBoard_NO());
		ps.setString(2, dto.getHead());
		ps.setString(3, dto.getWrite());
		ps.setString(4, dto.getContent());

		ps.execute();

		con.close();
	}

//	시퀀스 생성
	public int getSequence() throws Exception{
		Connection con = getConnection();
		
		String sqlString= "select help_seq.nextval from dual";
		PreparedStatement ps =con.prepareStatement(sqlString);
		ResultSet rs =ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		con.close();
		return seq;
	}
				
	
	//id로 내 글만보이기  목록
	//기능:글 보이기
	//이름:getList
	//매개변수:string write
	//반환형:list
	
	public List<HelpDto> getList(String write) throws Exception {
		Connection con = getConnection();
		String sql = "select * from help where write=? order by board_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,write);
		ResultSet rs = ps.executeQuery();

		// 변환
		List<HelpDto> list = new ArrayList<>();

		while (rs.next()) {
			HelpDto dto = new HelpDto();

			dto.setBoard_NO(rs.getInt("board_NO"));
			dto.setHdate(rs.getString("hdate"));
			dto.setContent(rs.getString("content"));
			dto.setHead(rs.getString("head"));

			String sql2 = "select * from help_total where origin=?";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setInt(1, rs.getInt("board_no"));
			ResultSet rs2 = ps2.executeQuery();
			if(rs2.next()) {
				dto.setNo(rs2.getInt("no"));
				dto.setOrigin(rs2.getInt("origin"));
				dto.setReply_content(rs2.getString("reply_content"));
				dto.setReply_hdate(rs2.getString("reply_hdate"));
				dto.setWriter(rs2.getString("writer"));
			}
			list.add(dto);

		}

		con.close();
		return list;
	}
	
	
	//기능:전체 회원글 보이기(관리자 페이지)
	//이름:getAdminList
	//매개변수:
	//반환형:list
	public List<HelpDto> getAdminList(int start,int finish) throws Exception {
		Connection con = getConnection();
	
		String sql = "select * from("
						+ "select rownum rn, A.*from("
							+ "select * from help order by board_no desc"
						+ ")A"
					+ ")where rn between ? and ?";
				
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		
		ResultSet rs = ps.executeQuery();

		// 변환
		List<HelpDto> list = new ArrayList<>();

		while (rs.next()) {
			//rownum을 추가로 추출
			HelpDto adto = new HelpDto();
			adto.setBoard_NO(rs.getInt("board_no"));
			adto.setContent(rs.getString("content"));
			adto.setHdate(rs.getString("hdate"));
			adto.setHead(rs.getString("head"));
			adto.setWrite(rs.getString("write"));
			
			String sql2 = "select * from help_total where origin=?";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setInt(1, rs.getInt("board_no"));
			ResultSet rs2 = ps2.executeQuery();
			if(rs2.next()) {
				adto.setNo(rs2.getInt("no"));
				adto.setOrigin(rs2.getInt("origin"));
				adto.setReply_content(rs2.getString("reply_content"));
				adto.setReply_hdate(rs2.getString("reply_hdate"));
				adto.setWriter(rs2.getString("writer"));
			}
			
			list.add(adto);
		}
		

		con.close();
		return list;
	}
	
	//검색
		public List<HelpDto> search(String type, String keyword, int start, int finish) throws Exception{
			Connection con = getConnection();
			
			String sql =  "select * from("
					+ "select rownum rn, A.* from("
					+ "select * from help "
					+ "where "+type+" like '%'||?||'%' order by board_no desc"
					+ ")A"
					+ ")where rn between ? and ? "; 
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ps.setInt(2, start);
			ps.setInt(3, finish);
			ResultSet rs = ps.executeQuery();
			
			List<HelpDto> list = new ArrayList<>();
			
			while(rs.next()) {
				HelpDto dto = new HelpDto();
				dto.setRn(rs.getInt("rn"));
				dto.setBoard_NO(rs.getInt("board_no"));
				dto.setHead(rs.getString("head"));
				dto.setReply(rs.getString("reply"));
				dto.setWrite(rs.getString("write"));
				dto.setContent(rs.getString("content"));
				dto.setHdate(rs.getString("hdate"));
				list.add(dto);
			}
			
			con.close();
			return list;
			
		}
		//글개수
		public int getCount(String type,String keyword)throws Exception{
			Connection con =getConnection();
			
			boolean isSearch = type != null && keyword != null;
			
			String sql = "select count(*) from help";
			if(isSearch) {
				sql += " where "+type+" like '%'||?||'%'";
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
