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

		String sql= "insert into help_reply(no, content, writer, origin) "
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

	public List<HelpReplyDto> getList(int origin ,int start, int finish) throws Exception{
		Connection con=getConnection();
							//여기밑에 help_reply
		String sql="select * from ("
				+ "select rownum rn, A.* from ("
				+ "select * from help_reply "
				+ "where ? order by no asc "  ///수정할것
				+ "start with superno is null "
				+ "order siblings by groupno desc, no asc"
			+ ")A"
		+ ") where rn between ? and ?";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, origin);
		ps.setInt(2, start);
		ps.setInt(3, finish);

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
	
	//검색
	public List<HelpReplyDto> search(String type,String keyword) throws Exception{
		Connection con = getConnection();
		//
		String sql = "select*from help_reply "
				+ "where " +type+" like '%'||?||'%' order by no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		//
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
}