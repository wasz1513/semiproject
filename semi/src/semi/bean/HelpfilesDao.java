package semi.bean;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class HelpfilesDao {
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

	
	//등록
	//기능:등록하기
	//이름:get
	
}
