package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SessionVisitDao {

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
	
	public void count() throws Exception{
		Connection con = getConnection();
		String sql = "insert into visit values(sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.execute();
		con.close();
	}
	
	public int total() throws Exception{
		Connection con = getConnection();
		String sql = "select count(*) from visit";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		con.close();
		return rs.getInt(1);
		
	}
	
	public int today() throws Exception{
		Connection con = getConnection();
		String sql = "select count(*) from visit where substr(to_char(v_date), 1, 9) = to_date(sysdate, 'yy/MM/dd')";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		con.close();
		return rs.getInt(1);
	}
}
