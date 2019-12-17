package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerDao {

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

	public void regist(CustomerDto dto) throws Exception {
		Connection con = this.getConnection();
		
		String sql ="insert into customer values(customer_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustomer_id());
		ps.setString(2, dto.getCustomer_pw());
		ps.setString(3, dto.getCustomer_name());
		ps.setString(4, dto.getCustomer_nickname());
		ps.setString(5, dto.getCustomer_birth());
		ps.setString(6, dto.getCustomer_email());
		ps.setString(7, dto.getCustomer_phone());
		ps.setString(8, dto.getCustomer_post());
		ps.setString(9, dto.getCustomer_basic_address());
		ps.setString(10, dto.getCustomer_extra_address());
		
		ps.execute();
		
		con.close();
		
		
	}
	
}






