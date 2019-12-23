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

			list.add(dto);

		}

		con.close();
		return list;
	}

}
