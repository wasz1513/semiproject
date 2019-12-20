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
			InitialContext ctx=new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return source.getConnection();
	}

	
	
	//목록
	public List<HelpDto> getList() throws Exception {
		Connection con = getConnection();
//		String sql = "select*from board order by no desc";
		String sql = "select * from help order by board_NO desc";
		PreparedStatement ps = con.prepareStatement(sql);
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


//등록
	public void write(HelpDto dto) throws Exception {
		Connection con =getConnection();
		
		String sql="insert into help(board_NO,head,reply,write,content,hdate) "
				+ "values(help_seq.nextval,?,null,?,?,sysdate)";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setString(1, dto.getHead());
		ps.setInt(2, dto.getWrite());
		ps.setString(3, dto.getContent());

		
		ps.execute();
		
		con.close();
	}

}
