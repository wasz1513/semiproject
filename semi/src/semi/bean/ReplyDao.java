package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ReplyDao {
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
	
//등록기능
	public void write(ReplyDto dto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into board_reply(no, content, writer, origin) "
							+ "values(board_reply_seq.nextval, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getContent());
		ps.setString(2, dto.getWriter());
		ps.setInt(3, dto.getOrigin());
		
		ps.execute();
		
		con.close();
	}
	
//	목록기능

	public List<ReplyDto> getList(int origin) throws Exception{
		Connection con = getConnection();

		String sql = "select * from reply where origin = ? order by no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, origin);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> list = new ArrayList<>();
		while(rs.next()) {
			ReplyDto dto = new ReplyDto();
			dto.setNo(rs.getInt("no"));
			dto.setContent(rs.getString("content"));
			dto.setWdate(rs.getString("wdate"));
			dto.setWriter(rs.getString("writer"));
			dto.setOrigin(rs.getInt("origin"));
			
			list.add(dto);
		}
		
		con.close();
		return list;
	}
	
//	삭제기능
	public void delete(int no) throws Exception{
		Connection con = getConnection();
		
		String sql = "delete reply where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		
		ps.execute();
		
		con.close();
	}
}
