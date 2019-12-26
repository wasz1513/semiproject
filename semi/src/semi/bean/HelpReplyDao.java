package semi.bean;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HelpReplyDao {

	private static DataSource source;
	static {
		try {
			Context ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	
	
//	등록
//	이름:write
//	매개변수:writer,origin,content
//	반환형:void
	
	public void write(HelpReplyDto dto)throws Exception{
		Connection con = getConnection();
	
		String sql= "insert into reply(no, content, writer, origin) "
				+ "values(hreply_seq.nextval,?,?,?)";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setString(1, dto.getContent());
		ps.setString(2, dto.getWriter());
		ps.setInt(3, dto.getOrigin());
		
		ps.execute();
		con.close();
	}
	
	

//	목록기능
//	이름:getList
//	매개변수:origin
//	반환형:댓글목록List<HelpReplyDto>

	public List<HelpReplyDto> getList(int origin) throws Exception{
		Connection con=getConnection();
							
		String sql="select * from help_reply where origin = ? order by no asc";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, origin);

		
		ResultSet rs = ps.executeQuery();
		
		List<HelpReplyDto> list = new ArrayList<>();
		while(rs.next()) {
			HelpReplyDto dto =new HelpReplyDto();
			dto.setNo(rs.getInt("no"));
			dto.setContent(rs.getString("content"));
			dto.setHdate(rs.getString("hdate"));
			dto.setWriter(rs.getString("writer"));
			dto.setOrigin(rs.getInt("origin"));

			list.add(dto);
		}
		
		con.close();
		return list;
		
		}

	//삭제 기능
	//이름 :delete
	//매개변수:번호(no)
	//반환형:void
	public void delet(int no) throws Exception{
	Connection con  = getConnection();
	
	String sql = "delete help_reply where no = ?";
	PreparedStatement ps= con.prepareStatement(sql);
	ps.setInt(1, no);
	
	ps.execute();
		
	con.close();
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
