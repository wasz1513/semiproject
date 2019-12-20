package semi.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	
	//저장
	public Connection getConnection() throws Exception {
		return source.getConnection();
	}

	
	public void edit(GoodsFilesDto dto )throws Exception{
		Connection con = this.getConnection();
		String sql = "insert into help_files values(goods_files_seq.nextval,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getOrigin());
		ps.setString(2, dto.getUploadname());
		ps.setString(3, dto.getSavename());
		ps.setString(4, dto.getFiletype());
		ps.setLong(5, dto.getFilesize());
		ps.execute();
		con.close();
	}
}
