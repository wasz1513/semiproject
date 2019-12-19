package semi.bean;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PointDao {
	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	
}
