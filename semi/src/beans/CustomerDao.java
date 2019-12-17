package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

	//회원가입
	public void regist(CustomerDto dto) throws Exception {
		Connection con = this.getConnection();
		
		String sql ="insert into customer values(customer_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,null,sysdate,sysdate)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustomer_name());
		ps.setString(2, dto.getCustomer_birth());
		ps.setString(3, dto.getCustomer_nickname());
		ps.setString(4, dto.getCustomer_id());
		ps.setString(5, dto.getCustomer_pw());
		ps.setString(6, dto.getCustomer_phone());
		ps.setString(7, dto.getCustomer_email());
		ps.setString(8, dto.getCustomer_post());
		ps.setString(9, dto.getCustomer_basic_address());
		ps.setString(10, dto.getCustomer_extra_address());
		
		ps.execute();
		
		con.close();
		
		
	}

	//로그인
	public boolean login(String customer_id, String customer_pw) throws Exception {
		Connection con = this.getConnection();
		
		String sql = "select * from customer where customer_id = ? and customer_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.setString(2, customer_pw);
		
		ResultSet rs = ps.executeQuery();
		boolean result = rs.next();
		
		con.close();
		
		return result;
		
		
	}
	
	//단일조회
//	public  CustomerDto get(String id) throws Exception{
//		Connection con = getConnection();
//		
//		con.close();
//		
//	}
	
	
	
	//마지막 접속시간 변경
	public void updateLastLogin(String customer_id) throws Exception{
		Connection con = getConnection();
		String sql = "update customer set customer_lastlogin=sysdate where customer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.execute();
		con.close();
	}
	//회원 탈퇴
	public void withdrawal(int customer_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "delete from customer where customer_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, customer_no);
		
		ps.execute();
		con.close();
	}
	
}






