//package semi.bean;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.naming.Context;
//import javax.naming.InitialContext;
//import javax.naming.NamingException;
//import javax.sql.DataSource;
//
//public class HelpreplyDao {
//	
//	private static DataSource source;
//	static {
//		try {
//			Context ctx = new InitialContext();
//			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
//		}
//		catch(NamingException e) {
//			e.printStackTrace();
//		}
//	}
//
//	
//	//등록
//	public void write(HelpreplyDto dto) throws Exception{
//		Connection con=getConnection();
//		
//		String sql="insert into reply(no,content) "
//				+ "values(reply_seq.nextval,?)";
//		PreparedStatement ps=con.prepareStatement(sql);
//		ps.setString(1, getContent());
//		
//		ps.execute();
//		
//		con.close();
//	}
//	
//	//목록 origin
//	public List<HelpreplyDto>getList(int origin) throws Exception{
//		Connection con = getConnection();
//		
//		String sql="select * from reply where origin =? order by no asc";
//		PreparedStatement ps=con.prepareStatement(sql);
//		ps.setInt(1, origin);
//		ResultSet rs= ps.executeQuery();
//		
//		List<HelpreplyDto>list =new ArrayList<>();
//		while(rs.next()) {
//			HelpreplyDto dto=new HelpreplyDto();
//			dto.setNo(rs.getInt("no"));
//			dto.setContent(rs.getString("count"));
//			dto.setHdate(rs.getString("hdate"));
//			dto.setOrigin(rs.getString("origin"));
//			
//		}
//		
//		con.close();
//		return null;
//		
//		
//	}
//	
//	
//	
//	
//	
//	
//}
